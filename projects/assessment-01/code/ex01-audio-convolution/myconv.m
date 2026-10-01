function [y] = myconv(h,x);

t = length(h)+length(x)-1;
y = zeros(1, t);

for n=1:t
    for k=1:length(h)
        if n-k+1>0 && k<=length(h) && (n-k+1)<=length(x)
            y(n) = y(n) + h(k)*x(n-k+1);
        end
    end
end

%Defina aqui sua função. 

