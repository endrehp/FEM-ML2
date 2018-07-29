

world = vrworld('beam_animation.wrl', 'new');
open(world);

fig = vrfigure(world);

beam = vrnode(world, 'Beam');
beam2 = vrnode(world, 'Beam2');

x = linspace(0,1, length(predictions(1,:)));

for i=1:4:length(predictions(:,1))
pause(0.1);
%beam.rotation = [0 1 1 -theta];
%beam.translation = [theta/5 0 0];

b = beam.children.geometry.spine;
b2 = beam2.children.geometry.spine;

b(2:end,3) = predictions(i,:)*20;
b2(2:end,3) = y_test(i,:)*20;

beam.children.geometry.spine = b;
beam2.children.geometry.spine = b2;

    cla
    clf
   
    p_d = predictions(i, :); %dependent predictions
    %p_i = preds(i, :); %independent predictions
    y_t = y_test(i,:); %test data
    %y_tr = y_train(i,:);
    %ul = UL_total(1:2:end, end-length(preds(:,1))+i)/d_max; %linear solution
    
    
    hold on
    plot(x, p_d, '-o', 'DisplayName', 'dependent')
    %plot(x, p_i, '-o', 'DisplayName', 'independent')
    plot(x, y_t, 'DisplayName', 'test')
    %plot(x, y_tr, 'DisplayName', 'test')
    %plot(x, ul, '-x')
    %plot((unl-ul).^2)
    %disp(max((unl-ul).^2))
    axis([0 1.2 -0.06 0.06])
    %legend('show')
    drawnow
    %pause(0.1)

end

%pause(1);
%beam.children.geometry.spine(3,2) = 1;