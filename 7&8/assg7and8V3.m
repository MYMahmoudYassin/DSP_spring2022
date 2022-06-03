clear all; close all; clc;

%Define desired characteristics
M=102;  %Filter order
N=(M+1000-1);  %Length of the FFT? % I incread N for better resolution
wp=0.3*pi;  %Passband frequency
ws=0.35*pi; %Stopband frequency 
wc=(wp+ws)*0.5;  %Cutoff frequency
delta_p=0.01;  %I won't even try
delta_s=0.001;
epsilon = 0;  %Note: This is NOT defined in the assignment!
iterMax = 100; %Maximum number of iterations

W=linspace(-pi,pi,N);  %Valid range of frequencies (Should Pi be used?)
H_ideal=rectangularPulse(-wc,wc,W);  %FFTShift Response of the ideal low-pass filter

phi=-((N-1)/2)*W;  %Phi :)
% Phi= @(k)-((N-1)/2)*k;
g = sin(0:N-1)/50;
G=H_ideal;  %Initial value of the filter
% G = fft(g);
error = 1e10; %Initial value of the error
counter = 0;
%%
%% Pc3; Projection of G onto C3

while error > epsilon && counter < iterMax

    window_ws=1-rectangularPulse(-ws,ws,W);  %Used to limit w to w_s
    temp1=1:N;
    indx1=temp1(window_ws==1);  %w in w_s
    G_temp3=G;  %Temporary of G3
    for i=1:length(indx1)  %Cycle through all w in w_s
        ii = indx1(i);  %w in w_s
        if abs(G(ii)) > delta_s
            G_temp3(ii)=(delta_s*G(ii))./abs(G(ii));
        end
    end

    G3 = G_temp3;  %The projection of G onto C3


%% Pc2; The projection of G3 onto C2
    window_wp=rectangularPulse(-wp,wp,W);  %Used to limit w to w_p
    temp2=1:N;
    indx2=temp2(window_wp==1);  %w in w_p
    G_temp2=G3;  %Temporary value of G2
    for i=1:length(indx2)  %Cycle through all w in w_p
        ii = indx2(i);  %w in w_p
        Condition=abs(G_temp2(ii)).*cos(angle(G_temp2(ii))-phi(ii));
        if Condition >= 1+delta_p
            G_temp2(ii)=(delta_p+1)*exp(1j*phi(ii));
        elseif Condition <= 1-delta_p
            G_temp2(ii)=(1-delta_p)*exp(1j*phi(ii));
        else
            G_temp2(ii)=Condition*exp(1j*phi(ii));
        end
    end

    G2 = G_temp2;  %The projection of G3 onto C2

    
%% Pc1; %The projection of G2 onto C1
    G_temp=G2;  %Temporary value of G1
%     g_temp=fftshift(ifft(fftshift(G_temp))); %Inverse FFT (For some reason, the extra fftshift gives out more pleasing results)
    g_temp = ifft(G_temp);
    g_temp = (g_temp + g_temp(end:-1:1)) / 2; %Projection of g2 into C1
    g1 = g_temp;  %Projection of g2 into C1

    h_k = ifft(G);
    h_k1 = g1;
    G = fft(g1);  %Should fftshift be applied here?

    
    if mod(counter,10)==0
        disp("Counter =" + num2str(counter))
        error = norm((h_k1 - h_k), 2)
    end

    counter = counter + 1;

end
%%
figure
plot(W, 20*log10(abs(G)), "LineWidth",1.5, "Color",'r')
ylim([-300, 10])
set(gca,'XTick',-pi:pi/2:pi) 
set(gca,'XTickLabel',{'-\pi','-\pi/2','0','\pi/2','\pi'})
ylabel('$20\log(|H(\omega)|)$','Interpreter','latex')
xlabel('$\omega$','Interpreter','latex')
figure
plot(W, unwrap(angle(G)), "LineWidth",1.5, "Color",'r')
set(gca,'XTick',-pi:pi/2:pi) 
set(gca,'XTickLabel',{'-\pi','-\pi/2','0','\pi/2','\pi'})
ylabel('$\angle H(\omega)$','Interpreter','latex')
xlabel('$\omega$','Interpreter','latex')