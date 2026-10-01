function [y] = gera_sinais(A, f, phi, offset, t, type)
% Gera uma forma de onda
% A: amplitude
% f: frequencia em heartz
% phi: fase em graus
% offset: deslocamento vertical
% time: vetor com tempo de simulação

phi_rad = deg2rad(phi);

if type == "sine"
    y = A*sin(2*pi*f*t + phi_rad) + offset;
else if type == "square"
    y = A*square(2*pi*f*t + phi_rad) + offset;
else if type == "triangle"
    y = A*sawtooth(2*pi*f*t + phi_rad,0.5) + offset;
else
    disp('Forma de onda nao definida');
end
