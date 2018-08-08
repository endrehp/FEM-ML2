%Export training data

counter_h = 0;

%title = 'lin_white_noise2_dt01';
title = 'unseen1';

file_D = '../training_batches/'+ string(title) +'D' + string(counter_h) + '.csv'; 
file_F = '../training_batches/'+ string(title) +'F' + string(counter_h) + '.csv';
file_Dt = '../training_batches/'+ string(title) +'Dt' + string(counter_h) + '.csv';

csvwrite(file_D, D);
csvwrite(file_F, ft');
csvwrite(file_Dt, Dt);
