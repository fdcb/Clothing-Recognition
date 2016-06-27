function [ cordX, cordY ] = look_around(x, y, im, spot)
	cordX = x;
	cordY = y;
	[h, w, d] = size(im);

	if (cordX <= 1) || (cordX >= w) || (cordY <= 1) || (cordY >= h)
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
			[cordX, cordY] = look_around((x + 2), y, im, spot);
		case 'r'
			[cordX, cordY] = look_around((x - 2), y, im, spot);
		case 'u'
			[cordX, cordY] = look_around(x, (y + 2), im, spot);
		case 'd'
			[cordX, cordY] = look_around(x, (y - 2), im, spot);
	end

	function check_color(curX, curY)
		color = im(curY, curX, :);
		if color(1) >= 15 || color(2) >= 15 || color(3) >= 15
			return;
		end
	end
end
