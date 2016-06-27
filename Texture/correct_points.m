function [ x, y ] = correct_points(x, y, im, spot, oldX, oldY, local)
	[h, w, d] = size(im);
	color = im(y, x, :);

	if color(1) >= 15 || color(2) >= 15 || color(3) >= 15
		if (x > 1) && (x < w) && (y > 1) && (y < h)
			return;
		end
	end

	if strcmp(spot, 'd') || strcmp(spot, 'u')
		if strcmp(local, 'br') || strcmp(local, 'tr')
			[x, y] = fix_points((oldX - 3), oldY, (oldX - 4), oldY);
		else %bl or tl
			[x, y] = fix_points((oldX + 3), oldY, (oldX + 4), oldY);
		end
	else % l or r
		if strcmp(local, 'br') || strcmp(local, 'bl')
			[x, y] = fix_points(oldX, (oldY - 3), oldX, (oldY - 4));
		else %tl or tr
			[x, y] = fix_points(oldX, (oldY + 3), oldX, (oldY + 4));
		end
	end

	function [ x, y ] = fix_points(cordX, cordY, cordX1, cordY1)
		if cordX > w || cordX < 0 || cordY > h || cordY < 0
			return;
		end
		color = im(cordY, cordX, :);
		if color(1) >= 15 || color(2) >= 15 || color(3) >= 15
			x = cordX;
			y = cordY;
			% [x , y] = correct_points(cordX1, cordY1, im, spot, ...
			% 		oldX, oldY, local);
			return;
		end
		[x, y] = look_around(cordX, cordY, im, spot);
		if x == oldX && y == oldY
			return;
		end
		[x, y] = correct_points(x, y, im, spot, cordX, cordY, local);
	end
end

