% In the name of Allah
clc;
clear;
close all;

% Define the frequencies
fmax = 5000; 
fs = 20*fmax;
f= linspace(0,fmax,20);

% Time index
ts = 1/fs;
n = -0.1:ts:0.1;
M= length(n);

% Define omega and the desired filter
w= linspace(-pi,pi,M);
fo1= fmax/2;
fo2= 2*fmax/3;
Hd= zeros(M, 1);

% Filter type: 0 = lowpass - 1: bandpass
filter_type = 1;
if filter_type == 0
    Hd(abs(w)<= pi*fo1/fmax)= 1;
else
    Hd(w > pi*fo1/fmax) = 1;
    Hd(w > pi*fo2/fmax) = 0;
    Hd(w < -pi*fo1/fmax) = 1;
    Hd(w < -pi*fo2/fmax) = 0;
end


% Plot the desired filter
figure; 
stem(w/pi,Hd);
title('Hd'); %xlim([0, w(end)/pi]);

% Define the input signal
u = zeros(M, 1);
u(n == 0) = 1e9;
Uf= fftshift(fft(u));

% Plot the input signal
figure; 
subplot(1, 2, 1);
plot(n, u)
title('Input Signal'); 
subplot(1, 2, 2);
stem(w/pi, abs(Uf))
title('Frequency Response of the Input Signal'); 

% Obtain the output signal
Y_f= Uf.*Hd; 
y= abs(ifft(ifftshift(Y_f))); 

% Plot the output signal
figure;
subplot(1, 2, 1);
plot(n, y); 
title('Ouput Signal'); 
subplot(1, 2, 2);
stem(w/pi, abs((Y_f))); 
title('Frequency Response of the Output Signal'); 

%%
N= 2;

p = 100 * eye(N);
o = randn(N,1); 

% u = circshift(u,N+1);
% y = circshift(y,N+1);

for k=N/2+1:length(n)
    for i=1:1
        h = [-y((k-1):-1:(k-N/2)); u((k-1):-1:(k-N/2))];
        yh = h'*o;
        e = y(k)-yh;
        K = p*h/(1+h'*p*h);
        p = (eye(N)-K*h')*p;
        o = o+e*K;
    end
end

%%
a = [1 ; o(1:end/2)];
b = o(end/2+1:end);
figure;
freqz(b,a);
title('Frequnecy Response of the Designed Filter')

