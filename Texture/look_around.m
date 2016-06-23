function [ cordX, cordY ] = look_around(x, y, im, spot)
	cordX = x;
	cordY = y;

	color = im(y, x, :);
	if color(1) >= 6 || color(2) >= 6 || color(3) >= 6
		return;
	end
	
	color = im((y + 1), x, :);
	if color(1) >= 6 || color(2) >= 6 || color(3) >= 6
		return;
	end

	color = im((y + 1), (x + 1), :);
	if color(1) >= 6 || color(2) >= 6 || color(3) >= 6
		return;
	end

	color = im((y - 1), (x + 1), :);
	if color(1) >= 6 || color(2) >= 6 || color(3) >= 6
		return;
	end

	color = im((y - 1), (x - 1), :);
	if color(1) >= 6 || color(2) >= 6 || color(3) >= 6
		return;
	end

	color = im((y + 1), (x - 1), :);
	if color(1) >= 6 || color(2) >= 6 || color(3) >= 6
		return;
	end

	color = im((y - 1), x, :);
	if color(1) >= 6 || color(2) >= 6 || color(3) >= 6
		return;
	end

	color = im(y, (x - 1), :);
	if color(1) >= 6 || color(2) >= 6 || color(3) >= 6
		return;
	end

	color = im(y, (x + 1), :);
	if color(1) >= 6 || color(2) >= 6 || color(3) >= 6
		return;
	end

	switch spot
		case 'l'
			if color(1) >= 6 || color(2) >= 6 || color(3) >= 6
				cordX = (x + 2);
				cordY = y;
				return;
			end
			[cordX, cordY] = look_around((x + 2), y, im, spot);
		case 'r'
			if color(1) >= 6 || color(2) >= 6 || color(3) >= 6
				cordX = (x - 2);
				cordY = y;
				return;
			end
			[cordX, cordY] = look_around((x - 2), y, im, spot);
		case 'u'
			if color(1) >= 6 || color(2) >= 6 || color(3) >= 6
				cordX = x;
				cordY = (y + 2);
				return;
			end
			[cordX, cordY] = look_around(x, (y + 2), im, spot);
		case 'd'
			if color(1) >= 6 || color(2) >= 6 || color(3) >= 6
				cordX = x;
				cordY = (y - 2);
				return;
			end
			[cordX, cordY] = look_around(x, (y - 2), im, spot);
	end
end
