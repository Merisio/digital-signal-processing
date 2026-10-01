clear all;
close all;
clc;

f = 5;    %fase
A = 1;    %amplitude
T = 1;    %tempo em segundos
phi = 90; %fase em graus

offset = 1;

t = 0:0.001:T;

phi_rad = deg2rad(phi);

%calculando funcao
ys = A*sin(2*pi*f*t + phi_rad) + offset;
yc = A*cos(2*pi*f*t + phi_rad) + offset;

%plotando gráfico
figure;
plot(t, ys);
%comentando eixos do gráfico
xlabel('Tempo(s)'); 
ylabel('Amplitude do sinal');
hold; %mantém todos os gráficos
plot(t, yc);
legend('seno com fase 90 graus','cosseno com fase 90 graus');
title('Gráficos de Seno e Cosseno com Fase 90');

figure;
plot(t, ys);
xlabel('t(s)');
ylabel('Amplitude do sinal');
stem(t, ys);