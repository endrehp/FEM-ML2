close all

% Save and export animation

a = max(max(preds))*4/3;

for i=1:length(preds(:,1))
    
    cla
    clf

    p_i = preds(i, :); %independent predictions
    y_t = y_test(i,:); %test data

    
    
    hold on
    
    plot(p_i, '-o', 'DisplayName', 'predicted')
    plot(y_t, 'DisplayName', 'actual')
    axis([1 11 -a a])
    legend('show', 'Location', 'northwest')
 
    
    Frames(i) = getframe;
    
    

end

%% Write video

myVideo = VideoWriter('myfile.avi');
%myVideo.FrameRate = 15;  % Default 30
%myVideo.Quality = 50;
open(myVideo);
%for i=1:length(Frames)
writeVideo(myVideo, Frames);
%end
close(myVideo);

%Convert to wmv at: https://www.online-convert.com