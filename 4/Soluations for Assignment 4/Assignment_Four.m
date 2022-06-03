%Assignment 4
% Done by Mahmoud Yassin Mahmoud
% ID: 202113650
% Submitted To Dr. Wail A. Mousa
% Bism Allah and I will start with 
%(Q1):
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
clc;
clear;
%..................................................
num1 = [2 5 1];% numerator coefficients for H1(z)
den1 = [1 2 3];% denominator coefficients for H1(z)

%----------------------------------------------------------
num2 = [1];% numerator coefficients for H2(z)
den2 = [1 -5/6 1/6];% denominator coefficients for H2(z)

%-------------------------------------------------------
H1 = tf(num1, den1, 0.1) % Transfer Function H1(Z)
sprintf('\n')
H2 = tf(num2, den2, 0.1) % Transfer Function H2(Z)

%-------------------------------------------------------
% Calculation of poles and zeros for H1(z)
    poles1 = pole(H1)
    zeros1 = zero(H1)

%-------------------------------------------------------
% Calculation of poles and zeros for H2(z)
     poles2 = pole(H2)
     zeros2 = zero(H2)

%-------------------------------------------------------
%ploting
figure

 subplot(211)
   pzmap(H1)
   title('the pole-zero map for H1(z)')

 subplot(212)
   pzmap(H2)
   title('the pole-zero map for H1(z)')




