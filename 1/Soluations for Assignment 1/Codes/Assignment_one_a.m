%Assignment 1 
% Done by Mahmoud Yassin Mahmoud
% ID: 202113650
% Submitted To Dr. Wail A. Mousa
% Bism Allah and I will begin with 
%(Q1)The step sequence: u(n) for n= -10,..,50.
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
clc;
clear;
%..................................................
%calculation of discrete time

  n1 = -10:-1;
  n2 = 1:50;
  n = [n1 n2];
%..................................................
%calculation of step sequence

u1 = zeros(size(n1));
u2 = ones(size(n2));
u = [u1 u2];
%..................................................
%calculation of length

  the_length_u = length(u);
  the_length_n = length(n);
fprintf('The length of u(n) is : %d\n',the_length_u);
fprintf('The length of n is : %d\n',the_length_n);
%....................................................
%ploting

stem(n,u);
grid minor
xlim([-11 52])
ylim([0 3])
set(gca,'fontsize',14)
title('The step sequence: u(n) for n= -10,..,50.')
xlabel('-10< n < 50','fontsize',18) 
ylabel('u(n)','fontsize',18) 
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%


