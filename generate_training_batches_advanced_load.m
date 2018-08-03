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
tf = 500;
k= tf/deltat;
N = 12;

rng(101);

%%

ef1 = 6.02;
ef2 = 37.75;
ef3 = 105.72;
ef4 = 207.24;
ef5 = 342.85;





%%

for i=1:1

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
    
freq_band1 = linspace(0.1*ef1,1.2*ef4,10);
freq_band2 = linspace(0.9*ef2,1.2*ef4,10);
freq_band = [freq_band1, freq_band2];
%F = zeros(k, n_dofs-2);
%triangle = linspace(0,1,n_nodes-1);
rf = zeros(length(freq_band),1);
amp = 1;

for i=1:(length(freq_band)-1)

        f0 = freq_band(i);
        f1 = freq_band(i+1);
        rf(i) = f0 + rand()*(f1 - f0);%random frequency between f0 and f1
    
end


%% Generate load series


t = linspace(0,tf,k);
k_counter = 1;
period = 1;
ft = zeros(1,k);
while period
    
    p_length = randi([300,400]);
    
    if k_counter + p_length >= k
        period = 0;
        p_length = k-k_counter;
    end
    
    n_freqs = randi([2,10]);
    f_selections = randi([1,length(freq_band)],1,n_freqs);
    weights = rand(1,n_freqs);
    
    for j=1:n_freqs
        ft(k_counter:k_counter+p_length) = ft(k_counter:k_counter+p_length) + weights(j)*sin(rf(f_selections(j))*t(k_counter:k_counter+p_length) + rand()*pi);
    end
    
    k_counter = k_counter + p_length;
    

end
    
   rs = ft;
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
   
   file_D = '../training_batches/massD' + string(counter_h) + '.csv'; 
   file_F = '../training_batches/massF' + string(counter_h) + '.csv';
   file_Dt = '../training_batches/massDt' + string(counter_h) + '.csv';
   
   %csvwrite(file_D, D);
   %csvwrite(file_F, F);
   %csvwrite(file_Dt, Dt);
   
   counter_h
   counter_h = counter_h + 1;
   
   
end

%Export to csv

%x_filename = 'x_train.csv';
%y_filename = 'y_train.csv';

%csvwrite(x_filename,X_train_total)
%csvwrite(y_filename,Y_train_total)


