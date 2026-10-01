%Exemplo 2
%Trem de pulsos quadrados de tempo discreto

close all;
clear all;
clc;


ciclos=4;    %Número de ciclos para gráfico
L=5;         %Largura do pulso em amostras
N=10;        %Período
A=1;         %Amplitude


%Cria um período do sinal periódico que será analisado
for k=0:N-1
    if k<=L-1
        x(k+1)=1;
    else
        x(k+1)=0;
    end
    n(k+1)=k;
end
%Cria vetor para ilustrar o sinal periódico
for k=1:ciclos
    x_plot(k*N-N+1:k*N)=x;
end
n=0:N*ciclos-1;

figure;
stem(n,x_plot,LineWidth=2);
xlabel('n');

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%Parte A
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

%Calcula os N termos \tilde{X}[k] teóricos da série de Fourier de tempo
%discreto
k=1:N-1;
Xt = zeros(1,N);
Xt=[A*L A*exp(-j*(L-1)*pi*k/N).*((sin(pi*L*k/N)+eps)./(sin(pi*k/N)+eps))];

abs(Xt)
angle(Xt)

k=0:N-1;
%Exibe graficamente o módulo e o argumento de \tilde{X}_k
figure;
subplot(2,1,1);
stem(k,abs(Xt),LineWidth=2);
xlabel('k');
ylabel('$|\tilde{X}_k|$','Interpreter', 'latex');
grid;

subplot(2,1,2);
stem(k,angle(Xt),linewidth=2);
xlabel('k');
ylabel('$\arg(\tilde{X}_k)$ (rad)', 'Interpreter', 'latex');
grid;



%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%Parte B
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

%Calcula os N termos \tilde{X}[k] da série de Fourier de tempo
%discreto usando a equação de análise
X = zeros(1,N);


%Coloque seu código








%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%Parte C
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

%Obtenção de cada componente para 0 <= k <= N-1

%Coloque seu código




%Plota a parte real das exponenciais complexas
figure;
subplot(6,1,1);
stem(n,real(x0),LineWidth=2);
title('Parte Real');
legend('k=0');
subplot(6,1,2);
stem(n,real(x1),LineWidth=2);
legend('k=1');
subplot(6,1,3);
stem(n,real(x3),LineWidth=2);
legend('k=3');
subplot(6,1,4);
stem(n,real(x5),LineWidth=2);
legend('k=5');
subplot(6,1,5);
stem(n,real(x7),LineWidth=2);
legend('k=7');
subplot(6,1,6);
stem(n,real(x9),LineWidth=2);
legend('k=9');
xlabel('t(s)');

%Plota a parte imaginária das exponenciais complexas
figure;
subplot(6,1,1);
stem(n,imag(x0),LineWidth=2);
title('Parte Real');
legend('k=0');
subplot(6,1,2);
stem(n,imag(x1),LineWidth=2);
legend('k=1');
subplot(6,1,3);
stem(n,imag(x3),LineWidth=2);
legend('k=3');
subplot(6,1,4);
stem(n,imag(x5),LineWidth=2);
legend('k=5');
subplot(6,1,5);
stem(n,imag(x7),LineWidth=2);
legend('k=7');
subplot(6,1,6);
stem(n,imag(x9),LineWidth=2);
legend('k=9');
xlabel('t(s)');




%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%Reconstrução do sinal
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

%Reconstroi o sinal apenas com a componente CC e a fundamental


%Coloque seu código


figure;
stem(n,x_plot,LineWidth=2);
hold;
stem(n,xr1,LineWidth=1);
legend('Sinal Original','Sinal Reconstruído');
xlabel('n');

%Reconstroi o sinal com a componente CC, fundamental e terceira harmônica



figure;
stem(n,x_plot,LineWidth=2);
hold;
stem(n,xr3,LineWidth=1);
legend('Sinal Original','Sinal Reconstruído');
xlabel('n');

%Reconstroi o sinal com a componente CC, fundamental,terceira e quinta
%harmônicas
xr5 = x0+x1+x3+x5+x7+x9;


figure;
stem(n,x_plot,LineWidth=2);
hold;
stem(n,xr5,LineWidth=1);
legend('Sinal Original','Sinal Reconstruído');
xlabel('n');


%Síntese
xr = zeros(1,N*ciclos);
M = N*ciclos;

%Coloque seu código para cálculo de xr


figure;
stem(n,x_plot,LineWidth=3);
hold;
stem(n,xr,LineWidth=1);
legend('Sinal Original','Sinal Reconstruído');
xlabel('n');