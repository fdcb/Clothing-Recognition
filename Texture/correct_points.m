function [ x, y ] = correct_points(x, y, im, spot, oldX, oldY)
	[h, w, d] = size(im);
	color = im(y, x, :);

	if color(1) >= 15 || color(2) >= 15 || color(3) >= 15
		if (x > 1) && (x < w) && (y > 1) && (y < h)
			return;
		end
	end

	switch spot
		case 'd'
			[x, y] = fix_points((oldX - 3), oldY, (oldX - 4), oldY);
		case 'u'
			[x, y] = fix_points((oldX + 3), oldY, (oldX + 4), oldY);
		case 'l'
			[x, y] = fix_points(oldX, (oldY - 3), oldX, (oldY - 4));
		case 'r'
			[x, y] = fix_points(oldX, (oldY + 3), oldX, (oldY + 4));

			% color = im(oldY, (oldX + 2), :);
			% if color(1) >= 15 || color(2) >= 15 || color(3) >= 15
			% 	[x , y] = correct_points((oldX + 3), oldY, spot, oldX, oldY));
			% 	return;
			% end
			% [x, y] = look_around((oldX + 2), oldY, im, spot);
			% if x == oldX && y == oldY
			% 	return;
			% end
	end

	function [ x, y ] = fix_Points(cordX, cordY, cordX1, cordY1)
		color = im(cordY, cordX, :);
		if color(1) >= 15 || color(2) >= 15 || color(3) >= 15
			[x , y] = correct_points(cordX1, cordY1, im, spot, oldX, oldY);
			return;
		end
		[x, y] = look_around(cordX, cordY, im, spot);
		if x == oldX && y == oldY
			return;
		end
		[x, y] = correct_points(x, y, im, spot, cordX, cordY);
	end

end

