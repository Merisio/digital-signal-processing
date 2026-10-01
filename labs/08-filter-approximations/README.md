# Analog filter approximations

[Back to repository](../../README.md)

Two approaches to Butterworth, Chebyshev I, Chebyshev II, and elliptic (Cauer) analog filters:

- [aproximacaoFiltros.m](aproximacaoFiltros.m) creates normalized prototypes, converts zeros/poles to transfer functions, and applies low-pass, high-pass, band-pass, and band-stop transformations.
- [aproximacaoFiltros2.m](aproximacaoFiltros2.m) solves for band-edge frequencies symbolically and designs the corresponding filters directly.

Set MATLAB Current Folder to this directory and run a selected script. Both use MATLAB, Signal Processing Toolbox, and Control System Toolbox. The second also needs Symbolic Math Toolbox for `syms` and `solve`.

Parameters such as prototype order, cutoff/center frequency, bandwidth, ripple, and attenuation are defined at the beginning of each script. Frequency responses are plotted with `freqs`; original variable names and plot labels are retained.
