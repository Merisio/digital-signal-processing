clear all;
close all;
clc;

%Importa o arquivo de áudio
[audioData, fs_audio] = audioread('Amostras_Audio/Shoot.mp3');

%Faz a convolução do sinal de áudio com  a resposta ao impulso dos
%gabinetes
Audio_conv_h1 = convolution('IR/1960-G12M25-SM57-Cone-1in.wav', audioData, fs_audio, 2048);
Audio_conv_h2 = convolution('IR/1960-G12M25-SM57-CapEdge45-1in.wav', audioData, fs_audio, 2048);
Audio_conv_h3 = convolution('IR/1960-G12T-75-4x12-sm57-1in-0c.wav', audioData, fs_audio, 2048);
Audio_conv_h4 = convolution('IR/Hyperion_212c_V30_Cone_SM57.wav', audioData, fs_audio, 2048);

%Envia o sinal para a placa de audio sem IR
disp('Arquivo de áudio original.');
play_audio(audioData, fs_audio);
%Envia o sinal para a placa de audio com IR
clc;
disp('IR 1960-G12M25-SM57-Cone-1in.');
play_audio(Audio_conv_h1, fs_audio);
clc;
disp('IR 1960-G12M25-SM57-CapEdge45-1in.');
play_audio(Audio_conv_h2, fs_audio);
clc;
disp('IR/1960-G12T-75-4x12-sm57-1in-0c');
play_audio(Audio_conv_h3, fs_audio);
clc;
disp('IR Hyperion_212c_V30_Cone_SM57');
play_audio(Audio_conv_h4, fs_audio);
