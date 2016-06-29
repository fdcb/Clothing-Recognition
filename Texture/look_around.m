function [ cordX, cordY ] = look_around(x, y, im, spot)
	[h, w, d] = size(im);
	if x <= 1 || x >= w || y <= 1 || y >= h
		cordX = x;
		cordY = y;
		return;
	end

	switch spot
		case 'l'
			line_points = im(y, x : end);
			if sum(line_points) < 500
				local = locate_points(x, y, im);
				if strcmp(local, 'br') || strcmp(local, 'bl')
					[cordX, cordY] = look_around(x, (y - 1), im, spot);
				else
					[cordX, cordY] = look_around(x, (y + 1), im, spot);
				end
			else
				cordY = y;
				index = find(line_points > 25);
				cordX = (x - 1) + indices(1);
			end
		case 'r'
			if sum(im(y, 1 : x) < 500
				local = locate_points(x, y, im);
				if strcmp(local, 'br') || strcmp(local, 'bl')
					[cordX, cordY] = look_around(x, (y - 1), im, spot);
				else
					[cordX, cordY] = look_around(x, (y + 1), im, spot);
				end
			end
		case 'd'
			if sum(im(0 : y, x)) < 500
				local = locate_points(x, y, im);
				if strcmp(local, 'br') || strcmp(local, 'tr')
					[cordX, cordY] = look_around((x - 1), y, im, spot);
				else
					[cordX, cordY] = look_around((x + 1), y, im, spot);
			end
		case 'u'
			if sum(im(y : end, x)) < 500
				local = locate_points(x, y, im);
				if strcmp(local, 'br') || strcmp(local, 'tr')
					[cordX, cordY] = look_around((x - 1), y, im, spot);
				else
					[cordX, cordY] = look_around((x + 1), y, im, spot);
			end
end
