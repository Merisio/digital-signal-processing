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

%Determina as freqs laterais dos filtros
syms W1s W2s;
eq1 = Wo^2 == W1s*W2s;
eq2 = Bw == W2s-W1s;
% Resolvendo as equações
sol = solve([eq1, eq2], [W1s, W2s]);
W1 = double(sol.W1s(sol.W1s>0));
W2 = double(sol.W2s(sol.W1s>0));

Rp = 5;
Rs = 30;

% -------- LPF Butterworth de 2º Ordem --------
[b_lp, a_lp] = butter(n, Wc,'low','s');
H_LPF_Butter = tf(b_lp, a_lp)
figure;
freqs(b_lp, a_lp, w);
title('LPF Butterworth');

[b_hp, a_hp] = butter(n, Wc,'high','s');
H_HPF_Butter = tf(b_hp, a_hp)
figure;
freqs(b_hp, a_hp, w);
title('HPF Butterworth');

[b_bp, a_bp] = butter(n, [W1,W2],'bandpass','s');
H_BPF_Butter = tf(b_bp, a_bp)
figure;
freqs(b_bp, a_bp, w);
title('BPF Butterworth');

[b_bs, a_bs] = butter(n, [W1,W2],'stop','s');
H_BSF_Butter = tf(b_bs, a_bs)
figure;
freqs(b_bs, a_bs, w);
title('BSF Butterworth');

% -------- LPF Chebyshev I de 2º Ordem --------
[b_lp, a_lp] = cheby1(n, Rp, Wc,'low','s');
H_LPF_ChebyI = tf(b_lp, a_lp)
figure;
freqs(b_lp, a_lp, w);
title('LPF Chebyshev I');

[b_hp, a_hp] = cheby1(n, Rp, Wc,'high','s');
H_HPF_ChebyI = tf(b_hp, a_hp)
figure;
freqs(b_hp, a_hp, w);
title('HPF Chebyshev I');

[b_bp, a_bp] = cheby1(n, Rp, [W1,W2],'bandpass','s');
H_HPF_ChebyI = tf(b_bp, a_bp)
figure;
freqs(b_bp, a_bp, w);
title('BPF Chebyshev I');

[b_bs, a_bs] = cheby1(n, Rp, [W1,W2],'stop','s');
H_HPF_ChebyI = tf(b_bs, a_bs)
figure;
freqs(b_bs, a_bs, w);
title('BSF Chebyshev I');

% -------- LPF Chebyshev II de 2º Ordem --------
[b_lp, a_lp] = cheby2(n, Rs, Wc,'low','s');
H_LPF_ChebyII = tf(b_lp, a_lp)
figure;
freqs(b_lp, a_lp, w);
title('LPF Chebyshev II');

[b_hp, a_hp] = cheby2(n, Rs, Wc,'high','s');
H_HPF_Cauer = tf(b_hp, a_hp)
figure;
freqs(b_hp, a_hp, w);
title('HPF Chebyshev II');

[b_bp, a_bp] = cheby2(n, Rs, [W1,W2],'bandpass','s');
H_HPF_Cauer = tf(b_bp, a_bp)
figure;
freqs(b_bp, a_bp, w);
title('BPF Chebyshev II');

[b_bs, a_bs] = cheby2(n, Rs, [W1,W2],'stop','s');
H_HPF_Cauer = tf(b_bs, a_bs)
figure;
freqs(b_bs, a_bs, w);
title('BSF Chebyshev II');

% -------- LPF Cauer de 2º Ordem --------
[b_lp, a_lp] = ellip(n, Rp, Rs, Wc,'low','s');
H_LPF_Cauer = tf(b_lp, a_lp)
figure;
freqs(b_lp, a_lp, w);
title('LPF Chebyshev II');

[b_hp, a_hp] = ellip(n, Rp, Rs, Wc,'high','s');
H_HPF_Cauer = tf(b_hp, a_hp)
figure;
freqs(b_hp, a_hp, w);
title('HPF Chebyshev II');

[b_bp, a_bp] = ellip(n, Rp, Rs, [W1,W2],'bandpass','s');
H_HPF_ChebyII = tf(b_bp, a_bp)
figure;
freqs(b_bp, a_bp, w);
title('BPF Chebyshev II');

[b_bs, a_bs] = ellip(n, Rp, Rs, [W1,W2],'stop','s');
H_HPF_ChebyII = tf(b_bs, a_bs)
figure;
freqs(b_bs, a_bs, w);
title('BSF Chebyshev II');


