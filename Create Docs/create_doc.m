dirM = 'Male/';
dirF = 'Female/';


curDir = dirM;
videosList = dir(strcat(curDir,'*.avi'));
filesDir = strcat(curDir, 'Files/');

for j = 1 : length(videosList)
    disp(j)
	v = VideoReader(videosList(j).name);
	nName = strsplit(videosList(j).name, '_clean');
	fName = strcat(filesDir, cell2mat(nName(1)));

    im = read(v, v.NumberOfFrames/2);
	imagesc(im);
    axis image;
    axis off;
    str = input('u like it?', 's');

    while(strcmp(str,'n'))
        i = randi([1 v.NumberOfFrames],1,1);
        im = read(v, i);
        imagesc(im);
        axis image;
        axis off;
        str = input('u like it?', 's');
    end

	f = fopen(strcat(fName,'.txt'), 'w');
    str = input('enter el code pweasee?\n', 's');
	while (~strcmp(str, 'q'))
		fprintf(f, '%s,', str);
        str = input('any moree???? :3\n', 's');
	end
	fclose(f);
end
