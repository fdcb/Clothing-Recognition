function [ cordX, cordY ] = look_around(x, y, im, spot)
	cordX = x;
	cordY = y;
disp(1)	
	color = im(y, x, :);
	if color(1) ~= 0 || color(2) ~= 0 || color(3) ~= 0
disp(2)	
		return;
	end
	
	color = im((y + 1), x, :);
	if color(1) ~= 0 || color(2) ~= 0 || color(3) ~= 0
disp(3)	
		return;
	end

	color = im((y + 1), (x + 1), :);
	if color(1) ~= 0 || color(2) ~= 0 || color(3) ~= 0
disp(4)	
		return;
	end

	color = im((y - 1), (x + 1), :);
	if color(1) ~= 0 || color(2) ~= 0 || color(3) ~= 0
disp(5)	
		return;
	end

	color = im((y - 1), (x - 1), :);
	if color(1) ~= 0 || color(2) ~= 0 || color(3) ~= 0
		disp(color)
disp(6)	
		return;
	end

	color = im((y + 1), (x - 1), :);
	if color(1) ~= 0 || color(2) ~= 0 || color(3) ~= 0
disp(7)	
		return;
	end

	color = im((y - 1), x, :);
	if color(1) ~= 0 || color(2) ~= 0 || color(3) ~= 0
disp(8)	
		return;
	end

	color = im(y, (x - 1), :);
	if color(1) ~= 0 || color(2) ~= 0 || color(3) ~= 0
disp(9)	
		return;
	end

	color = im(y, (x + 1), :);
	if color(1) ~= 0 || color(2) ~= 0 || color(3) ~= 0
disp(q)	
		return;
	end

	switch spot
		case 'l'
			if color(1) ~= 0 || color(2) ~= 0 || color(3) ~= 0
				cordX = (x + 2);
				cordY = y;
disp(w)	
				return;
			end
			[cordX, cordY] = look_around((x + 2), y, im, spot);
		case 'r'
			if color(1) ~= 0 || color(2) ~= 0 || color(3) ~= 0
				cordX = (x - 2);
				cordY = y;
disp(e)	
				return;
			end
			[cordX, cordY] = look_around((x - 2), y, im, spot);
		case 'u'
			if color(1) ~= 0 || color(2) ~= 0 || color(3) ~= 0
				cordX = x;
				cordY = (y + 2);
disp(r)	
				return;
			end
			[cordX, cordY] = look_around(x, (y + 2), im, spot);
		case 'd'
			if color(1) ~= 0 || color(2) ~= 0 || color(3) ~= 0
				cordX = x;
				cordY = (y - 2);
disp(t)	
				return;
			end
			[cordX, cordY] = look_around(x, (y - 2), im, spot);
	end
end
