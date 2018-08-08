close all

a = max(max(D))*3/2;
for i=1:length(D(:,1))
    
    cla
    clf
   
    %ul = ULin(1:2:end, i);
    unl = D(i, :);
    %dunl = dUNL(1:2:end,i)*0.1;
    
    %f = FNLin(1:2:end, i)*0.1;
    
    hold on
    %plot(ul, 'o')
    plot(unl)
    %plot(dunl)
    %plot(f)
    %plot((unl-ul).^2)
    %disp(max((unl-ul).^2))
    axis([0 11 -a a])
    
    drawnow
    %pause(0.1)
    

end