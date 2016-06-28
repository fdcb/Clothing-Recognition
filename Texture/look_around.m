function [ cordX, cordY ] = look_around(x, y, im, spot)
	cordX = x;
	cordY = y;
	[h, w, d] = size(im);

	if ((x - 1) <= 1) || ((x + 1) >= w) || ((y - 1) <= 1) || ((y + 1) >= h)
		return;
	end

	check_color(x, y);
	check_color(x, (y + 1));
	check_color((x + 1), (y + 1));
	check_color((x + 1), (y - 1));
	check_color((x - 1), (y - 1));
	check_color((x - 1), (y + 1));
	check_color(x, (y - 1));
	check_color((x - 1), y);
	check_color((x + 1), y);

	switch spot
		case 'l'
			if (x + 2) < w
				[cordX, cordY] = look_around((x + 2), y, im, spot);
			end
		case 'r'
			if (x - 2) > 0
				[cordX, cordY] = look_around((x - 2), y, im, spot);
			end
		case 'u'
			if (y + 2) < h
				[cordX, cordY] = look_around(x, (y + 2), im, spot);
			end
		case 'd'
			if (y - 2) > 0
				[cordX, cordY] = look_around(x, (y - 2), im, spot);
			end
	end

	function check_color(curX, curY)
		color = im(curY, curX, :);
		if color(1) >= 15 || color(2) >= 15 || color(3) >= 15
			return;
		end
	end
end
