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

y = gera_sinais(A, f, phi, offset, t, "triangle");

%plotando gráfico
figure;
plot(t, y);
%comentando eixos do gráfico
xlabel('Tempo(s)'); 
ylabel('Amplitude do sinal');
hold; %mantém todos os gráficos
