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
%usada nos gráficos abaixo
%Obtenha as amostras da resposta ao impulso teórica para comparação e
%aloque no vetor h.

%Ex2
a=0.9366;
b=0.0317;

for k = 1:N
    if k == 1
        y(k) = a*0 + b*x(k) + b*0;
    else
        y(k) = a*y(k-1) + b*x(k) + b*x(k-1);
    end
end

%Ex3
h=zeros(1,N); %inicializamos o vetor h da resposta ao impulso com zeros e de mesmo tamanho N

% 'for' usado para inicizaliar o degrau unitário (para i>1 u(i) = 1)
u=zeros(1,N); 
for i=1:N;
    u(i) = 1;
end

% Aplicando a resposta ao impulso dada na questão
for k=1:N
    if k==1 % 'if' usada para evitar o mesmo erro da questão 2 (posição 0 não existe) 
        h(k) = 0.0317 * (0.9366^k * u(k) + 0.9366^(k-1) * 0);
    else % caso contrário, segue a equação igual da questão
        h(k) = 0.0317 * (0.9366^k * u(k) + 0.9366^(k-1) * u(k-1));
    end
end






%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%Gráficos e verificação
figure;
subplot(3,1,1);
stem(n,x);
xlabel('n');
ylabel('Amplitude');
title('Sequência Impulso Unitário');

subplot(3,1,2);
stem(n,y);
xlabel('n');
ylabel('Amplitude');
title('Resposta ao Impulso - y[n]');

subplot(3,1,3);
stem(n,h);
xlabel('n');
ylabel('Amplitude');
title('Resposta ao Impulso - h[n]');

%Soma da diferença das duas respostas calculadas
disp(['Soma dos erros: ' num2str(sum(y-h))]);
