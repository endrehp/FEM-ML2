%Import training data

n = 1;

D = []; 
title = 'mass_production_white_noise_component_test';

for i=0:17

file_D = '../training_batches/'+ string(title) +'D' + string(i) + '.csv'; 
%file_F = '../training_batches/'+ string(title) +'F' + string(n) + '.csv';
%file_Dt = '../training_batches/'+ string(title) +'Dt' + string(n) + '.csv';

D = [D; csvread(file_D)];
%ft = csvread(file_F);
%Dt = csvread(file_Dt);
end

