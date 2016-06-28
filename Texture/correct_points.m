function [ x, y ] = correct_points(x, y, im, spot, oldX, oldY, local)
	[h, w, d] = size(im);
	color = im(y, x, :);

	if color(1) >= 25 || color(2) >= 25 || color(3) >= 25
		if (x > 1) && (x < w) && (y > 1) && (y < h)
			return;
		end
	end
	disp(spot)
	disp(local)
	if strcmp(spot, 'd') || strcmp(spot, 'u')
		if strcmp(local, 'br') || strcmp(local, 'tr')
			if (oldX - 3) > 0
				[x, y] = fix_points((oldX - 3), oldY, (oldX - 4), oldY);
			end
		else %bl or tl
			if (oldX + 3) < w
				[x, y] = fix_points((oldX + 3), oldY, (oldX + 4), oldY);
			end
		end
	else % l or r
		if strcmp(local, 'br') || strcmp(local, 'bl')
			if (oldY - 3) > 0
				[x, y] = fix_points(oldX, (oldY - 3), oldX, (oldY - 4));
			end
		else %tl or tr
			if (oldY + 3) < h
				[x, y] = fix_points(oldX, (oldY + 3), oldX, (oldY + 4));
			end
		end
	end

	function [ x, y ] = fix_points(cordX, cordY, cordX1, cordY1)
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

