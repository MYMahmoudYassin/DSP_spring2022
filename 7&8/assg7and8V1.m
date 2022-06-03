clear all; close all; clc;

%Define desired characteristics
M=102;  %Filter order
N=M+1;  %Length of the FFT?
wp=0.3*pi;  %Passband frequency
ws=0.35*pi; %Rejection frequency (there's a better term for sure)
wc=(wp+ws)*0.5;  %Cutoff frequency
delta_p=0.01;  %I won't even try
delta_s=0.001;
epsilon = 1e-5;  %Note: This is NOT defined in the assignment!


W=linspace(-pi,pi,N);  %Valied range of frequencies 
H_ideal=rectangularPulse(-wc,wc,W);  %Response of the ideal low-pass filter
% plot(W,H_ideal)
% oldparam = sympref('HeavisideAtOrigin',1);
% syms k r
% u(k) = heaviside(k);
% rect(r) = u(k-r) * u(-(k-r));

phi=-((N-1)/2).*W;  %Phi :)
% Phi= @(k)-((N-1)/2)*k;
G=H_ideal;  %Initial value of the filter

%% Pc3; Projection of G onto C3

window_ws=1-rectangularPulse(-ws,ws,W);  %Used to limit w to w_s
temp1=1:N;
indx1=temp1(window_ws==1);  %w in w_s 
% plot(W,window_ws)
G_temp=G;  %Temporary of G3
% G_window_ws=G.*window_ws;
for i=1:length(indx1)  %Cycle through all w in w_s
    ii = indx1(i);  %w in w_s
    if abs(G(ii)) > delta_s
        G_temp(ii)=(delta_s .* G(ii))./abs(G(ii));
    end
end

% plot(W,G_temp)
G3 = G_temp;  %The projection of G onto C3
%% Pc2; The projection of G3 onto C2

window_wp=rectangularPulse(-wp,wp,W);  %Used to limit w to w_p
temp1=1:N;
indx1=temp1(window_wp==1);  %w in w_p
% plot(W,window_wp)
G_temp=G3;  %Temporary value of G2
% G_window_ws=G.*window_ws;
for i=1:length(indx1)  %Cycle through all w in w_p
    ii = indx1(i);  %w in w_p
    Condition=abs(G_temp(ii)).*cos(angle(G_temp(ii))-phi(ii));
    if Condition > 1+delta_p
        G_temp(ii)=(delta_p+1).*exp(1j.*phi(ii));
    elseif Condition <= 1-delta_p
        G_temp(ii)=(1-delta_p).*exp(1j.*phi(ii));
    else
        G_temp(ii)=Condition.*exp(1j.*phi(ii));
    end
end

% plot(W,G_temp)
G2 = G_temp;  %The projection of G3 onto C2
%% Pc1; %The projection of G2 onto C1
G_temp=G2;  %Temporary value of G1
g_temp=ifft(G_temp); %Inverse FFT
g_temp = (g_temp + g_temp(end:-1:1)) / 2; %Projection of g2 into C1
g1 = g_temp;  %Projection of g2 into C1

h_k = ifft(H_ideal);
h_k1 = g1;

error = norm((h_k1 - h_k), 2)