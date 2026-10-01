function [audioFiltradoNormalized fs_audio] = convolution(arquivo_imp_resp, audioData, fs_audio, trunc)
%[audioFiltradoNormalized fs_audio] = CONVOLUTION(arquivo_imp_resp, audioData, fs_audio, trunc)
%
%Inputs:
%arquivo_imp_resp: impulse response sequence h[n]
%audioData: audio sequence x[n]
%fs_audio: audio file sampling frequency
%trunc: desired lenght of the truncated impulse response
%
%Outputs:
%audioFiltradoNormalized: convolved response x[n]*h[n]
%fs_audio: audio file sampling frequency

    %Importa arquivo com resposta ao impulso
    [h, fs] = audioread(arquivo_imp_resp);
    
    %Trunca resposta ao impulso
    h_trunc = h(1:trunc);


    %Reamostra a resposta ao impulso se a taxa de amostragem for diferente
    %da do áudio
    if fs~=fs_audio
        h_trunc = resample(h_trunc,fs_audio,fs);
    end

    %Faz a convolução do sinal de entrada com a resposta ao impulso
    audioFiltrado = filter(h_trunc, 1, audioData);

    %Normaliza a amplitude do sinal
    maxAmplitude = max(max(abs(audioFiltrado)));
    audioFiltradoNormalized = audioFiltrado / maxAmplitude;

end
