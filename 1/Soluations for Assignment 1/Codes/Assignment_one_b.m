%Assignment 1 
% Done by Mahmoud Yassin Mahmoud
% ID: 202113650
% Submitted To Dr. Wail A. Mousa
% Bism Allah and I will continue with 
%(Q2)The exponential sequences:
% 1- h1(n) = 0.9^n
% 2- h2(n) = 2^n
% 3- h3(n) = (-0.5)^n
% 4- h4(n) = (-3)^n
% for n = 0,..,50.
% Obtain the maximum value of each sequence and its index value.
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
clc;
clear;
%.....................  .............................
%defining time and base for exponential
 n= 0:50;
 a1 = 0.9;
 a2 = 2;
 a3 = -0.5;
 a4 = -3;
%........................................
% exponential calculations and maximum value with its index

h1 = a1.^n;
 [max_val_1,index_max_1] = max(h1);
 fprintf('The maximum value of h1(n) is : %d and its index is %d\n',max_val_1,index_max_1);

h2 = a2.^n;
[max_val_2,index_max_2] = max(h2);
fprintf('The maximum value of h2(n) is : %d and its index is %d\n',max_val_2,index_max_2);

h3 = a3.^n;
[max_val_3,index_max_3] = max(h3);
 fprintf('The maximum value of h3(n) is : %d and its index is %d\n',max_val_3,index_max_3);

h4 = a4.^n;
[max_val_4,index_max_4] = max(h4);
 fprintf('The maximum value of h4(n) is : %d and its index is %d\n',max_val_4,index_max_4);
%........................................................................................
%ploting

subplot(221)
   stem(n,h1)
   grid minor
   title('h1(n) = 0.9^n')
   xlabel('0< n < 50') 
   ylabel('h1(n)') 

subplot(222)
   stem(n,h2)
   title('h2(n) = 2^n '); 
   grid minor
   xlabel('0< n < 50') 
   ylabel('h2(n)') 

subplot(223)
   stem(n,h3)
   grid minor
   title('h3(n) = (-0.5)^n');
   xlabel('0< n < 50') 
   ylabel('h3(n)') 

subplot(224)
  stem(n,h4)
  grid minor
  title('h4(n) = (-3)^n');
  xlabel('0< n < 50') 
  ylabel('h4(n)') 

sgtitle('The exponential sequences for n= 0,..,50 ') % title for the hole figure
