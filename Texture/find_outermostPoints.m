function [ points ] = find_outermostPoints(x, y)
	points = cell(4, 4);

	[maxX, iMaxX] = max(x);
	[minX, iMinX] = min(x);
	[minY, iMinY] = min(y);
	[maxY, iMaxY] = max(y);

	points(1, :) = {maxX, y(iMaxX), 'r', iMaxX};
	points(2, :) = {minX, y(iMinX), 'l', iMinX};
	points(3, :) = {maxY, y(iMaxY), 'd', iMaxY};
	points(4, :) = {minY, y(iMinY), 'u', iMinY};

end
