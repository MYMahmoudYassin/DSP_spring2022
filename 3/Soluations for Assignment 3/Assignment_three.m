%Assignment 3
% Done by Mahmoud Yassin Mahmoud
% ID: 202113650
% Submitted To Dr. Wail A. Mousa
% Bism Allah and I will start with 
%(Q1): 
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
clc;
clear;
%--------------------------------------------------------
%defining time
n1 = -3:-1;% defining -ve range
n2 = 0:15;% defining +ve range
n =[n1 n2]; % combined range
N2 = length(n2);% length of positive range
N = length(n);
%-----------------------------------------------------------
a = [1 -0.8];% the coefficients a[k] of the output signal y(n) 
b = [5];% the coefficients b[k] of the input signal x(n)
x = [zeros(1,length(n1)) 2 -3 0 2 zeros(1,N2-4)]; % the x(n) is zero padded to define it for -3=<n=<15
y = filter(b,a,x);
%-------------------------------------------------------
% Plotting
subplot(221)
  stem(n,x);
  legend('x[n]')
     grid minor
     title('x(n) = 2\delta(n)-3\delta(n-1)+2\delta(n-3)')
     xlabel('-3< n < 15') 
     ylabel('x(n)')
subplot(222)
  stem(n,y);
  legend('y(n)')
     grid minor
     title(['y(n) = 0.8y(n-1)+5x(n)'])
     xlabel('-3< n < 15') 
     ylabel('y(n)') 
%-----------------------------------------------------
% creating table
n= n.';
x= x.';
y= y.';
Results = table(n,x,y)


