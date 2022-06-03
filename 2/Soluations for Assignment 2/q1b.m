%Assignment 1 
% Done by Mahmoud Yassin Mahmoud
% ID: 202113650
% Submitted To Dr. Wail A. Mousa
% Bism Allah and I will start with 
%(Q1b): 
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
clc;
clear;
%.....................  .............................
%defining time axis
n1a = -10:-1;
n1b = 0:19;
n1c = 20:40;
n1 = [n1a n1b n1c];
n2a = 20:50;
n2  = [ n1b n2a];
n = -10:90;
%.......................................
% convoluation calculation
x1 = zeros(size(n1a));
x2 = ones(size(n1b));
x3 = zeros(size(n1c));
h2 = zeros(size(n2a));
x  = [ x1 x2 x3];
h = [ x2 h2];
y = conv(x,h);
%............................................
%ploting
subplot(221)
stem(n1,x)
   grid minor
   title(['x(n) = 1 ,0=<n<=19, otherwise  0'])
   xlabel('-10< n < 40') 
   ylabel('x(n)') 

subplot(222)
stem(n2,h)

   title('h(n) = x(n) '); 
   grid minor
   xlabel('0< n < 50') 
   ylabel('h(n)') 

subplot(223)
stem(n,y)
   grid minor
   title('y(n) = x(n) * h(n)');
   xlabel('-10< n < 90') 
   ylabel('y(n)') 

 sgtitle('Convoluation between x(n) and h(n) to get y(n)') % title for the hole figure
 


