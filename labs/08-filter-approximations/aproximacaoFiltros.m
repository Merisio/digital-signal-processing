clear all;
close all;
clc;

w = logspace(1, 5, 1000);

n = 2; % Ordem dos protótipos
Wc = 1000; % Frequência de corte desejada

Wo = 1000; % Frequência central
Bw = 5000; % Largura de banda

Rp = 5; % Ripple em dB na banda passante 
Rs = 30; % Atenuação em dB na banda de rejeição

% ------------------ Protótipo LPF Butterworth ------------------ 

[z,p,k] = buttap(n); %Butterworth de ordem n

[b,a] = zp2tf(z,p,k); %Converte polos e zeros para função de transferência
H_LPF_Butter = tf(b,a) %Exibe função de transferência
freqs(b,a); %Resposta em Frequência
title('Protótipo LPF Butterworth (n=2)');

% Passa baixa
[b1,a1] = lp2lp(b,a,Wc);
H_LPF_Butter = tf(b1,a1)
figure;
freqs(b1,a1,w);
title('LPF Butterworth Desnormalizado');

% Passa alta
[b2,a2] = lp2hp(b,a,Wc);
H_LPF_Butter = tf(b2,a2)
figure;
freqs(b2,a2,w);
title('HPF Butterworth Desnormalizado');

% Passa banda
[b2,a2] = lp2bp(b,a,Wo,Bw);
H_LPF_Butter = tf(b2,a2)
figure;
freqs(b2,a2,w);
title('BPF Butterworth Desnormalizado');
 
% Rejeita banda
[b3,a3] = lp2bs(b,a,Wo,Bw);
H_LPF_Butter = tf(b3,a3)
figure;
freqs(b3,a3,w);
title('BPF Butterworth Desnormalizado');

% ------------------ Protótipo LPF Chebyshev ------------------ 

[z,p,k] = cheb1ap(n, Rp); %Chebyshev de ordem n

[b,a] = zp2tf(z,p,k); %Converte polos e zeros para função de transferência
H_LPF_ChebyI = tf(b,a) %Exibe função de transferência
figure;
freqs(b,a); %Resposta em Frequência
title('Protótipo LPF Chebyshev (n=2)');

% Passa baixa
[b1,a1] = lp2lp(b,a,Wc);
H_LPF_ChebyI = tf(b1,a1)
figure;
freqs(b1,a1,w);
title('LPF Chebyshev Desnormalizado');

% Passa alta
[b2,a2] = lp2hp(b,a,Wc);
H_LPF_ChebyI = tf(b2,a2)
figure;
freqs(b2,a2,w);
title('HPF Chebyshev Desnormalizado');

% Passa banda
[b2,a2] = lp2bp(b,a,Wo,Bw);
H_LPF_ChebyI = tf(b2,a2)
figure;
freqs(b2,a2,w);
title('BPF Chebyshev Desnormalizado');
 
% Rejeita banda
[b3,a3] = lp2bs(b,a,Wo,Bw);
H_LPF_ChebyI = tf(b3,a3)
figure;
freqs(b3,a3,w);
title('BPF Chebyshev Desnormalizado');


% ------------------ Protótipo LPF Chebyshev II ------------------ 

[z,p,k] = cheb2ap(n, Rs); %Chebyshev de ordem n

[b,a] = zp2tf(z,p,k); %Converte polos e zeros para função de transferência
H_LPF_ChebyII = tf(b,a) %Exibe função de transferência
figure;
freqs(b,a); %Resposta em Frequência
title('Protótipo LPF Chebyshev (n=2)');

% Passa baixa
[b1,a1] = lp2lp(b,a,Wc);
H_LPF_ChebyII = tf(b1,a1)
figure;
freqs(b1,a1,w);
title('LPF Chebyshev Desnormalizado');

% Passa alta
[b2,a2] = lp2hp(b,a,Wc);
H_LPF_ChebyII = tf(b2,a2)
figure;
freqs(b2,a2,w);
title('HPF Chebyshev Desnormalizado');

% Passa banda
[b2,a2] = lp2bp(b,a,Wo,Bw);
H_LPF_ChebyII = tf(b2,a2)
figure;
freqs(b2,a2,w);
title('BPF Chebyshev Desnormalizado');
 
% Rejeita banda
[b3,a3] = lp2bs(b,a,Wo,Bw);
H_LPF_ChebyII = tf(b3,a3)
figure;
freqs(b3,a3,w);
title('BPF Chebyshev Desnormalizado');


% ------------------ Protótipo LPF Cauer ------------------ 

[z,p,k] = ellipap(n, Rp, Rs); %Cauer de ordem n

[b,a] = zp2tf(z,p,k); %Converte polos e zeros para função de transferência
H_LPF_Cauer = tf(b,a) %Exibe função de transferência
figure;
freqs(b,a); %Resposta em Frequência
title('Protótipo LPF Cauer (n=2)');

% Passa baixa
[b1,a1] = lp2lp(b,a,Wc);
H_LPF_Cauer = tf(b1,a1)
figure;
freqs(b1,a1,w);
title('LPF Cauer Desnormalizado');

% Passa alta
[b2,a2] = lp2hp(b,a,Wc);
H_LPF_CauerI = tf(b2,a2)
figure;
freqs(b2,a2,w);
title('HPF Cauer Desnormalizado');

% Passa banda
[b2,a2] = lp2bp(b,a,Wo,Bw);
H_LPF_Cauer = tf(b2,a2)
figure;
freqs(b2,a2,w);
title('BPF Cauer Desnormalizado');
 
% Rejeita banda
[b3,a3] = lp2bs(b,a,Wo,Bw);
H_LPF_Cauer = tf(b3,a3)
figure;
freqs(b3,a3,w);
title('BPF Cauer Desnormalizado');