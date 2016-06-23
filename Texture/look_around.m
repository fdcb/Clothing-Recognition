function [ cordX, cordY ] = look_around(x, y, im, spot)
	cordX = x;
	cordY = y;
	color = im((y + 1), x, :);

	if color(1) ~= 0 || color(2) ~= 0 || color(3) ~= 0
		return;
	end

	color = im((y + 1), (x + 1), :);
	if color(1) ~= 0 || color(2) ~= 0 || color(3) ~= 0
		return;
	end

	color = im((y - 1), (x + 1), :);
	if color(1) ~= 0 || color(2) ~= 0 || color(3) ~= 0
		return;
	end

	color = im((y - 1), (x - 1), :);
	if color(1) ~= 0 || color(2) ~= 0 || color(3) ~= 0
		return;
	end

	color = im((y + 1), (x - 1), :);
	if color(1) ~= 0 || color(2) ~= 0 || color(3) ~= 0
		return;
	end

	color = im((y - 1), x, :);
	if color(1) ~= 0 || color(2) ~= 0 || color(3) ~= 0
		return;
	end

	color = im(y, (x - 1), :);
	if color(1) ~= 0 || color(2) ~= 0 || color(3) ~= 0
		return;
	end

	color = im(y, (x + 1), :);
	if color(1) ~= 0 || color(2) ~= 0 || color(3) ~= 0
		return;
	end

	switch spot
		case 'l'
			color = im((y + 2), x, :);
			if color(1) ~= 0 || color(2) ~= 0 || color(3) ~= 0
				return;
			end
			[cordX, cordY] = look_around(x, (y + 2), im, spot);
		case 'r'
			color = im((y - 2), x, :);
			if color(1) ~= 0 || color(2) ~= 0 || color(3) ~= 0
				return;
			end
			[cordX, cordY] = look_around(x, (y - 2), im, spot);
		case 'u'
			color = im(y, (x + 2), :);
			if color(1) ~= 0 || color(2) ~= 0 || color(3) ~= 0
				return;
			end
			[cordX, cordY] = look_around((x + 2), y, im, spot);
		case 'd'
			color = im(y, (x - 2), :);
			if color(1) ~= 0 || color(2) ~= 0 || color(3) ~= 0
				return;
			end
			[cordX, cordY] = look_around((x - 2), y, im, spot);
	end
end
