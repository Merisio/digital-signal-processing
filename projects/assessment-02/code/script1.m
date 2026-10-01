close all;
clear all;
clc;

%=================== QUESTAO 1  ================================================
%Projetar um filtro IIR passa faixa de 6 ordem com com aproximação 
%para ser implementado com frequência de amostragem de 48000 Hz.
N = 3;            %Ordem
fs = 48000;
f1 = 1000;
f2 = 2000;
ordem = 6;

Om1 = 2*fs*tan(pi*f1/fs);    % rad/s
Om2 = 2*fs*tan(pi*f2/fs);    % rad/s

%BPF Butterworth
[z,p,k] = butter(N,[Om1, Om2],'bandpass','s');  %Projeto do filtro contínuo
[zd,pd,kd] = bilinear(z,p,k,fs);        %Discretização
[bd,ad] = zp2tf(zd,pd,kd);              %Filtro discreto em num e den
TF = tf(bd,ad,1/fs)

fd = logspace(0, log10((fs)/2), 10000); %Frequências para calculo da resposta em frequência em Hz
[H, fout] = freqz(bd, ad, fd, fs);     %Resposta em frequência

%Gráficos
graficosFreqEfetiva(fout, H);

%================ QUESTAO 2 ===========================
%simulação
frequencias = [1000 1500 2000];
x_buffer = zeros(1, ordem);
y_buffer = zeros(1, ordem);

for i = 1:length(frequencias)
    f_in = frequencias(i);

    [x, y] = simular_filtro(x_buffer, y_buffer, bd, ad, fs, f_in);

    figure;
    plot(x, 'LineWidth', 2); hold on;
    plot(y, 'LineWidth', 2);
    grid on;
    legend('x[n]','y[n]');
    xlabel('n');
    title(['Gráfico na Frequência ' num2str(frequencias(i)) ' Hz']);
end

%=================== QUESTAO 3 =========================

% Configurações de ponto-fixo: signed, 32 bits total, 18 fractional bits (Q32.18)
WL = 32; FL =18;

% fimath para controlar arredondamento
F = fimath('RoundingMethod','Convergent',...
           'ProductMode','SpecifyPrecision', ...
           'ProductWordLength',WL, ...
           'ProductFractionLength',FL);

% quantiza coeficientes
bq = fi(bd,1,WL,FL,'fimath',F)  %1=signed  0=unsigned
aq = fi(ad,1,WL,FL,'fimath',F)

%Exibe resposta em frequência do filtro discreto  quantizado
[hd1, fout2] = freqz(double(bq), double(aq), fd, fs);     %Resposta em frequência

graficosFreqEfetiva(fout2, hd1);

%simulação
x_buffer2=fi(zeros(1,ordem),1,WL,FL,'fimath',F);
y_buffer2=fi(zeros(1,ordem),1,WL,FL,'fimath',F);

for i = 1:length(frequencias)
    f_in = frequencias(i);

    [x, y] = simulaFDI(F, WL, FL, x_buffer2, y_buffer2, bq, aq, fs, f_in);

    figure;
    plot(x, 'LineWidth', 2); hold on;
    plot(y, 'LineWidth', 2);
    grid on;
    legend('x[n]','y[n]');
    xlabel('n');
    title(['Gráfico na Frequência ' num2str(frequencias(i)) ' Hz']);
end


%=================== QUESTAO 4 =========================
[sos,g] = zp2sos(zd,pd,kd);

%fimath para controlar arredondamento
F = fimath('RoundingMethod','Convergent',...
           'ProductMode','SpecifyPrecision', ...
           'ProductWordLength',WL, ...
           'ProductFractionLength',FL);

% quantiza coeficientes
sosq = fi(sos,1,WL,FL,'fimath',F);  %1=signed  0=unsigned
gq = fi(sqrt(g),1,WL,FL,'fimath',F);

%Distribui o ganho gq entre as duas seções
SOSq = sosq;
SOSq(1:2,1:3) = gq*SOSq(1:2,1:3);


%Exibe resposta em frequência do filtro discreto  quantizado
[hd2, fout3] = freqz(double(SOSq), fd, fs);     %Resposta em frequência
graficosFreqEfetiva(fout3, hd2);

%Simulação
w_buffer1 = fi(zeros(1,2),1,WL,FL,'fimath',F);
w_buffer2 = fi(zeros(1,2),1,WL,FL,'fimath',F);

for i = 1:length(frequencias)
    f_in = frequencias(i);

    [x, y] = simulaFDII(F, WL, FL, w_buffer1, w_buffer2, SOSq, fs, f_in);

    figure;
    plot(x, 'LineWidth', 2); hold on;
    plot(y, 'LineWidth', 2);
    grid on;
    legend('x[n]','y[n]');
    xlabel('n');
    title(['Gráfico na Frequência ' num2str(frequencias(i)) ' Hz']);
end

%=================== QUESTAO 5 =========================
load imp_resp_FIR.mat;

%Exibe a resposta ao impulso
figure;
n=0:length(h)-1;
stem(n,h,LineWidth=2);
xlabel('n');
ylabel('Amplitude');
title('Resposta ao Impulso de um Filtro FIR Tipo I');

figure;
[H_rectf,f3] = freqz(h,1,fd,fs);
plot(f3,mag2db(abs(H_rectf)),"LineWidth",2);
grid on;
xlabel("f (Hz)");
ylabel("|H(j2\pif)| (dB)");
title('Resposta em frequência');

x_buffer5 = zeros(1, length(h));

[x, y] = simularFIR(x_buffer5, h, fs, 5000, length(h));

figure;
plot(x, 'LineWidth', 2); hold on;
plot(y, 'LineWidth', 2);
grid on;
legend('x[n]','y[n]');
xlabel('n');
title(['Gráfico na Frequência 5000 Hz']);

