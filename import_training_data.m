%Import training data

n = 1;

title = 'mass';

file_D = '../training_batches/'+ string(title) +'D' + string(n) + '.csv'; 
file_F = '../training_batches/'+ string(title) +'F' + string(n) + '.csv';
file_Dt = '../training_batches/'+ string(title) +'Dt' + string(n) + '.csv';

D = csvread(file_D);
ft = csvread(file_F);
Dt = csvread(file_Dt);
