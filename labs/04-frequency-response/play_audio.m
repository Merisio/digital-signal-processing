function play_audio(audio, fs_audio)
    player = audioplayer(audio, fs_audio);
    play(player);
    pause(5);
    stop(player);
    disp('Pressione qualquer tecla para continuar.');
    pause; 
end
