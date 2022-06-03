%Assignment 5
% Done by Mahmoud Yassin Mahmoud
% ID: 202113650
% Submitted To Dr. Wail A. Mousa
% Bism Allah and I will start with 
%(Q1):
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
clc;
clear;
%------------------------------------------------
%defining time
syms w
n1 = -5:-1;
n2 = 0:2;
n3 = 3:5;
n = [n1 n2 n3] ;

%----------------------------------------------
h = [1/3 1/3 1/3];
hno =[zeros(1,length(n1)) h zeros(1,length(n3))]; %calculations of h[n]


%------------------------------------------------
H = sum(hno.*exp(-j*w*n));% H(w)

%-----------------------------------------------
%ploting
subplot(311)
   stem(n, hno)
   title('plot of h[n]')
   xlabel('n')
   ylabel('h[n]')
   grid minor

subplot(312)
   ezplot(abs(H), [-pi pi])
   grid minor
   title('Magnitude of DTFT')
   ylim([-0.5 1.5]);

subplot(313)
   w1=-pi:(2*pi/512):pi-(2*pi/512); %Define w1 to be of 512 points.
   L = subs(H,w,w1);
   plot(w1, angle(L));
   grid minor
   xlim([-pi pi])
   ylim([-5 5])
   title('Phase of DTFT')


