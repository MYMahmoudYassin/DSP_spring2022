%Assignment 1 
% Done by Mahmoud Yassin Mahmoud
% ID: 202113650
% Submitted To Dr. Wail A. Mousa
% Bism Allah and I will continue with 
%(Q3)The sinusoidal sequence:
% h5(n) = sin(2*pi*n/20) for n = -40:...:40
% Is it a periodic signal? If yes, then what is its period?
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
clc;
clear;
%.........................................
% difine n
 n= -40:40;
 %............................................
%calculate sinusoidal  
 h5 = sin(2*pi*n/20);
 %..............................................
 %ploting
 stem(n,h5)
   grid minor
   title('h5(n) = sin(2*pi*n/20) for n = -40:...:40')
   xlabel('-40 < n < 40') 
   ylabel('h5(n)') 
 % Periodicity
 fprintf('Signal is periodoc with fundamental period equals to 20\n');




