close all

x = linspace(0,1, length(preds(1,:)));
%d_max = max(max(UNL_total));
a = max(max(preds))*3/2;

%if 1dof
%y_rats = [0.0114    0.0438    0.0949    0.1621    0.2430    0.3351    0.4361    0.5434    0.6551    0.7693    0.8845    1.0000];

%D = csvread('../training_batches/massD2.csv');


for i=1:length(preds(:,1))
    
    cla
    clf
   
    %p_d = predictions(i, :); %dependent predictions
    p_i = preds(i, :); %independent predictions
    y_t = y_test(i,:); %test data
    %y_tr = y_train(i,:);
    %ul = UL_total(1:2:end, end-length(preds(:,1))+i)/d_max; %linear solution
    
    
    hold on
    %plot(x, p_d, '-o', 'DisplayName', 'dependent')
    plot(p_i, '-o', 'DisplayName', 'independent')
    plot(y_t, 'DisplayName', 'test')
    %plot(x, y_tr, 'DisplayName', 'test')
    %plot(x, ul, '-x')
    %plot((unl-ul).^2)
    %disp(max((unl-ul).^2))
    axis([1 11 -a a])
    %legend('show')
    drawnow
    %pause(0.1)
    

end