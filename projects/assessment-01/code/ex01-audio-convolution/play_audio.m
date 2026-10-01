function play_audio(audio, fs_audio)
    %Envia o sinal para a placa de audio
    player = audioplayer(audio, fs_audio);
    play(player);
    pause(10);
    stop(player);
end
