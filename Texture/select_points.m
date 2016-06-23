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
			[newX, newY] = look_around(cordX, cordY, im, spot);
		plot(cordX, cordY, 'm+');
			if newX ~= cordX || newY ~= cordY
				x(index) = cordX;
				y(index) = cordY;
			end
		end
	end
end
