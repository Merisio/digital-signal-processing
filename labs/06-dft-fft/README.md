# DFT, FFT, and frequency response

[Back to repository](../../README.md) · [Course guide](../../materials/lab-guides/dft-fft.pdf)

[DFT_FFT_vs_Resp_Freq.m](DFT_FFT_vs_Resp_Freq.m) loads a low-pass filter's impulse response from [Imp_resp_PB.mat](Imp_resp_PB.mat), pads it to a power-of-two length, computes the DFT with nested loops, and compares it with MATLAB's `fft` and the analytical frequency response.

Set MATLAB Current Folder to this directory and run `DFT_FFT_vs_Resp_Freq`. The script generates magnitude/phase plots and prints elapsed time for both calculations. Timings depend on the machine and input length; no fixed speedup is claimed.

The explicit DFT has quadratic cost. Keep the supplied data beside the script so its relative `load` statement resolves. The script's frequency plot indexing is preserved from the coursework and has not been revalidated during reorganization.
