function [ cordX, cordY ] = look_around(x, y, im, spot)
	cordX = x;
	cordY = y;

	color = im((x + 1), y, :);
disp(x+1)
	if color(1) ~= 0 || color(2) ~= 0 || color(3) ~= 0
		return;
	end

	color = im((x + 1), (y + 1), :);
	disp(x+1)
	disp(y+1)
	if color(1) ~= 0 || color(2) ~= 0 || color(3) ~= 0
		return;
	end

	color = im((x - 1), (y + 1), :);
	if color(1) ~= 0 || color(2) ~= 0 || color(3) ~= 0
		return;
	end

	color = im((x - 1), (y - 1), :);
	if color(1) ~= 0 || color(2) ~= 0 || color(3) ~= 0
		return;
	end

	color = im((x + 1), (y - 1), :);
	if color(1) ~= 0 || color(2) ~= 0 || color(3) ~= 0
		return;
	end

	color = im((x - 1), y, :);
	if color(1) ~= 0 || color(2) ~= 0 || color(3) ~= 0
		return;
	end

	color = im(x, (y - 1), :);
	if color(1) ~= 0 || color(2) ~= 0 || color(3) ~= 0
		return;
	end

	color = im(x, (y + 1), :);
	if color(1) ~= 0 || color(2) ~= 0 || color(3) ~= 0
		return;
	end

	switch spot
		case 'l'
			color = im((x + 2), y, :);
			if color(1) ~= 0 || color(2) ~= 0 || color(3) ~= 0
				return;
			end
			[cordX, cordY] = look_around((x + 2), y, im, spot);
		case 'r'
			color = im((x - 2), y, :);
			if color(1) ~= 0 || color(2) ~= 0 || color(3) ~= 0
				return;
			end
			[cordX, cordY] = look_around((x - 2), y, im, spot);
		case 'u'
			color = im(x, (y - 2), :);
			if color(1) ~= 0 || color(2) ~= 0 || color(3) ~= 0
				return;
			end
			[cordX, cordY] = look_around(x, (y - 2), im, spot);
		case 'd'
			color = im(x, (y + 2), :);
			if color(1) ~= 0 || color(2) ~= 0 || color(3) ~= 0
				return;
			end
			[cordX, cordY] = look_around(x, (y + 2), im, spot);
	end
end
