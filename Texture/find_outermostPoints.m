function [ points ] = find_outermostPoints(x, y)
	points = cell(8, 4);
	disp(x)
	disp(y)
	[maxX, iMaxX] = max(x);
	[minX, iMinX] = min(x);
	[minY, iMinY] = min(y);
	[maxY, iMaxY] = max(y);

	points(1, :) = {maxX, y(iMaxX), 'r', iMaxX};
	points(2, :) = {minX, y(iMinX), 'l', iMinX};
	points(3, :) = {x(iMaxY), maxY, 'd', iMaxY};
	points(4, :) = {x(iMinY), minY, 'u', iMinY};

	x(iMaxX) = [];
	x(iMinX) = [];
	y(iMaxY) = [];
	y(iMinY) = [];

	disp(x)
	disp(y)
	[maxX, iMaxX] = max(x);
	[minX, iMinX] = min(x);
	[minY, iMinY] = min(y);
	[maxY, iMaxY] = max(y);

	points(5, :) = {maxX, y(iMaxX), 'r', iMaxX};
	points(6, :) = {minX, y(iMinX), 'l', iMinX};
	points(7, :) = {x(iMaxY), maxY, 'd', iMaxY};
	points(8, :) = {x(iMinY), minY, 'u', iMinY};

end
