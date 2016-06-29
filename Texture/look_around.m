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
				index = find(line_points > 25, 1);
				cordX = index;
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
				index = find(line_points > 25, 1);
				cordY = index;
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
