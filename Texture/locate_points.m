function [ location ] = select_points(x, y, im)
	[h, w, d] = size(im);
	location = '';

	if y > (h / 2)
		location = strcat(location, 'b');
	else
		location = strcat(location, 't');
	end

	if x > (w / 2)
		location = strcat(location, 'r');
	else
		location = strcat(location, 'l');
	end
end
