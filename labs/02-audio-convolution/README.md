# Audio convolution and cabinet impulse responses

[Back to repository](../../README.md)

Examples of applying speaker cabinet impulse responses to audio recordings.

- [Ex_1_Impulse_response_cab_analysis.m](Ex_1_Impulse_response_cab_analysis.m) plots and plays an impulse response, truncates it to different lengths, and filters an audio sample.
- [Ex_2_Impulse_response_comparative.m](Ex_2_Impulse_response_comparative.m) compares the original sample with four cabinet responses.
- [convolution.m](convolution.m) truncates/resamples the impulse response, applies `filter`, and normalizes the output.
- [play_audio.m](play_audio.m) handles playback with a timed pause.

Set MATLAB Current Folder to this directory, then run either `Ex_1_Impulse_response_cab_analysis` or `Ex_2_Impulse_response_comparative`. MATLAB, Signal Processing Toolbox, and an audio output device are required. Some stages pause for keyboard input.

The [IR folder](IR/) and [audio sample folder](Amostras_Audio/) retain their original names so relative paths in the scripts continue to resolve. Their original descriptions are in [IR/Leia me.txt](IR/Leia%20me.txt) and [Amostras_Audio/Leia me.txt](Amostras_Audio/Leia%20me.txt). Files ending in `_IR` are reference recordings for comparison. These are supplied lab resources, not recordings or impulse responses created by the repository contributors.
