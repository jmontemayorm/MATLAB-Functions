function video2Frames(fileName)
%UNTITLED2 Summary of this function goes here
%   Detailed explanation goes here

% created on 23.03.2018

% Check if fileName is valid, exists, is video blah blah

mov = VideoReader(fileName);
fr = mov.FrameRate;

for frame = 1:mov.Duration*fr
    imwrite(readFrame(mov),sprintf('frames/frame_%07.3f.png',frame/fr),'png');
end
end

