function [y] = gera_seno(A, f, phi, offset, t)
% Gera uma forma de onda senoidal
% A: amplitude
% f: frequencia em heartz
% phi: fase em graus
% offset: deslocamento vertical
% time: vetor com tempo de simulação

phi_rad = deg2rad(phi);

y = A*sin(2*pi*f*t + phi_rad) + offset;

