close all;
clear all; 
clc;

fs = 48000;
T = 1/fs;

Wp = 2*pi*[1000 2000];           %Freq da banda passante em rad/s
Fp = Wp/(2*pi);                 %Freq de prewarping em Hz
%Rp = -20*log10();        %Ripple na banda passante em dB

[b,a] = butter(fs, Wp, 'bandpass', 's');
H = tf(b,a)

%Exibe a resposta em frequencia
w = logspace(0, 5, 10000); %freq angular de 10 a 10000 rad/s
[h,wout] = freqs(b ,a, w);

f = wout/(2*pi); %conversão para Hertz para o gráfico

figure;
subplot(2,1,1);
semilogx(f, abs(h), 'LineWidth', 2);
xlabel('Frequência (Hz)');
ylabel('Magnitude (abs)');
axis([10^0 10^4 0 1]);
grid on;
title('Filtro Contínuo');

subplot(2,1,2);
semilogx(f, rad2deg(unwrap(angle(h))),'LineWidth',2);
xlabel('Frequência (Hz)');
ylabel('Fase (graus)');
axis([10^0 10^4 -600 0]);
grid on;