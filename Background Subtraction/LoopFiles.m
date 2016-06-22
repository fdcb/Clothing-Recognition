%LOOPFILES removes the background the videos in a directory.
%
%   REMOVEBACKGROUND(DIRNAME) removes the background from all the videos in a 
%   certain DIRNAME.

%videosList = dir ('Videos/Male/*.avi');

dirM = 'Videos/Male/';
dirF = 'Videos/Female/';

curDir = dirF;
videosList = dir(strcat(curDir,'*.avi'));
cleanDir = strcat(curDir,'Clean/');

for i = 1 : 2 : length(videosList)
    bwName = strcat(curDir, videosList(i).name);
    oName = strcat(curDir, videosList(i + 1).name);
    nName = strsplit(videosList(i + 1).name, 'T');
    newName = strcat(cleanDir, cell2mat(nName(1)));
    removeVideoBackground(bwName,oName, strcat(newName, '_clean'));
end


