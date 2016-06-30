function [ location ] = locate_points(x, y, outermost)

	for i = 1 : length(outermost)
		spot = char(outermost(i, 3));
		switch spot
			case 'l'
				lx = round(cell2float(outermost(i, 1)));
			case 'r'
				rx = round(cell2float(outermost(i, 1)));
			case 'd'
				dy = round(cell2float(outermost(i, 2)));
			case 'u'
				uy = round(cell2float(outermost(i, 2)));
		end
	end

	h = dy - uy;
	w = rx - lx;

	location = '';

	if y > (uy + (h / 2))
		location = strcat(location, 'b');
	else
		location = strcat(location, 't');
	end

	if x > (lx + (w / 2))
		location = strcat(location, 'r');
	else
		location = strcat(location, 'l');
	end
end
