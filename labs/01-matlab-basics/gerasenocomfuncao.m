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

ys = gera_seno(A, f, phi, offset, t);

%plotando gráfico
figure;
plot(t, ys);
%comentando eixos do gráfico
xlabel('Tempo(s)'); 
ylabel('Amplitude do sinal');
hold; %mantém todos os gráficos
