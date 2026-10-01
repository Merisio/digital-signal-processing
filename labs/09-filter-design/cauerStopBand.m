close all;
clear all;
clc;

fs = 10000; %Freq de amostragem
T = 1/fs;   %Periodo de amostragem 

Ws = 2*pi*[900 1100];           %Freq da banda de rejeição em rad/s
Wp = 2*pi*[750 1320];           %Freq da banda passante em rad/s
Fp = Wp/(2*pi);                 %Freq de prewarping em Hz
Fs = Ws/(2*pi);                 %Freq de prewarping em Hz
Rp = -20*log10(0.89125);        %Ripple na banda passante em dB
Rs = -20*log10(0.17783);        %Atenuação na banda de rejeição em dB


%Filtro passa-altas
[N Wc] = ellipord(Wp, Ws, Rp, Rs, 's'); %ordem e freq de corte
fprintf("Filtro Cauer de ordem %d e freq de corte %g rad/s.\n", N, Wc);

[b,a] = ellip(N, Rp, Rs, Wp,'stop','s'); %projeta o filtro chebyshev
H=tf(b,a)

%Exibe a resposta em frequencia
w = logspace(0, 5, 10000); %freq angular de 10 a 10000 rad/s
[h,wout] = freqs(b ,a, w);

f = wout/(2*pi); %conversão para Hertz para o gráfico

%Diagrama de bode
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
axis([10^0 10^4 -200 200]);
grid on;

%Discretização sem prewarping
[bd, ad] = bilinear(b, a, fs);

fd = logspace(0, log10((fs-100)/2), 10000); %Freqs para cálculo da resposta
[hd, fout] = freqz(bd, ad, fd, fs); %Resposta em frequência

%Gráfico sem prewarping
figure;
subplot(2,1,1);
semilogx(f, abs(h), 'LineWidth', 2);
hold;
semilogx(fout, abs(hd), 'LineWidth', 2);
xlabel('Frequência (Hz)');
ylabel('Magnitude (abs)');
legend('Filtro Contínuo', 'Filtro discretizado');
axis([10^0 10^4 0 1]);
grid on;
title('Filtro Contínuo x Discreto sem prewarping');

subplot(2,1,2);
semilogx(f, rad2deg(unwrap(angle(h))),'LineWidth',2);
hold;
semilogx(fout, rad2deg(unwrap(angle(hd))),'LineWidth',2);
xlabel('Frequência (Hz)');
ylabel('Fase (graus)');
axis([10^0 10^4 -200 200]);
grid on;

%Discretização com prewarping em Fp
[bd2, ad2] = bilinear(b, a, fs, Fp(2));
[hd2, fout] = freqz(bd2, ad2, fd, fs); %resposta em frequência

figure;
subplot(2,1,1);
semilogx(f, abs(h), 'LineWidth', 2);
hold;
semilogx(fout, abs(hd2), 'LineWidth', 2);
xlabel('Frequência (Hz)');
ylabel('Magnitude (abs)');
legend('Filtro Contínuo', 'Filtro discretizado');
axis([10^0 10^4 0 1]);
grid on;
title('Filtro Contínuo x Discreto com prewarping em Ws');

subplot(2,1,2);
semilogx(f, rad2deg(unwrap(angle(h))),'LineWidth',2);
hold;
semilogx(fout, rad2deg(unwrap(angle(hd2))),'LineWidth',2);
xlabel('Frequência (Hz)');
ylabel('Fase (graus)');
axis([10^0 10^4 -200 200]);
grid on;