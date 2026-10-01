close all;
clear all;
clc;


%Questão 4

%Expansão em frações parciais
[R P K] = residuez(0.0317*[1 1],[1 -1.9366 0.9366])


%Exibe a saída do filtro calculada pela trasformada z
n=0:200;                   %Índice de amostras

y = 1-0.9683*(0.9366.^n);  %Saída

figure;
stem(n,y);
xlabel('n');
ylabel('Amplitude');
title('Resposta ao degrau unitário');


%Implementa o filtro yd(k) = 0.9366*y(k-1) + 0.0317*x(k) + 0.0317*x(k-1)
%para entrada u[k] para verificação

for k=0:200
    x(k+1)=1;
    if k==0
        yd(k+1) = 0.0317*x(k+1);
    else
        yd(k+1) = 0.9366*yd(k) + 0.0317*x(k+1) + 0.0317*x(k);       
    end
end

figure;
subplot(2,1,1);
stem(n,yd);
xlabel('n (amostras)');
ylabel('Amplitude');
title('Resposta ao degrau unitário');
subplot(2,1,2);
b=0.0317*[1 1];    %Coeficientes do numerador do filtro
a=[1 -0.9366];     %Coeficientes do denominador do filtro
hold;
stepz(b,a,201);    %Resposta ao degrau para 201 amostras



%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%Questão 5
b = 0.00102*[1 2 1];          %Coeficientes do numerador do filtro
a = [1 -1.9075 0.9116];       %Coeficientes do denominador do filtro
fs = 48000;

freqz(b,a,5000,fs);           %Exibe a resposta em frequência para fs



%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%Questão 7

%Expansão em frações parciais
[R P K] = residuez(0.00102*[1 2 1],[1 -1.9075 0.9116])

delta_h = 0.0011*[1 zeros(1,200)];
%h = delta_h + 0.0922*0.9548.^n.*cos(0.0464.*n-1.5719);
h = delta_h + 0.0922*0.9548.^n.*sin(0.0464.*n);
figure;
stem(n,h);
hold;
impz(b,a,201);         %Resposta ao impulso para 201 amostras
legend('Teórico','Matlab');