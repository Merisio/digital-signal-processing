close all; %%fecha todas as janelas
clear all; %%limpa todas as variáveis
clc; %%limpa o terminal

%%TABELA COM A TABUADA (EXEMPLO)

tab = zeros(10,10); %%SEMPRE DECLARAR AS VARIÁVEIS NO INÍCIO PARA GANHO DE DESEMPENHO

for i = 1:10
    for j = 1:10
        tab(i, j) = i * j; %% Preenche a tabela com a tabuada
    end
end

disp('TABELA DE MULTIPLICAÇÂO:');
disp(tab);