%State space model

Ninv = inv(N);
As = Ninv*A;
Bs = Ninv*B;

%D = 

sys = ss(As, Bs, C, 0); 