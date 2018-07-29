%Read matrices

A = textread('../STAS_matrices/AA.txt');
shapeA = A(1,:);
A = reshape(A(2:end,1), shapeA(1), shapeA(2));

B = textread('../STAS_matrices/BB.txt');
shapeB = B(1,:);
B = reshape(B(2:end,1), shapeB(1), shapeB(2));

C = textread('../STAS_matrices/CC.txt');
shapeC = C(1,:);
C = reshape(C(2:end,1), shapeC(1), shapeC(2));

N = textread('../STAS_matrices/NN.txt');
shapeN = N(1,:);
N = reshape(N(2:end,1), shapeN(1), shapeN(2));

%B = textread('../STAS_matrices/BB.txt');
%C = textread('../STAS_matrices/CC.txt');
%N  = textread('../STAS_matrices/NN.txt');

%fid_A = fopen('../STAS_matrices/AA.txt', 'r');

%formatSpec = '%

%A = fscan

