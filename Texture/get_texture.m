dirM = 'Frames_Male/';
dirF = 'Frames_Female/';

bodyParts = {'y', 'r', 'm', 'c', 'b'};

cd('mpeg7fex_win32_v2');
rmdir('RightArm/', 's');
rmdir('LeftArm/', 's');
rmdir('RightLeg/', 's');
rmdir('LeftLeg/', 's');
rmdir('Body/', 's');
cd('..');

mkdir('mpeg7fex_win32_v2/RightArm/');
mkdir('mpeg7fex_win32_v2/LeftArm/');
mkdir('mpeg7fex_win32_v2/RightLeg/');
mkdir('mpeg7fex_win32_v2/LeftLeg/');
mkdir('mpeg7fex_win32_v2/Body/');

curDir = dirF;
imageList = dir(strcat(curDir, '*.jpeg'));

addpath visualization;
if isunix()
  addpath mex_unix;
elseif ispc()
  addpath mex_pc;
end

compile;
load('PARSE_model');
	colorset = {'g', 'g', 'y', 'm', 'm', 'm', 'm', 'y', 'y', 'y', 'r', 'r', 'r', ...
		'r', 'y', 'c', 'c', 'c', 'c', 'y', 'y', 'y', 'b', 'b', 'b', 'b'};
numparts = length(colorset);

%for i = 1 : length(imageList)
%	for j = 1 : length(bodyParts)
i = 1;
j =4;
im = imread(strcat(curDir, imageList(i).name));
		boxes = detect_fast(im, model, min(model.thresh, -1));
		boxes = nms(boxes, .1);
		if size(boxes) ~= 0
			imagesc(im);
			axis image;
			axis off;
			[k, x, y] = showboxes(im, boxes(1, :), colorset, bodyParts{j});
			% [k, x, y] = showboxes(im, boxes(1, :), colorset, 'r');

			[axisx, axisy, z] = size(im);
			mask = poly2mask(x(k), y(k), axisx, axisy);
			red = im(:, :, 1);
			green = im(:, :, 2);
			blue = im(:, :, 3);
			red = red(mask);
			green = green(mask);
			blue = blue(mask);

			cd('mpeg7fex_win32_v2');

			switch bodyParts{j}
				case 'y'
					cd('Body');
				case 'm'
					cd('RightArm');
				case 'r'
					cd('RightLeg');
				case 'b'
					cd('LeftLeg');
				case 'c'
					cd('LeftArm');
			end

			newimage = cat(3, red, green, blue);
			imwrite(newimage, imageList(i).name);

			f = fopen('temp.txt', 'a');
			fprintf(f, '%s\n', imageList(i).name);
			fclose(f);

			cd('../..');
		end
%	end
%end

cd('mpeg7fex_win32_v2');
for i = 1 : length(bodyParts)
	switch bodyParts{i}
		case 'y'
			cd('Body');
		case 'm'
			cd('RightArm');
		case 'r'
			cd('RightLeg');
		case 'b'
			cd('LeftLeg');
		case 'c'
			cd('LeftArm');
	end

	system('MPEG7Fex.exe DCD 0 0 0 temp.txt color.txt');
	cd('..');
end
