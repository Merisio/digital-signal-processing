clear all;
close all;
clc;

n=0:100;            %Amostras a serem calculadas
N=length(n);        %Tamanho do vetor N
y=zeros(1,N);       %Inicialização do vetor y
x=[1 zeros(1,N-1)]; %Sequência impulso unitário

%Implemente o código aqui
%Considere como entrada o vetor x declarado acima
%A resposta ao impulso deve estar alocada no vetor y para ser
%usado nos gráficos abaixo

% Questão 2 - Equação da saída
a=0.9366; %Constantes utilizadas na equação
b=0.0317;

for k = 1:N 
    if k == 1 % if usado para o primeiro caso na qual k-1 daria erro, visto que no matlab a posição 0 não existe
        y(k) = a*0 + b*x(k) + b*0;
    else %caso contrário ele executa a equação normal dada na questão
        y(k) = a*y(k-1) + b*x(k) + b*x(k-1);
    end
end


%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%Gráficos e verificação
figure;
subplot(2,1,1);
stem(n,x);
xlabel('n');
ylabel('Amplitude');
title('Sequência Impulso Unitário - \delta[n]');

subplot(2,1,2);
stem(n,y);
xlabel('n');
ylabel('Amplitude');
title('Resposta ao Impulso - h[n]');