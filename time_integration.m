% Time integration

%n_timesteps = 1000;
t_end = 4;

% Define u

%U = ones(762, n_timestes); %constant input
v = zeros(762,1);
v(4:7:end) = 1;
u = @(t) v*sin(2*pi*t/t_end);

%interpolate between timpesteps
%u = interp1(

% Initial values x0

%x0 = -inv(A)*B*u(0);
x0 = zeros(481,1);

% Integrate in time

Ninv = inv(N);
NAinv = Ninv*A;
NBinv = Ninv*B;


[t, y] = ode45(@(t,y) sts(t, y, NAinv, NBinv, u), [0 t_end], x0);

function dydt = sts(t,y, NAinv, NBinv, u)

    dydt =  NAinv*y + NBinv*u(t);

end