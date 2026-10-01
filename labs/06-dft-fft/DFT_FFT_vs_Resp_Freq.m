clear all;
close all;
clc;

%Carrega resposta ao impulso de filtro Passa Baixas.
load Imp_resp_PB.mat;

%Exibe a resposta ao impulso
n=0:length(h)-1;
stem(n,h,LineWidth=2);
xlabel('n');
ylabel('Amplitude');
title('Resposta ao Impulso do Filtro Passa Baixas');


%Exibe a resposta em frequência teórica
w = linspace(0,2*pi,1000);
Ht = 0.0317*((1+exp(-j*w))./(1-0.9366*exp(-j*w)));

figure;
subplot(2,1,1);
plot(w,abs(Ht),LineWidth=2);
xlabel('\omega (rad/amostra)');
ylabel('|Ht|');
title('Resposta em Frequência Teórica');
subplot(2,1,2);
plot(w,angle(Ht),LineWidth=2);
xlabel('\omega (rad/amostra)');
ylabel('arg(Ht) (rad)');

%Calcula a DFT da resposta ao impulso

N = length(h);                %Número de amostras da resposta ao impulso.
Ndft =  2^nextpow2(N) - N;    %Números de zeros para Zero Padding
%Ndft =  2^10 - N;
h = [h, zeros(1, Ndft)];      %Aplica zero padding na resposta ao impulso
N = length(h);                %Número de amostras da resposta ao impulso após zero padding.
H = zeros(1,N);            %Inicializa vetor
n = 0:N-1;

to_DFT = tic;
for k=0:N-1
    for m=0:N-1
        H(k+1) = H(k+1) + h(m+1)*exp(-j*2*pi*k*m/N);
    end
end
t_DFT = toc(to_DFT);

% Exibe coeficientes da DFT da resposta ao impulso
figure;
subplot(2,1,1);
stem(n, abs(H),LineWidth=2);
xlabel('k');
ylabel('|H(k)|');
title('DFT da Resposta ao Impulso');
subplot(2,1,2);
stem(n, angle(H),LineWidth=2);
xlabel('k');
ylabel('arg(H(k)) (rad)');

%Exibe os coeficientes da DFT em função da frequência
w_DFT = (0:N-1)*2*pi/N;
figure;
subplot(2,1,1);
plot(w,abs(Ht),LineWidth=2);
hold;
stem(w_DFT, abs(H),LineWidth=2);
xlabel('\omega (rad/amostra)');
ylabel('|H|');
legend('Resposta teórica', 'DFT');
title('Resposta em Frequência Teórica vs DFT');
subplot(2,1,2);
plot(w,angle(Ht),LineWidth=2);
hold;
stem(w_DFT, angle(H),LineWidth=2);
xlabel('\omega (rad/amostra)');
ylabel('arg(Ht) (rad)');



%Exibe a DFT para 0 <= w <= pi
W_DFT = (0:(N-1)/2)*2*pi/N;   %Gera vetor de frequências 0 <= w < pi.
N_DFT = length(W_DFT);          %Número de elementos em W_DFT.
figure;
subplot(2,1,1);
semilogx(w(1:N_DFT),abs(Ht(1:N_DFT)),LineWidth=2);
hold;
semilogx(W_DFT, abs(H(1:N_DFT)),LineWidth=2);
xlabel('\omega (rad/amostra)');
ylabel('|H|');
legend('Resposta teórica', 'DFT');
title('Resposta em Frequência Teórica vs DFT');
subplot(2,1,2);
semilogx(w(1:N_DFT),angle(Ht(1:N_DFT)),LineWidth=2);
hold;
semilogx(W_DFT, angle(H(1:N_DFT)),LineWidth=2);
xlabel('\omega (rad/amostra)');


%Comparação da DFT com a FFT.
to_fft = tic;
H_fft = fft(h);% Calcula a FFT da resposta ao impulso
t_fft = toc(to_fft);
%toc
% Calcula o tempo de execução da FFT
%tf_dft = toc(to_fft);
fprintf('Tempo de execução da FFT: %.8f segundos\n', t_fft);
fprintf('Tempo de execução da DFT: %.8f segundos\n', t_DFT);
fprintf('A DFT é: %.3f vezes mais lenta do que a FFT\n', t_DFT/t_fft);


% Exibe a comparação da DFT com a FFT
figure;
subplot(2,1,1);
stem(n, abs(H), LineWidth=3);
hold on;
stem(n, abs(H_fft), LineWidth=1);
xlabel('k');
ylabel('|H(k)|');
title('Comparação entre DFT e FFT');
legend('DFT', 'FFT');

subplot(2,1,2);
stem(n, angle(H), LineWidth=3);
hold on;
stem(n, angle(H_fft), LineWidth=1);
xlabel('k');
ylabel('arg(H(k)) (rad)');