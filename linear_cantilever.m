%Linear beam model

%%
n_elements = 10;
n_nodes = n_elements + 1;
n_dofs = n_nodes*2;
x = linspace(0, 1, n_nodes);

rng(102);
%%

L = 1000; %mm
rho = 0.006; %kg/mm
E = 210000; %N/mm2
I = 0.801*10^6; %mm4
A = 764; %mm^2
Alpha1= 0.01;  Alpha2= 0.0001; % Ratio ~1% on first and second mode

%Element stiffnes matrix
L = L/n_elements;
k = [12, -6*L, -12, -6*L; -6*L, 4*L^2, 6*L, 2*L^2; -12, 6*L, 12, 6*L; -6*L, 2*L^2, 6*L, 4*L^2;]*E*I/L^3;

%Element mass matrix
m = [156, 22*L, 54, -13*L; 22*L, 4*L^2, 13*L, -3*L^2; 54, 13*L, 156, -22*L; -13*L, -3*L^2, -22*L, 4*L^2;]*rho*A*L/420;

%Global stiffness matrix
n_dofs = n_nodes*2;
K = zeros(n_dofs, n_dofs);
for i=1:n_elements
    K(1+2*(i-1):1+2*(i-1)+3,1+2*(i-1):1+2*(i-1)+3) = K(1+2*(i-1):1+2*(i-1)+3,1+2*(i-1):1+2*(i-1)+3) + k;

end

%Global mass matrix
M = zeros(n_dofs, n_dofs);
for i=1:n_elements
    M(1+2*(i-1):1+2*(i-1)+3,1+2*(i-1):1+2*(i-1)+3) = M(1+2*(i-1):1+2*(i-1)+3,1+2*(i-1):1+2*(i-1)+3) + m;
end

%Global damping matrix
C = Alpha1*M + Alpha2*K;

%Force vector
F = zeros(n_dofs, 1); 
F(end-1) = 10000;

%Initial conditions
dz0 = zeros(n_nodes-1, 1);
dzt0 = zeros(n_nodes-1, 1);

d0 = zeros(n_dofs-2, 1);
dt0 = zeros(n_dofs-2, 1);
d0(1:2:end) = dz0;

F = F(3:end);
K = K(3:end,3:end);
M = M(3:end,3:end);
%C = C(3:end,3:end);

% Modal damping

%desired ratio
ratio = 0.01;

%Eigendecomposition
[U, W] = eig(K, M);

L = length(U);

Da = zeros(L);
for i=1:L

    Da(i,i) = 2*ratio*sqrt(W(i,i));
    
end

%Compute damping matrix
C =inv(U')*Da*inv(U);

%% Static solution
d_static = K\F;
d_static = [0; 0; d_static];
%plot(d_static(1:2:end))

%% Eigenfrequencies

[ev, ef] = eig(K, M);

ef1 = sqrt(ef(1,1));
ef2 = sqrt(ef(2,2));
ef3 = sqrt(ef(3,3));
ef4 = sqrt(ef(4,4));

%ef1 = 0.67
%ef2 = 4.25
%ef3 = 12.27
%ef4 = 25.16
%plot(ev(1:2:end,1:5))

%% Time integration parameters

Theta = 0.5;
tf = 10000; 
dt = 0.1;
omega = 0.4;
k = tf/dt; %Total number of timesteps

%% Generate load vector within frequency band

freq_band = linspace(0.1*ef1,0.7*ef1,6);
%freq_band2 = linspace(1.5*ef1,1.2*ef4,10);
%freq_band = [freq_band1, freq_band2];
F = zeros(k, n_dofs-2);
triangle = linspace(0,1,n_nodes-1);
ft = zeros(1,k);
amp = 1;
t = linspace(0,tf,k);
for i=1:(length(freq_band)-1)

        f0 = freq_band(i);
        f1 = freq_band(i+1);
        rf = f0 + rand()*(f1 - f0);%random frequency between f0 and f1
        
        ft = ft + amp*sin(rf*t + pi*(2*rand() - 1));
    
end

for i=1:k
    
    %F(i, 1:2:end) = ft(i)*triangle;
    F(i, end-1) = ft(i);

end

F = F*10000/length(freq_band);

%% Resonance load

%F = zeros(k, n_dofs-2);

%ft = sin(ef4*t);
%for i=1:k
    
%    F(i, 1:2:end) = ft(i);%*triangle;

%end

%F = F*10000; 

%% Constant load

%F(:,1:2:end) = 10000;

%% Free vibrations

%F = zeros(k, n_dofs-2);
%d0(1:2:end) = linspace(0,10,n_nodes-1)';

%% Time integration (Theta Method)

d_old = d0;
dt_old = dt0;

Minv = inv(M);
MinvK = Minv*K;
Q = inv(M + (Theta*dt)^2*K);
P = (M - dt^2*Theta*(1-Theta)*K);


D = zeros(k,n_nodes-1);
Dt = zeros(k,n_nodes-1);

D(1,:) = d_old(1:2:end);
D(1,:) = dt_old(1:2:end);

for i=2:k
    
    F_old = F(i-1, :)';
    F_new = F(i,:)';
    
    d_new = Q*P*d_old + dt*Q*M*dt_old + dt^2*Q*(Theta^2*F_new + Theta*(1-Theta)*F_old);
    
    dt_new = dt_old - dt*MinvK*(Theta*d_new + (1-Theta)*d_old) + dt*Minv*(Theta*F_new + (1-Theta)*F_old);
    
    dz = d_new(1:2:end);
    dzt = dt_new(1:2:end);
    
    D(i,:) = dz;
    Dt(i,:) = dzt;
    
    d_old = d_new;
    dt_old = dt_new;
    
end

    



    