# Frequency response

[Back to repository](../../README.md)

[resposta_frequencia.m](resposta_frequencia.m) filters 100 Hz, 8 kHz, and 500 Hz test tones at a 48 kHz sampling frequency. It compares input/output waveforms and computes magnitude and phase responses from the filter expression.

Set MATLAB Current Folder to this directory and run `resposta_frequencia`. The local [play_audio.m](play_audio.m) plays each signal for five seconds and waits for keyboard input. Audio output is required.

[dadosPratica1509.txt](dadosPratica1509.txt) is retained as accompanying practice data; the script does not load it. This folder's playback helper differs from the one used in the convolution lab, so keep each activity's folder selected when running it.
