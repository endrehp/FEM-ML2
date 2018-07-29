% Draw y

close all


for i=1:20:length(y(:,1))
    
    cla
    clf
   
    %ul = ULin(1:2:end, i);
    %yn = y(i,4:7:end);
    yn = y(i,:);
    %dunl = dUNL(1:2:end,i)*0.1;
    
    %f = FNLin(1:2:end, i)*0.1;
    
    hold on
    %plot(ul, 'o')
    plot(yn)
    %plot(dunl)
    %plot(f)
    %plot((unl-ul).^2)
    %disp(max((unl-ul).^2))
    axis([0 500 -100 100])
    
    drawnow
    %pause(0.1)
    

end