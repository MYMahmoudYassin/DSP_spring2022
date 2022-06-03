%Assignment 1 
% Done by Mahmoud Yassin Mahmoud
% ID: 202113650
% Submitted To Dr. Wail A. Mousa
% Bism Allah and I will start with 
%(Q1c): 
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
clc;
clear;
%.....................  .............................
%defining time axis
n1a = -10:-1;
n1b = 0:19;
n1c = 20:40;
n1 = [n1a n1b n1c];
n2 = 0:50;
n = -10:90;
%.......................................
% convoluation calculation
h = 0.9.^n2;

x  = h;
y = conv(x,h);
%............................................
%ploting
subplot(221)
stem(n2,x)
   grid minor
   title(['x(n) = h(n)'])
   xlabel('-10< n < 40') 
   ylabel('x(n)') 

subplot(222)
stem(n2,h)

   title('h(n) = 0.9^n '); 
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
 


