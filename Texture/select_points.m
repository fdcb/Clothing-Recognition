function [ x, y ] = select_points(x, y, im)
	points = find_outermostPoints(x, y);
disp(points)
disp(length(points))
	for i = 1 : length(points)
		cordX = round(cell2float(points(i, 1)));
		cordY = round(cell2float(points(i, 2)));
		spot = char(points(i, 3));
		index = cell2mat(points(i, 4));
disp(232323)
		color = im(cordY, cordX, :);
		if color(1) == 0 && color(2) == 0 && color(3) == 0
			disp(11111)
			[newX, newY] = look_around(cordX, cordY, im, spot);
			disp(newX)
			disp(newY)
			disp(cordX)
			disp(cordY)
			if newX ~= cordX || newY ~= cordY
				x(index) = cordX;
				y(index) = cordY;
			end
		end
	end
end
