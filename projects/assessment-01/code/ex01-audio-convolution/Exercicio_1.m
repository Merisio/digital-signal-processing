clear all;
close all;
clc;

%Importa o arquivo de áudio stereo
[audioData, fs_audio] = audioread('Shoot.mp3');
%Converte o arquivo de áudio para mono
audioData_mono = mean(audioData,2);

%Normaliza a amplitude do sinal de entrada
maxAmplitudeAudio = max(abs(audioData_mono));
AudioData_mono_Normalized = audioData_mono / maxAmplitudeAudio;

%Importa arquivo com resposta ao impulso
[h, fs] = audioread('Hyperion_212c_V30_Cone_SM57.wav'); %fs=44.1 kHz

%Reamostra a resposta ao impulso se a taxa de amostragem for diferente
%da do áudio
if fs~=fs_audio
    h = resample(h,fs_audio,fs);
    fs = fs_audio;
end

%Trunca a resposta ao impulso para implementação
h_trunc = h(1:2048);

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%Chamada a função MYCONV que deve ser desenvolvida para realizar a
%convolução do sinal de entrada AudioData_mono_Normalized com a resposta ao
%impulso truncada h_trunc
%
%Mantenha os nomes das variáveis de entada e saída para que os comandos
%seguintes continuem funcionando. Apenas crie a função e salve na mesma 
%pasta desse arquivo.

audioFiltrado_myconv = myconv(h_trunc,AudioData_mono_Normalized);

%
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%


%Normaliza a amplitude do sinal de saída da implementação MYCONV
maxAmplitude = max(abs(audioFiltrado_myconv));
audioFiltradoNormalized = audioFiltrado_myconv / maxAmplitude;

%Faz a convolução do sinal de entrada normalizado com a resposta ao 
%impulso usando a função FILTER do Matlab para comparação
audioFiltrado_filter = filter(h_trunc,1,AudioData_mono_Normalized);

%Normaliza a amplitude do sinal processado com FILTER
maxAmplitude_filter = max(abs(audioFiltrado_filter));
audioFiltradoNormalized_filter = audioFiltrado_filter / maxAmplitude_filter;



%Envia o sinal de entrada sem IR e normalizado para a placa de audio 
clc;
disp('Audio original sem IR');
play_audio(AudioData_mono_Normalized, fs);


%Envia o sinal processado com IR e normalizado para a placa de audio
clc;
disp('Audio com IR usando MYCONV');
play_audio(audioFiltradoNormalized, fs);


%Envia o sinal processado com IR com função FILTER e normalizado para a 
%placa de audio
clc;
disp('Audio com IR usando FILTER');
play_audio(audioFiltradoNormalized_filter, fs);


%Análise comparativa das implementações. Deve ser um valor próximo de zero.
N = length(audioFiltradoNormalized_filter);
audioFiltradoNormalized_truncado = audioFiltradoNormalized(1:N);

audioFiltradoNormalized_filter = audioFiltradoNormalized_filter';

teste = sum(audioFiltradoNormalized_truncado - audioFiltradoNormalized_filter);
clc;
disp(['Soma dos erros: ', num2str(teste)]);