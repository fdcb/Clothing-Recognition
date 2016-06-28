function [ x, y ] = correct_points(x, y, im, spot, oldX, oldY, local)
	[h, w, d] = size(im);
	if (x > 1) && (x < w) && (y > 1) && (y < h)
		color = im(y, x, :);
		if color(1) >= 25 || color(2) >= 25 || color(3) >= 25
			return;
		end
	end

	if strcmp(spot, 'd') || strcmp(spot, 'u')
		if strcmp(local, 'br') || strcmp(local, 'tr')
			[x, y] = fix_points((oldX - 3), oldY);
		else %bl or tl
			[x, y] = fix_points((oldX + 3), oldY);
		end
	else % l or r
		if strcmp(local, 'br') || strcmp(local, 'bl')
			[x, y] = fix_points(oldX, (oldY - 3));
		else %tl or tr
			[x, y] = fix_points(oldX, (oldY + 3));
		end
	end

	function [ x, y ] = fix_points(cordX, cordY)
		if (cordX > w) || (cordX < 0) || (cordY > h) || (cordY < 0)
			x = cordX;
			y = cordY;
			return;
		end

		color = im(cordY, cordX, :);

		if color(1) >= 25 || color(2) >= 25 || color(3) >= 25
			x = cordX;
			y = cordY;
			return;
		end
		[x, y] = look_around(cordX, cordY, im, spot);
		if x == oldX && y == oldY
			return;
		end
		[x, y] = correct_points(x, y, im, spot, cordX, cordY, local);
	end
end

