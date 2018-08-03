% Modal damping

%desired ratio
ratio = 0.01;

%Eigendecomposition
[U, W] = eig(KgR, MgR);

L = length(U);

Da = zeros(L);
for i=1:L

    Da(i,i) = 2*ratio*sqrt(W(i,i));
    
end

%Compute damping matrix
C =inv(U')*Da*inv(U);