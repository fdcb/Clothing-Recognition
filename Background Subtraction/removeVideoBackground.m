function [ ] = removeVideoBackground( bwVideoName, oVideoName, newVideoName )
%REMOVEVIDEOBACKGROUND removes the background from a video. It requires the
%name of video we intend to remove the background from and the name of the video
%with the information of the background and creates a new video with the name 
%NEWVIDEONAME. 
%
%   newVideo = REMOVEVIDEOBACKGROUND(BWVIDEO, ORIGINALVIDEO, NEWVIDEONAME) 
%   removes the background from the ORIGINALVIDEO creating a new video.

bwVideo = VideoReader(bwVideoName);
oVideo = VideoReader(oVideoName);

bwVideoFR = bwVideo.NumberOfFrames;
oVideoFR = oVideo.NumberOfFrames;

newVideo = VideoWriter(newVideoName);
open(newVideo);

if(bwVideoFR > oVideoFR)
    nFrames = oVideoFR;
else
    nFrames = bwVideoFR;

for i =  1 : nFrames
    newImage = removeBackground(read(bwVideo,i), read(oVideo,i));
    writeVideo(newVideo,newImage);
end    

close(newVideo);

end

