%Assignment 6
% Done by Mahmoud Yassin Mahmoud
% ID: 202113650
% Submitted To Dr. Wail A. Mousa
% Bism Allah and I will start with 
%(Q1):
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
clc;
clear;
%------------------------------------------------
n1=0:2000;
u=ones(size(n1));
u10=[zeros(1,10) ones(size(n1)-[0 10])];
u1000=[zeros(1,1000) ones(size(n1)-[0 1000])];
x1=u-u10;
x2=u-u1000;
N1=16;
N2=1024;
%------------------------------------
%DFT calculations
%-------------------------------------
%16-point DFT for x1 
tStart_x1_DFT_16 = tic; 
for k=0:N1-1
    for n=0:N1-1
      X1_16_point(n+1) = x1(n+1) *exp(-j*2*pi*k*n/N1);
    end
 Xk1_DFT_16_point (k+1) = sum(X1_16_point); 
end
tEnd_x1_DFT_16 = toc(tStart_x1_DFT_16)
%______________________________________________
%1024-point DFT for x2
tStart_x2_DFT_1024 = tic; 
for k=0:N2-1
    for n=0:N2-1
      X2_1024_point(n+1) = x2(n+1) *exp(-j*2*pi*k*n/N2);
    end
 Xk2_DFT_1024_point (k+1) = sum(X2_1024_point); 
end
tEnd_x2_DFT_1024 = toc(tStart_x2_DFT_1024)
%_______________________________________________
%FFT calculations
%-----------------------
%16-point FFT for x1 

tStart_x1_FFT_16 = tic; 
   Xk1_FFT_16_point=fft(x1,N1);
tEnd_x1_FFT_16 = toc(tStart_x1_FFT_16)
 
%16-point FFT for x2 
 
tStart_x2_FFT_1024 = tic; 
   Xk2_FFT_1024_point=fft(x2,N2);
tEnd_x2_FFT_1024 = toc(tStart_x2_FFT_1024)
  