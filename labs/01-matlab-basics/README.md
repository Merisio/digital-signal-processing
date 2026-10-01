# MATLAB basics

[Back to repository](../../README.md)

Introductory exercises for signal generation and MATLAB programming.

| Entry point | Topic |
| --- | --- |
| [geraSenoide.m](geraSenoide.m) | Sine/cosine generation, phase, offset, and plots |
| [gerasenocomfuncao.m](gerasenocomfuncao.m) | Sine generation using [gera_seno.m](gera_seno.m) |
| [ondaQuadrada.m](ondaQuadrada.m) | Square-wave generation |
| [geraSinaisComFuncao.m](geraSinaisComFuncao.m) | Waveform helper exercise using [gera_sinais.m](gera_sinais.m) |
| [eco.m](eco.m) | Echo creation/removal using the built-in Handel audio example |
| [metodoDeNewton.m](metodoDeNewton.m) | Newton iteration for a square root |
| [tabelaTabuada.m](tabelaTabuada.m) | Preallocation and nested loops |

Set MATLAB Current Folder to this directory and run `geraSenoide` to start. Waveform functions `square` and `sawtooth` require Signal Processing Toolbox. The echo example uses audio output and timed pauses.

`gera_sinais.m` is an unfinished exercise: its nested `else if` blocks are missing closing `end` statements. Consequently, `geraSinaisComFuncao.m` needs that helper completed before it can run. Other source files are retained as originally written.
