# Assessment 02 · IIR/FIR filters & fixed-point arithmetic

[Back to repository](../../README.md)

Group assessment by **Amarildo Piovesan Jr., Erik Takahiro Suzuki, and Pedro Augusto Merisio**, exploring digital filter design and numerical implementation at a sampling frequency of **48 kHz**.

## Processing stages

[script1.m](code/script1.m) is the main entry point:

1. Designs a Butterworth analog band-pass prototype with prewarped edges of 1–2 kHz, then applies the bilinear transform to obtain a sixth-order digital IIR filter.
2. Simulates the difference equation for input tones at 1, 1.5, and 2 kHz.
3. Quantizes coefficients and signals to signed fixed-point values with 32 total bits and 18 fractional bits, then simulates Direct Form I.
4. Forms second-order sections and explores a transposed Direct Form II implementation.
5. Loads FIR coefficients, plots impulse/frequency responses, and simulates a 5 kHz input using coefficient symmetry.

| Helper | Purpose |
| --- | --- |
| [simular_filtro.m](code/simular_filtro.m) | Floating-point difference equation with input/output buffers |
| [simulaFDI.m](code/simulaFDI.m) | Fixed-point Direct Form I simulation |
| [simulaFDII.m](code/simulaFDII.m) | Fixed-point two-section transposed Direct Form II simulation |
| [simularFIR.m](code/simularFIR.m) | Symmetric FIR implementation with an explicit sample buffer |
| [graficosFreqEfetiva.m](code/graficosFreqEfetiva.m) | Magnitude response plotting |
| [imp_resp_FIR.mat](code/imp_resp_FIR.mat) | Supplied FIR impulse response |

## Run

From the repository root in MATLAB:

```matlab
cd('projects/assessment-02/code')
script1
```

Required products: **MATLAB, Signal Processing Toolbox, Control System Toolbox, and Fixed-Point Designer**. Keep Current Folder on `code/` so the helper functions and `.mat` input can be resolved.

## Report, diagrams, and results

- [Submitted report](reports/report.pdf)
- [Assignment statement](../../materials/assignments/assessment-02.pdf)
- [Editable draw.io diagrams and PNG exports](diagrams/)
- [Saved result images](results/)
- [Original submission ZIP](../../archive/submissions/assessment-02.zip)

![Saved IIR frequency response](results/graficofreqquestao1.png)

## Implementation notes

This folder preserves the submitted code. The sixth-order IIR produces three second-order sections, but `simulaFDII.m` simulates only two, and the gain distribution in `script1.m` targets those two sections. Its final state update also uses the original input in one term of the second section. Review these details before treating that implementation as equivalent to the full design. `simularFIR.m` uses fixed buffer positions tailored to the supplied coefficients. Saved plots are submission artifacts; execution and numerical equivalence have not been newly validated.
