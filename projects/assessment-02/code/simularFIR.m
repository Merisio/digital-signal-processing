function [x, y_plot] = simularFIR(x_buffer, h, fs, f_in, ordem)

Ts = 1/fs;
f = f_in;
T = 1/f;
tf = 10 * T;
NP = tf / Ts;

for n = 0:NP
    x(n+1) = sin(2*pi*f*Ts*n);

    y = h(1)*x_buffer(1) + ...
        h(2)*(x_buffer(2) + x_buffer(end)) + ...
        h(3)*(x_buffer(3) + x_buffer(end-1)) + ...
        h(4)*(x_buffer(4) + x_buffer(end-2)) + ...
        h(5)*(x_buffer(5) + x_buffer(end-3)) + ...
        h(6)*x_buffer(6);

    for i = 1:ordem-1
        x_buffer(i) = x_buffer(i+1);
    end

    x_buffer(10) = x(n+1);

    y_plot(n+1) = y;
end
