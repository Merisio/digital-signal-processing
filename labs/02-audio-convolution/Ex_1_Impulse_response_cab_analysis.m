clear all;
close all;
clc;

%Importa arquivo com resposta ao impulso
%[h, fs] = audioread('IR/1960-G12M25-SM57-Cone-1in.wav'); %fs=48 kHz
%[h, fs] = audioread('IR/1960-G12M25-SM57-CapEdge45-1in.wav'); %fs=48 kHz
[h, fs] = audioread('IR/1960-G12T-75-4x12-sm57-1in-0c.wav'); %fs=96 kHz
%[h, fs] = audioread('IR/Hyperion_212c_V30_Cone_SM57.wav'); %fs=44.1 kHz

%Determina a quantidade de amostras da resposta ao impulso
comp_h = length(h);

%Exibe a resposta ao impulso capturada
t = (0:comp_h-1)/fs;
plot(t,h);
xlabel('t (s)');
title('Resposta ao impulso capturada');

%Reproduz a resposta ao impulso
player = audioplayer(h, fs);
play(player);
fprintf('Pressione qualquer tecla para continuar.\n');
pause; %Pressione Enter na Command Window para continuar


%Trunca a resposta ao impulso para implementação
h_trunc_2048 = h(1:2048);
h_trunc_1024 = h(1:1024);
h_trunc_256 =  h(1:256);

%Exibe a resposta ao impulso truncada com 2048 amostras
figure;
n=0:length(h_trunc_2048)-1;
stem(n,h_trunc_2048);
xlabel('n');
title('Resposta ao impulso - 2048 amostras');

%Exibe a resposta ao impulso truncada com 1024 amostras
figure;
n=0:length(h_trunc_1024)-1;
stem(n,h_trunc_1024);
xlabel('n');
title('Resposta ao impulso - 1024 amostras');

%Exibe a resposta ao impulso truncada com 256 amostras
figure;
n=0:length(h_trunc_256)-1;
stem(n,h_trunc_256);
xlabel('n');
title('Resposta ao impulso - 256 amostras');


%Ajusta a taxa de amostragem do arquivo de audio para ser igual a da resposta ao
%impulso
[audioData, fs_mp3] = audioread('Amostras_Audio/Shoot.mp3');
if fs ~= fs_mp3
    audioData = resample(audioData,fs,fs_mp3);
end


%Faz a convolução do sinal de entrada com a resposta ao impulso
audioFiltrado = filter(h_trunc_2048,1,audioData);

%Normaliza a amplitude do sinal
maxAmplitude = max(max(abs(audioFiltrado)));
audioFiltradoNormalized = audioFiltrado / maxAmplitude;

%Envia o sinal para a placa de audio sem IR
player = audioplayer(audioData, fs);
play(player);
pause(10);
stop(player);

%Envia o sinal para a placa de audio com IR
player = audioplayer(audioFiltradoNormalized, fs);
play(player);
pause(10);
stop(player);

