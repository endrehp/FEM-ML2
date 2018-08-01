%clear all
close all
%Generate training data

Omegas = [4,2,3,4,5,6];

X_train_total = [];
UL_total = [];
Y_train_total =[];
OMEGA = 4;
f_constant = 0.0001;
counter_h = 1;
deltat= 0.001;  
tf = 100;
k= tf/deltat;
N = 12;

rng(101);

for i=1:1

    %tf = 1 + randi([1,3]);
    
   %OMEGA = Omegas(counter_h);
   
    x_rs = linspace(0, tf, k);

    rs = zeros(length(x_rs),1);
    rn = rand();
    for i=1:length(x_rs)

        if mod(i,100) == 0
            rn = rand();
        end

        rs(i) = sin(rn*x_rs(i))^2 + 2*cos(4*2*pi*x_rs(i)+rn) - sin(17/360*x_rs(i))^(3) - rn*sin(0.1*x_rs(i)) + 3*cos((10 + 8*rn)*x_rs(i)); 
        %rs(i) = sin(rn*x_rs(i))^2 + 2*cos(4*2*pi*x_rs(i)+rn) - sin(17/360*x_rs(i))^(3) - rn*sin(0.1*x_rs(i));

    end
   
   Nonlinear_Cantilever_Vibration_varying_input
   
   FM = FNLin';
   DM = UNL';
   DtM = dUNL';
   
   dim = size(DM);
   
   F = FM(:,1:2:end);
   D = DM(:,3:2:end);
   Dt = DtM(:,3:2:end);
    
   %f_constant = 0.0001*(-1+2*rand());
   %OMEGA = 20*rand();
   
   %file_D = 'C:/Users/endrep/Documents/training_batches/D' + string(counter_h) + '.csv'; 
   %file_F = 'C:/Users/endrep/Documents/training_batches/F' + string(counter_h) + '.csv';
   %file_Dt = 'C:/Users/endrep/Documents/training_batches/Dt' + string(counter_h) + '.csv';
   
   file_D = '../training_batches/hf12_dt3D' + string(counter_h) + '.csv'; 
   file_F = '../training_batches/hf12_dt3F' + string(counter_h) + '.csv';
   file_Dt = '../training_batches/hf12_dt3Dt' + string(counter_h) + '.csv';
   
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


