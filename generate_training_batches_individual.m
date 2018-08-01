%clear all
close all
%Generate training data

Omegas = [4,2,3,4,5,6];

X_train_total = [];
UL_total = [];
Y_train_total =[];
f_constant = 0.0001;
counter_h = 1;
deltat= 0.01;  
tf = 300;
k= tf/deltat;
N = 5;

rng(101);
n_nodes = 5;

OMEGA = 4;

%% Generate load vector in time
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


%% Compute response for every individual node excitement

Responses = zeros(k+1, n_nodes, n_nodes);

for i=1:n_nodes
    
   node = i

   Nonlinear_Cantilever_Vibration_varying_input_individual;
   
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
   
   file_D = '../training_batches/indv_D' + string(node) + '.csv'; 
   file_F = '../training_batches/indv_F' + string(node) + '.csv';
   file_Dt = '../training_batches/indv_Dt' + string(node) + '.csv';
   
   csvwrite(file_D, D);
   csvwrite(file_F, F);
   csvwrite(file_Dt, Dt);
   
   Responses(:,:,node) = D;
   
   
end

%Export to csv

%x_filename = 'x_train.csv';
%y_filename = 'y_train.csv';

%csvwrite(x_filename,X_train_total)
%csvwrite(y_filename,Y_train_total)


