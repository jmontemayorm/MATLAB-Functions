numOfScans = 44;
%filePaths = strings(numOfScans,1);
images = cell(numOfScans,1);
for nS = 1:numOfScans
    images{nS} = adapthisteq(imread(sprintf(...
        'PreTest_03/PreTest_03_4_02m_1ms_C001H001S0001/PreTest_03_4_02m_1ms_C001H001S0001%06i.tif',nS)));
end

% create the video writer with 1 fps
 writerObj = VideoWriter('PreTest_03_video.avi');
 writerObj.FrameRate = 3;
 % open the video writer
 open(writerObj);
 % write the frames to the video
 for u=1:length(images)
     % convert the image to a frame
     frame = im2frame(repmat(images{u},1,1,3));
     %for v=1:1 
         writeVideo(writerObj, frame);
     %end
 end
 % close the writer object
 close(writerObj);