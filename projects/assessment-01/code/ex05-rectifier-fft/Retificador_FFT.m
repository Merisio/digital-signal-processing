close all;
clear all;
clc;

%load out_completo.mat;
load medidas.mat;
fs = 48000;      %Frequência de amostragem utilizada
T = 1/fs;        %Período de amostragem



%Exibe valores de tensão e corrente da rede em regime permanente
t_rp = [0:length(Irede_rp)-1]*T;
figure;
plot(t_rp,Vrede_rp,LineWidth=2);
hold on;
plot(t_rp,Irede_rp,LineWidth=2);
xlabel('t (s)');
ylabel('Tensão (V) / Corrente (A)');
title('Tensão e Corrente da Rede');
legend('Tensão', 'Corrente');
grid on;

%Exibe amostras da corrente e tensão da rede em regime permanente
n = 0:length(Vrede_rp)-1;
figure;
stem(n,Vrede_rp);
hold on;
stem(n,Irede_rp);
xlabel('n');
ylabel('Tensão (V) / Corrente (A)');
title('Tensão e Corrente da Rede');
legend('Tensão', 'Corrente');
grid on;

% --------- ITEM A ---------------------------------------
N = 800;
V_1ciclo = Vrede_rp(1:N); % primeiro ciclo tem 800 amostras
Vrms = sqrt(1/N*sum(V_1ciclo.^2)); % formula dada na questão --> sum(x) soma os valores do vetor | .^2 eleva cada termo ao quadrado

I_1ciclo = Irede_rp(1:800); % refaz a mesma coisa para a corrente, apenas trocando o nome da variavel e pegando o vetor correspondente 
Irms = sqrt(1/N*sum(I_1ciclo.^2));

% mostra os resultados
disp(["valor rms da tensão: ",Vrms]);
disp(["valor rms da corrente: ",Irms]);

% --------- ITEM B ---------------------------------------

V_fft = fft(V_1ciclo); %faz a análise de fourier da tensão e da corrente
I_fft = fft(I_1ciclo);

ordem_max = 50; 
harmonicas = (1:ordem_max)';
freqs = harmonicas * 60; %vetor para armazenar a frequencia das harmonicas dos sinais

% Amplitude verdadeira pegando o valor absoluto começando em 2 para
% eliminar o termo de 0 frequencia
V_h = abs(V_fft(2:ordem_max+1)); 
I_h = abs(I_fft(2:ordem_max+1));

%Gráficos de barras: amplitude por ordem
figure;
subplot(2,1,1);
bar(harmonicas, V_h(1:ordem_max));
xlabel('Ordem harmônica');
ylabel('Amplitude(V)');
title('Harmônicas da Tensão');
grid on;

subplot(2,1,2);
bar(harmonicas, I_h(1:ordem_max));
xlabel('Ordem harmônica');
ylabel('Amplitude(A)');
title('Harmônicas da Corrente');
grid on;

%--------- ITEM C ---------------------------------------
%Gráficos de barras: amplitude por ordem
figure;
subplot(2,1,1);
bar(freqs, V_h(1:ordem_max)); %apenas troquei a variavel que printa para o vetor de frequencias inicializado na questao anterior
xlabel('Frequência (Hz)');
ylabel('Amplitude(V)');
title('Harmônicas da Tensão');
grid on;

subplot(2,1,2);
bar(freqs, I_h(1:ordem_max));
xlabel('Frequência (Hz)');
ylabel('Amplitude(A)');
title('Harmônicas da Corrente');
grid on;

%--------- ITEM D ---------------------------------------
%Gráficos de barras: amplitude por ordem

V_porc = (V_h./V_h(1)) * 100; %o primeiro termo sendo 0 100% (frequencia fundamental) 
I_porc = (I_h./I_h(1)) * 100;

figure;
subplot(2,1,1);
bar(harmonicas, V_porc(1:ordem_max));
xlabel('Frequência (Hz)');
ylabel('Amplitude(%)');
title('Harmônicas da Tensão');
grid on;

subplot(2,1,2);
bar(harmonicas, I_porc(1:ordem_max));
xlabel('Frequência (Hz)');
ylabel('Amplitude(%)');
title('Harmônicas da Corrente');
grid on;

% Verificando as normas da tensão e corrente 9printa apenas aquelas que
% estao fora da norma
for i=2:50
    if V_porc(i) > 5
       disp([harmonicas(i), "nao esta de acordo com a norma de Tensão"])
    end

    if i < 11 && I_porc(i)>4
        disp([harmonicas(i), "nao esta de acordo com a norma de Corrente"])
    end

    if i >= 11 && i < 17 && I_porc(i)>2
        disp([harmonicas(i), "nao esta de acordo com a norma de Corrente"])
    end

    if i >= 17 && i < 23 && I_porc(i)>1.5
        disp([harmonicas(i), "nao esta de acordo com a norma de Corrente"])
    end

    if i >= 23 && i < 35 && I_porc(i)>0.6
        disp([harmonicas(i), "nao esta de acordo com a norma de Corrente"])
    end

    if i >= 35 && i < 50 && I_porc(i)>0.3
        disp([harmonicas(i), "nao esta de acordo com a norma de Corrente"])
    end
end

%--------- ITEM E ---------------------------------------
%aplicando a formula dada na questão usando a operação sum para somar os
%termos do vetor juntamente com a operação .^2 que faz a operação para cada
%termo do vetor

dhi_v = 100*sqrt(sum(V_h(2:50).^2))/V_h(1);
disp(["valor dhi da tensão",dhi_v]);

dhi_i = 100*sqrt(sum(I_h(2:50).^2))/I_h(1);
disp(["valor dhi da corrente",dhi_i]);