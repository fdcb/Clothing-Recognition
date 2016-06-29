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
				index = find(line_points > 25, 1);
				cordX = (x - 1) + index;
			end
		case 'r'
			line_points = im(y, 1 : x);
			if sum(line_points) < 500
				local = locate_points(x, y, im);
				if strcmp(local, 'br') || strcmp(local, 'bl')
					[cordX, cordY] = look_around(x, (y - 1), im, spot);
				else
					[cordX, cordY] = look_around(x, (y + 1), im, spot);
				end
			else
				cordY = y;
				red = im(y, 1 : x, 1);
				green = im(y, 1 : x, 2);
				blue = im(y, 1 : x, 3);
				line_points = red + green + blue;
				line_points = fliplr(line_points);
				index = find(line_points > 25, 1);
				cordX = x - index;
			end
		case 'd'
			line_points = im(1 : y, x);
			if sum(line_points) < 500
				local = locate_points(x, y, im);
				if strcmp(local, 'br') || strcmp(local, 'tr')
					[cordX, cordY] = look_around((x - 1), y, im, spot);
				else
					[cordX, cordY] = look_around((x + 1), y, im, spot);
				end
			else
				cordX = x;
				red = im(1 : y, x, 1);
				green = im(1 : y, x, 2);
				blue = im(1 : y, x, 3);
				line_points = red + green + blue;
				line_points = fliplr(line_points);
				index = find(line_points > 25, 1);
				cordY = y - index;
			end
		case 'u'
			line_points = im(y : end, x);
			if sum(line_points) < 500
				local = locate_points(x, y, im);
				if strcmp(local, 'br') || strcmp(local, 'tr')
					[cordX, cordY] = look_around((x - 1), y, im, spot);
				else
					[cordX, cordY] = look_around((x + 1), y, im, spot);
				end
			else
				cordX = x;
				index = find(line_points > 25, 1);
				cordY = (y - 1) + index;
			end
	end
end
