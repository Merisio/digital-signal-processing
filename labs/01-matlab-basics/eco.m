close all;
clc;

load handel;
sound(y, Fs);
pause(10);

alpha = 0.9;
D = 4196;

%Gera eco
b = [1, zeros(1,D-1), alpha];
x = filter(b,1,y);
sound(x,Fs);
pause(10);

%Elimina eco
w = filter(1,b,x);
sound(w,Fs);