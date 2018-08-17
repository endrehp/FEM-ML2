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
deltat= 0.01;  
tf = 360;
k= tf/deltat;
N = 10;

rng(101);

%%

ef1 = 6.02;
ef2 = 37.75;
ef3 = 105.72;
ef4 = 207.24;
ef5 = 342.85;





%%

for i=1:10

    %tf = 1 + randi([1,3]);
    
   %OMEGA = Omegas(counter_h);
   
%     x_rs = linspace(0, tf, k);
% 
%     rs = zeros(length(x_rs),1);
%     rn = rand();
%     for i=1:length(x_rs)
% 
%         if mod(i,100) == 0
%             rn = rand();
%         end
% 
%         %rs(i) = sin(rn*x_rs(i))^2 + 2*cos(4*2*pi*x_rs(i)+rn) - sin(17/360*x_rs(i))^(3) - rn*sin(0.1*x_rs(i)) + 3*cos((10 + 8*rn)*x_rs(i)); 
%         %rs(i) = sin(rn*x_rs(i))^2 + 2*cos(4*2*pi*x_rs(i)+rn) - sin(17/360*x_rs(i))^(3) - rn*sin(0.1*x_rs(i));
%         rs(i) = sin(6.02*x_rs(i));
%         
%     end
%     
components = 20;
freq_band1 = linspace(0.1*ef1,0.7*ef1,components);
freq_band2 = linspace(1.5*ef1,0.8*ef2,components);
freq_band3 = linspace(1.2*ef2, 1.5*ef2, components/2);
freq_band = [freq_band1, freq_band2, freq_band3];
%F = zeros(k, n_dofs-2);
%triangle = linspace(0,1,n_nodes-1);



%% Generate load series

ft = zeros(1,k);
amp = 1;
t = linspace(0,tf,k);
for i=1:2.5*components-1
    
    if mod(i, components) ~= 0 
        
        f0 = freq_band(i);
        f1 = freq_band(i+1);
        rf = f0 + rand()*(f1 - f0);%random frequency between f0 and f1
        
        ft = ft + amp*sin(rf*t + pi*(2*rand() - 1));
    end
    
end

    
   rs = ft;
   
   tic()
   Nonlinear_Cantilever_Vibration_varying_input
   time = toc()
   
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
   
   file_D = '../training_batches/white_noise_NL_D' + string(counter_h) + '.csv'; 
   file_F = '../training_batches/white_noise_NL_F' + string(counter_h) + '.csv';
   file_Dt = '../training_batches/white_noise_NL_Dt' + string(counter_h) + '.csv';
   
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


