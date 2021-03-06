% Smooth Load Series

%% Eigenfrequencies and Eigenmodes

[ev, ef] = eig(K, M);

ef1 = sqrt(ef(1,1));
ef2 = sqrt(ef(2,2));
ef3 = sqrt(ef(3,3));
ef4 = sqrt(ef(4,4));

%ef1 = 0.67
%ef2 = 4.25
%ef3 = 12.27
%ef4 = 25.16
% all in (rad/s)
%plot(ev(1:2:end,1:5))

%% Time integration parameters

Theta = 0.5;
tf = 100; 
dt = 0.1;
%omega = 0.4;
k = tf/dt; %Total number of timesteps

%% Generate load spectrum

freq_band1 = linspace(0.1*ef1,1.2*ef4,10);
freq_band2 = linspace(0.1*ef2,1.2*ef4,10);
freq_band = [freq_band1, freq_band2];
F = zeros(k, n_dofs-2);
triangle = linspace(0,1,n_nodes-1);
rf = zeros(length(freq_band),1);
amp = 1;

for i=1:(length(freq_band)-1)

    f0 = freq_band(i);
    f1 = freq_band(i+1);
    rf(i) = f0 + rand()*(f1 - f0);%random frequency between f0 and f1
    
end


%% Generate load series


t = linspace(0,tf,k);

ft = zeros(1,k);
phase = pi*rand(1,length(freq_band));
w = 1;
for i=1:k
    
    for j=1:length(freq_band)

        ft(i) = ft(i) + w*sin(rf(j)*t(i) + phase(j));

    end
end