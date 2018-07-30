close all


for i=1:length(total_response(:,1))
    
    cla
    clf
   
    %ul = ULin(1:2:end, i);
    sup = total_response(i, :);
    unl = UNL(3:2:end, i);
    %dunl = dUNL(1:2:end,i)*0.1;
    
    %f = FNLin(1:2:end, i)*0.1;
    
    hold on
    plot(sup, '-o')
    plot(unl)
    %plot(dunl)
    %plot(f)
    %plot((unl-ul).^2)
    %disp(max((unl-ul).^2))
    axis([0 6 -0.0003 0.0003])
    
    drawnow
    %pause(0.1)
    

end