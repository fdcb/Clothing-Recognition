function [ newImage ] = removeBackground(bwImage, originalImage)
%REMOVEBACKGROUND removes the background from a image. It requires the
%image we intend to remove the background from and a image with the
%information of the background.
%
%   newImage = REMOVEBACKGROUND(BWIMAGE, ORIGINALIMAGE) removes the
%   background from the ORIGINALIMAGE.

bwImage = bwImage(:, :, 1);

mask = ~(bwImage > 129);
redValues = originalImage(:, :, 1);
greenValues = originalImage(:, :, 2);
blueValues = originalImage(:, :, 3);

redValues(mask) = 0;
greenValues(mask) = 0;
blueValues(mask) = 0;

newImage = cat(3, redValues, greenValues, blueValues);
end

