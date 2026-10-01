%Exemplo 1
%Trem de pulsos quadrados

close all;
clear all;
clc;


A=80;      %Amplitude
f=1;       %Frequência fundamental
T=1/f;     %Período fundamental
NPC=1000;  %Número de pontos por ciclo
tau=T/2;   %Largura do pulso
N=11;      %Número de termos na série de Fourier
NC=4;      %Número de ciclos para exibir

t=0:(T/NPC):NC*T; %Tempo para exibir NC ciclos

Xr5=zeros(1,length(t)); %Inicializa o vetor do sinal reconstruído

%Calcula os N termos C_k da série de Fourier
n=(N-1)/2;
K=-n:n;
C=(A/T)*(sin(pi*K*f*tau+eps)./(pi*K*f+eps));
C(find(K==0)) = A*tau/T;


%Obtenção de cada componente para -5 <= k <= 5
%Frequência -5 Hz (k=-5)
k=-5;
X_5 = C(find(K==-5))*exp(j*2*pi*k*f*t);

%Frequência -3 Hz (k=-3)
k=-3;
X_3 = C(find(K==-3))*exp(j*2*pi*k*f*t);

%Frequência -1 Hz (k=-1)
k=-1;
X_1 = C(find(K==-1))*exp(j*2*pi*k*f*t);

%Frequência 0 Hz (k=0)
k=0;
X0 = C(find(K==0))*exp(j*2*pi*k*f*t);

%Frequência 1 Hz (k=1)
k=1;
X1 = C(find(K==1))*exp(j*2*pi*k*f*t);

%Frequência 3 Hz (k=3)
k=3;
X3 = C(find(K==3))*exp(j*2*pi*k*f*t);

%Frequência 5 Hz (k=5)
k=5;
X5 = C(find(K==5))*exp(j*2*pi*k*f*t);

%Plota a parte real das exponenciais complexas
figure;
subplot(7,1,1);
plot(t,real(X_5),LineWidth=2);
title('Parte Real');
legend('k=-5');
subplot(7,1,2);
plot(t,real(X_3),LineWidth=2);
legend('k=-3');
subplot(7,1,3);
plot(t,real(X_1),LineWidth=2);
legend('k=-1');
subplot(7,1,4);
plot(t,real(X0),LineWidth=2);
legend('k=0');
subplot(7,1,5);
plot(t,real(X1),LineWidth=2);
legend('k=1');
subplot(7,1,6);
plot(t,real(X3),LineWidth=2);
legend('k=3');
subplot(7,1,7);
plot(t,real(X5),LineWidth=2);
legend('k=5');
xlabel('t(s)');

%Plota a parte imaginária das exponenciais complexas
figure;
subplot(7,1,1);
plot(t,imag(X_5),LineWidth=2);
title('Parte Imaginária');
legend('k=-5');
subplot(7,1,2);
plot(t,imag(X_3),LineWidth=2);
legend('k=-3');
subplot(7,1,3);
plot(t,imag(X_1),LineWidth=2);
legend('k=-1');
subplot(7,1,4);
plot(t,imag(X0),LineWidth=2);
legend('k=0');
subplot(7,1,5);
plot(t,imag(X1),LineWidth=2);
legend('k=1');
subplot(7,1,6);
plot(t,imag(X3),LineWidth=2);
legend('k=3');
subplot(7,1,7);
plot(t,imag(X5),LineWidth=2);
legend('k=5');
xlabel('t(s)');

%Exibe os valores de C_k
figure;
bar(K,C);
xlabel('k');
ylabel('c_k');
grid;

%Exibe graficamente o módulo e o argumento de C_k
figure;
subplot(2,1,1);
bar(K,abs(C));
xlabel('k');
ylabel('|c_k|');
grid;

subplot(2,1,2);
bar(K,rad2deg(angle(C)));
xlabel('k');
ylabel('Fase (graus)');
grid;

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%Reconstrução do sinal
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%Cria forma de onda analisada
for i=1:NC*(NPC)+1
    if i == 1 %Conta os ciclos em função do tempo
        ciclo=0;
    elseif mod(t(i),T) == 0
        ciclo = ciclo + 1;
    end
    if ((t(i)-ciclo*T) <= tau/2 | ((t(i)-ciclo*T) > 3*tau/2) & ((t(i)-ciclo*T) < T))
        x1(i)=A;
    else 
        x1(i)=0;
    end
end

%Reconstroi o sinal apenas com a componente CC e a fundamental
Xr1 = X_1+X0+X1;
figure;
plot(t,x1,LineWidth=2);
hold;
plot(t,Xr1,LineWidth=2);
legend('Sinal Original','Sinal Reconstruído');
xlabel('t(s)');

%Reconstroi o sinal com a componente CC, fundamental e terceira harmônica
Xr3 = X_3+X_1+X0+X1+X3;
figure;
plot(t,x1,LineWidth=2);
hold;
plot(t,Xr3,LineWidth=2);
legend('Sinal Original','Sinal Reconstruído');
xlabel('t(s)');

%Reconstroi o sinal com a componente CC, fundamental,terceira e quinta
%harmônicas
Xr5 = X_5+X_3+X_1+X0+X1+X3+X5;
figure;
plot(t,x1,LineWidth=2);
hold;
plot(t,Xr5,LineWidth=2);
legend('Sinal Original','Sinal Reconstruído');
xlabel('t(s)');

%Síntese
for i=1:length(t)
        Xr(i)=sum(C.*exp(j*2*pi*K*f*t(i)));
end

figure;
plot(t,x1,LineWidth=3);
hold;
plot(t,Xr,LineWidth=1);
legend('Sinal Original','Sinal Reconstruído');
xlabel('t (s)');

