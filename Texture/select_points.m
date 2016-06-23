function [ x, y ] = select_points(x, y, im)
	points = find_outermostPoints(x, y);
disp(points)
	for i = 1 : length(points)
		cordX = round(cell2float(points(i, 1)));
		cordY = round(cell2float(points(i, 2)));
		spot = char(points(i, 3));
		index = cell2mat(points(i, 4));
		plot(cordX, cordY, 'c+');
		color = im(cordY, cordX, :);
		if color(1) == 0 && color(2) == 0 && color(3) == 0
			disp(0)
			[newX, newY] = look_around(cordX, cordY, im, spot);
			color = im(newY, newX, :);
		plot(newX, newY, 'm+');
			if newX ~= cordX || newY ~= cordY
				x(index) = newX;
				y(index) = newY;
			end
		end
	end
end
