function [x, y_plot] = simulaFDI(F, WL, FL, x_buffer, y_buffer, bd, ad, fs, f_in)

Ts = 1/fs;
f = f_in;
T = 1/f;
tf = 10 * T;
NP = tf / Ts;
ordem = 6;

for n = 0:NP
    X=1*sin(2*pi*f*Ts*n); %Simula sinal amostrado;
    
    x(n+1)= fi(X,1,WL,FL,'fimath',F); %Quantiza o sinal amostrado

    y = -ad(2)*y_buffer(6) - ad(3)*y_buffer(5) - ad(4)*y_buffer(4) ...
        - ad(5)*y_buffer(3) - ad(6)*y_buffer(2) - ad(7)*y_buffer(1) ...
        + bd(1)*x(n+1) + bd(2)*x_buffer(6) + bd(3)*x_buffer(5) ...
        + bd(4)*x_buffer(4) + bd(5)*x_buffer(3) + bd(6)*x_buffer(2) ...
        + bd(7)*x_buffer(1);

    for i = 1:ordem-1
        x_buffer(i) = x_buffer(i+1);
        y_buffer(i) = y_buffer(i+1);
    end

    x_buffer(6) = x(n+1);
    y_buffer(6) = y;

    y_plot(n+1) = y;
end
