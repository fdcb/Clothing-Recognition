function [ cordX, cordY ] = look_around(x, y, im, spot)
	cordX = x;
	cordY = y;
	[h, w, d] = size(im);

	if x > w || x < 1 || y > h || y < 1
		cordX = x;
		cordY = y;
        return;
    end

    if check_color(x,y);
		return;
	end

	if check_color(x, (y + 1))
		return;
	end
	if check_color((x + 1), (y + 1))
		return;
	end
	if check_color((x + 1), (y - 1))
		return;
	end
	if check_color((x - 1), (y - 1))
		return;
	end
	if check_color((x - 1), (y + 1))
		return;
	end
	if check_color(x, (y - 1))
		return;
	end
	if check_color((x - 1), y)
		return;
	end
	if check_color((x + 1), y)
		return;
	end

			%disp(spot)
	switch spot
		case 'l'
			plot((x+3), y, 'md');
			if (x + 3) < w
				[cordX, cordY] = look_around((x + 3), y, im, spot);
			end
		case 'r'
			plot((x-3), y, 'md');
			if (x - 3) > 0
				[cordX, cordY] = look_around((x - 3), y, im, spot);
			end
		case 'u'
			plot(x, (y + 3), 'md');
			if (y + 3) < h
				[cordX, cordY] = look_around(x, (y + 3), im, spot);
			end
		case 'd'
			plot(x, (y - 3), 'md');
			if (y - 3) > 0
				[cordX, cordY] = look_around(x, (y - 3), im, spot);
			end
	end

	function b = check_color(curX, curY)
		if curX > w || curX < 1 || curY > h || curY < 1
			b = false;
			return;
		end
		color = im(curY, curX, :);
		if color(1) >= 25 || color(2) >= 25 || color(3) >= 25
			b = true;
			cordX = curX;
			cordY = curY;
			return;
		end
		b = false;
	end
end
