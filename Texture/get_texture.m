dirM = 'Frames_Male/';
dirF = 'Frames_Female/';

bodyParts = {'y', 'r', 'm', 'c', 'b'};

% cd('mpeg7fex_win32_v2');
% rmdir('RightArm/', 's');
% rmdir('LeftArm/', 's');
% rmdir('RightLeg/', 's');
% rmdir('LeftLeg/', 's');
% rmdir('Body/', 's');
% cd('..');

mkdir('mpeg7fex_win32_v2/RightArm/Texture');
mkdir('mpeg7fex_win32_v2/LeftArm/Texture');
mkdir('mpeg7fex_win32_v2/RightLeg/Texture');
mkdir('mpeg7fex_win32_v2/LeftLeg/Texture');
mkdir('mpeg7fex_win32_v2/Body/Texture');

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
	colorset = {'g', 'g', 'y', 'm', 'm', 'm', 'm', 'y', 'y', 'y', 'r', 'r', ...
			'r', 'r', 'y', 'c', 'c', 'c', 'c', 'y', 'y', 'y', 'b', 'b', 'b', ...
			'b'};

numparts = length(colorset);

for i = 1 : length(imageList)
	for j = 1 : length(bodyParts)
        im = imread(strcat(curDir, imageList(i).name));
		boxes = detect_fast(im, model, min(model.thresh, -1));
		boxes = nms(boxes, .1);
		if size(boxes) ~= 0
			imagesc(im);
			axis image;
			axis off;
			[k, x, y] = showboxes(im, boxes(1, :), colorset, bodyParts{j});

			[axisx, axisy, z] = size(im);
			mask = poly2mask(x(k), y(k), axisx, axisy);

			mask = ~(mask == 1);
			red = im(:, :, 1);
			green = im(:, :, 2);
			blue = im(:, :, 3);
			red(mask) = 0;
			green(mask) = 0;
			blue(mask) = 0;

			% red = red(mask);
			% green = green(mask);
			% blue = blue(mask);
			cd('mpeg7fex_win32_v2');

			switch bodyParts{j}
				case 'y'
					cd('Body/Texture');
				case 'm'
					cd('RightArm/Texture');
				case 'r'
					cd('RightLeg/Texture');
				case 'b'
					cd('LeftLeg/Texture');
				case 'c'
					cd('LeftArm/Texture');
			end

			points = find_outermostPoints(x, y);

			for i = 1 : length(points)
				spot = char(points(i, 3));
				switch spot
					case 'l'
						lx = round(cell2float(points(i, 1)));
					case 'r'
						rx = round(cell2float(points(i, 1)));
					case 'd'
						dy = round(cell2float(points(i, 2)));
					case 'u'
						uy = round(cell2float(points(i, 2)));
				end
			end
			h = dy - uy;
			w = rx - lx;
			newimage = cat(3, red, green, blue);
			newimage = imcrop(newimage, [lx uy w h]);
			newimage = imresize(newimage, [128 128]);

			imwrite(newimage, imageList(i).name);

			f = fopen('temp.txt', 'a');
			fprintf(f, '%s\n', imageList(i).name);
			fclose(f);

			cd('../../..');
		end
	end
end

cd('mpeg7fex_win32_v2');
for i = 1 : length(bodyParts)
	switch bodyParts{i}
		case 'y'
			cd('Body/Texture');
		case 'm'
			cd('RightArm/Texture');
		case 'r'
			cd('RightLeg/Texture');
		case 'b'
			cd('LeftLeg/Texture');
		case 'c'
			cd('LeftArm/Texture');
	end

	system('MPEG7Fex.exe HTD 1 temp.txt texture.txt');
	% system('MPEG7Fex.exe DCD 0 0 0 temp.txt color.txt');
	cd('../..');
end
