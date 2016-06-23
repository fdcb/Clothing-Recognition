function [ cordX, cordY ] = look_around(x, y, im, spot)
	cordX = x;
	cordY = y;
	color = im((y + 1), x, :);
disp(x)
disp(y)
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
			[cordX, cordY] = look_around((y + 2), x, im, spot);
		case 'r'
			color = im((y - 2), x, :);
			if color(1) ~= 0 || color(2) ~= 0 || color(3) ~= 0
				return;
			end
			[cordX, cordY] = look_around((y - 2), x, im, spot);
		case 'u'
			color = im(y, (x - 2), :);
			if color(1) ~= 0 || color(2) ~= 0 || color(3) ~= 0
				return;
			end
			[cordX, cordY] = look_around(y, (x - 2), im, spot);
		case 'd'
			color = im(y, (x + 2), :);
			if color(1) ~= 0 || color(2) ~= 0 || color(3) ~= 0
				return;
			end
			[cordX, cordY] = look_around(y, (x + 2), im, spot);
	end
end
