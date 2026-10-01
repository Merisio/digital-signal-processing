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
yq = A*square(2*pi*f*t + phi_rad) + offset;
%yt = A*sawtooth(2*pi*f*t + phi_rad) + offset; Onda triangular

%plotando gráfico
figure;
plot(t, yq);
%comentando eixos do gráfico
xlabel('Tempo(s)'); 
ylabel('Amplitude do sinal');
hold; %mantém todos os gráficos
plot(t, yq);
legend('Onda quadrada');
title('Onda quadrada');