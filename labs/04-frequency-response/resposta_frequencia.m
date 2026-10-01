close all;
clear all;
clc;

fs=48000;  %Frequência de amostragem
Ts=1/fs;   %Período de amostragem
tf=5;      %Tempo de simulação

n=0:tf/Ts; %Vetor de amostras n

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%Sinal senoidal de 100 Hz a ser filtrado;
x1=cos(2*pi*100*Ts*n);

%Aplica o sinal ao filtro
y1=filter([0.0317 0.0317],[1 -0.9366],x1); 

%Reproduz sinal de entrada
disp('Sinal de entrada de 100 Hz.');
play_audio(x1, fs);

%Reproduz sinal filtrado
clc;
disp('Sinal de 100 Hz filtrado.');
play_audio(y1, fs);

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%Sinal senoidal de 8000 Hz a ser filtrado;
x2=cos(2*pi*8000*Ts*n);

%Aplica o sinal ao filtro
y2=filter([0.0317 0.0317],[1 -0.9366],x2); 

%Reproduz sinal de entrada
clc;
disp('Sinal de entrada de 8000 Hz.');
play_audio(x2, fs);

%Reproduz sinal filtrado
clc;
disp('Sinal de 8000 Hz filtrado.');
play_audio(y2, fs);


%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%Sinal senoidal de 500 Hz a ser filtrado;
x3=cos(2*pi*500*Ts*n);

%Aplica o sinal ao filtro
y3=filter([0.0317 0.0317],[1 -0.9366],x3); 

%Reproduz sinal de entrada
clc;
disp('Sinal de entrada de 500 Hz.');
play_audio(x3, fs);

%Reproduz sinal filtrado
clc;
disp('Sinal de 500 Hz filtrado.');
play_audio(y3, fs);



%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%Gráficos dos sinais de entrada e saída para 100 Hz
figure;
stem(n(1:2000),x1(1:2000));
hold;
stem(n(1:2000),y1(1:2000));
legend('x[n]','y[n]');
xlabel('n');
ylabel('Amplitude');
title('Sinal de 100 Hz');
axis([1000 2000 -1.1 1.1]);

%Gráficos dos sinais de entrada e saída para 8000 Hz
figure;
stem(n(1:2000),x2(1:2000));
hold;
stem(n(1:2000),y2(1:2000));
legend('x[n]','y[n]');
xlabel('n');
ylabel('Amplitude');
title('Sinal de 8000 Hz');
axis([1000 1100 -1.1 1.1]);

%Gráficos dos sinais de entrada e saída para 500 Hz
figure;
stem(n(1:2000),x3(1:2000));
hold;
stem(n(1:2000),y3(1:2000));
legend('x[n]','y[n]');
xlabel('n');
ylabel('Amplitude');
title('Sinal de 500 Hz');
axis([1000 1300 -1.1 1.1]);

%Resposta em frequência
w=0:0.001:pi;   %Vetor de frequência angular
H=(0.0317+0.0317*exp(-j*w))./(1-0.9366*exp(-j*w)); %Calcula a resposta em frequência

%Exibe gráficos de ganho e fase em função da frequência angular w
figure;
subplot(2,1,1);
semilogx(w/(2*pi*Ts),abs(H));
xlabel('f (rad/amostra)');
ylabel('Ganho');
title('Resposta em Frequência');
subplot(2,1,2);
semilogx(w/(2*pi*Ts),angle(H));
xlabel('f (rad/amostra)');
ylabel('Fase (Rad)');


%Exibe gráficos de ganho e fase em função da frequência f (Hz)
Omega=w/Ts;       %Frequência angular do sinal contínuo amostrado em rad/s 
f = Omega/(2*pi); %Frequência angular do sinal contínuo amostrado em Hz
figure;
subplot(2,1,1);
semilogx(f,abs(H));
xlabel('f (Hz)');
ylabel('Ganho');
title('Resposta em Frequência');
subplot(2,1,2);
semilogx(f,rad2deg(angle(H)));
xlabel('f (Hz)');
ylabel('Fase (Graus)')

