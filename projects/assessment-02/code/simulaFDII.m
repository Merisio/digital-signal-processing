function [x, y_plot] = simulaFDII(F, WL, FL, w_buffer1, w_buffer2, SOSq, fs, f_in)

Ts = 1/fs;
f = f_in;
T = 1/f;
tf = 10 * T;
NP = tf / Ts;
ordem = 6;

for n=0:NP
    X=1*sin(2*pi*f*Ts*n); %Simula sinal amostrado;
    x(n+1)= fi(X,1,WL,FL,'fimath',F); %Quantiza o sinal amostrado

    %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
    %Inicia processo de filtragem
    %Equação do filtro Forma Direta II Transposta SOS
    y1 = SOSq(1,1)*x(n+1) + w_buffer1(1);
    w11 = w_buffer1(2) + SOSq(1,2)*x(n+1) - SOSq(1,5)*y1;
    w12 = -SOSq(1,6)*y1 + SOSq(1,3)*x(n+1);

    w_buffer1 = [w11 w12];    %Atualiza o buffer  [w11(n-1) w12(n-1)]

    y2 = SOSq(2,1)*y1 + w_buffer2(1);
    w21 = w_buffer2(2) + SOSq(2,2)*y1 - SOSq(2,5)*y2;
    w22 = -SOSq(2,6)*y2 + SOSq(2,3)*y1;

    w_buffer2 = [w21 w22];    %Atualiza o buffer  [w21(n-1) w22(n-1)]
    
    %
    %Termina processo de filtragem
    %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
    y_plot(n+1) = y2;   %Variável para o gráfico do sinal filtrado

end
