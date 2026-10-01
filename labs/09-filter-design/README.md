# Filter design and bilinear transformation

[Back to repository](../../README.md)

Examples of designing analog filters from passband/stopband requirements, then comparing the analog response with digital versions obtained by the bilinear transform, with and without prewarping.

| Script | Design |
| --- | --- |
| [butterworthLowPass.m](butterworthLowPass.m) | Butterworth low-pass |
| [chebyPassaAlta.m](chebyPassaAlta.m) | Chebyshev I high-pass |
| [cheby2passaBanda.m](cheby2passaBanda.m) | Chebyshev II band-pass |
| [cauerStopBand.m](cauerStopBand.m) | Elliptic band-stop |
| [av2ex1.m](av2ex1.m) | Preliminary band-pass assessment draft |

Set MATLAB Current Folder to this directory and run, for example, `butterworthLowPass`. Requirements: MATLAB, Signal Processing Toolbox, and Control System Toolbox. Frequency parameters and attenuation requirements are defined in each script.

`av2ex1.m` is a draft: it passes the sampling frequency (`fs = 48000`) as the filter order to `butter`. Review that parameter before running it. The completed group submission's entry point is [Assessment 02/script1.m](../../projects/assessment-02/code/script1.m). Original drafts and examples have been retained without algorithm changes.
