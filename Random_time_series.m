close all

%Random time series

x = linspace(0, tf, k);

y = zeros(length(x),1);
rn = rand();
for i=1:length(x)
    
    if mod(i,100) == 0
        rn = rand();
    end
    
    y(i) = sin(rn*x(i))^2 + cos(1/4*x(i)) - sin(17/360*x(i))^(3) - rn*sin(0.1*x(i)); 

end
plot(x,y)