close all;
clear all;
clc;

%método de newton raphson para polinômios
%função x ao quadrado

x = 20; 
g = x/2;

tol = 1e-6;

klim = 5; %limitando as iteracoes
k = 0;
flag = 0;

while (g^2 - x > tol)
    g = g - (g^2 - x)/(2*g); % Update x with the current guess
    k = k+1;

    if k == klim %limitar iteracoes
        disp(['Atingido o numero max de iteracoes: ', num2str(klim)]);
        flag = 1;
        break;
    end
end

if flag == 0
    disp(['RAIZ QUADRADA DE ', num2str(x), ' é: ',num2str(g)]);
end