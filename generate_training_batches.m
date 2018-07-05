%clear all
close all
%Generate training data

Omegas = [1,2,3,4,5,6];

X_train_total = [];
UL_total = [];
Y_train_total =[];
%OMEGA = 6;
f_constant = 0.0001;
counter_h = 1;
for i=1:6

    %tf = 1 + randi([1,3]);
    tf = 10;
    
   OMEGA = Omegas(counter_h);
   
   Nonlinear_Cantilever_Vibration_varying_input
   
   FM = FNLin';
   DM = UNL';
   DtM = dUNL';
   
   dim = size(DM);
   
   F = FM(1:2:end,1:2:end);
   D = DM(1:2:end,3:2:end);
   Dt = DtM(1:2:end,3:2:end);
    
   %f_constant = 0.0001*(-1+2*rand());
   %OMEGA = 20*rand();
   
   file_D = 'C:/Users/endrep/Documents/training_batches/D' + string(counter_h) + '.csv'; 
   file_F = 'C:/Users/endrep/Documents/training_batches/F' + string(counter_h) + '.csv';
   file_Dt = 'C:/Users/endrep/Documents/training_batches/Dt' + string(counter_h) + '.csv';
   csvwrite(file_D, D);
   csvwrite(file_F, F);
   csvwrite(file_Dt, Dt);
   
   counter_h
   counter_h = counter_h + 1;
   
   
end

%Export to csv

%x_filename = 'x_train.csv';
%y_filename = 'y_train.csv';

%csvwrite(x_filename,X_train_total)
%csvwrite(y_filename,Y_train_total)


