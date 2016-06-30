function [ polygon, x, y ] =  showboxes(im, boxes, partcolor, partidentifier)
		imagesc(im); axis image; axis off;
		if ~isempty(boxes)
		numparts = length(partcolor);
		box = boxes(:, 1 : 4 * numparts);

		xy = reshape(box, size(box, 1), 4, numparts);
		xy = permute(xy, [1 3 2]);
		x1 = xy(:, :, 1);
		y1 = xy(:, :, 2);
		x2 = xy(:, :, 3);
		y2 = xy(:, :, 4);

		dots = strcat(partidentifier, '*');
		x = [];
		y = [];

		for p = 1 : numparts
			if strcmp(partidentifier, partcolor{p})
				if strcmp(partidentifier, 'y')
					x = cat(2, x, (x1(:, p) + (x2(:, p) - x1(:, p)) / 2));
					y = cat(2, y, (y1(:, p) + (y2(:, p) - y1(:, p)) / 2));
				else
					dist = (x1(:, p) + (x2(:, p) - x1(:, p)) / 2) / 2;
					x = cat(2, x, (x1(:, p) + dist));
					y = cat(2, y, y1(:, p));
					x = cat(2, x, (x1(:, p) + dist));
					y = cat(2, y, y2(:, p));
					x = cat(2, x, (x2(:, p) - dist));
					y = cat(2, y, y2(:, p));
					x = cat(2, x, (x2(:, p) - dist));
					y = cat(2, y, y1(:, p));

				end
			end
		end

		[h, w, d] = size(im);
        idx = find(x > 0);
        x = x(idx);
        y = y(idx);
        idx = find(y > 0);
        y = y(idx);
        x = x(idx);
        idx = find(x < w);
        x = x(idx);
        y = y(idx);
        idx = find(y < h);
        y = y(idx);
        x = x(idx);

		hold on;
		plot(x , y, 'yo');
		[x, y] = select_points(x, y, im);
		k = convhull(x, y);
		plot(x(k), y(k), 'p-', x, y, dots);
		hold off;

		polygon = k;
	end
	drawnow;
end
