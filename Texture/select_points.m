function [ x, y ] = select_points(x, y, im)
	points = find_outermostPoints(x, y);
	tempX = x;
	tempY = y;
	for i = 1 : length(points)
		cordX = round(cell2float(points(i, 1)));
		cordY = round(cell2float(points(i, 2)));
		spot = char(points(i, 3));
		index = cell2mat(points(i, 4));
        plot(cordX, cordY, 'rs');
		[newX, newY] = look_around(cordX, cordY, im, spot, points);
		if newX ~= cordX || newY ~= cordY
			x(index) = newX;
			y(index) = newY;
		end
	end
	if ~isequal(tempX, x) || ~isequal(tempY ,y)
		[x, y] = select_points(x, y, im);
	end
end
