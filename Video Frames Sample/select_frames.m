dirM = 'Male/';
dirF = 'Female/';

curDir = dirM;
videosList = dir(strcat(curDir, '*.avi'));
framesDir = strcat(curDir, 'Frames/');

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

for j = 1 : length(videosList)	
    v = VideoReader(videosList(j).name);
	frames = 0;
    disp(j)
    nName = strsplit(videosList(j).name, '_clean');
    for i = 1 : v.NumberOfFrames
        if(frames == 10)
			break;
        end
	    im = read(v, i);
	    
	    boxes = detect_fast(im, model, min(model.thresh, -1));

	    boxes = nms(boxes, .1); 
        if(size(boxes) ~= 0)
            imagesc(im);
            axis image;
            axis off;
			showboxes(im, boxes(1, :), colorset);
			str = input('Wanna save it?', 's');
            if (strcmp(str, 'y'))
				frames = frames + 1;
				imName = strcat(framesDir, cell2mat(nName(1)));
                imName = strcat(imName, strcat('_',int2str(frames)));
				imwrite(im, strcat(imName, '.jpeg'));
            end
        end
    end
end
