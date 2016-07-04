function create_tables(color, texture)

	color = importdata(color, ' ');
	texture = importdata(texture, ' ');

	new_color = [];
	color = color.data;
	texture = texture.data;

	color_avg = mean(color);
	color_avg = round(color_avg(1));

	[x ,y] = size(color);
	color_perc = color(: , 2 : 4 : end);
	for i = 1 : x
		temp = color_perc(i, :);
		temp(isnan(temp)) = [];
		if temp >= color_avg
			temp = sort(temp, 'descend');
			temp = temp(1 : color_avg);
			row = [];
			for j = 1 : 4 : y
				if isnan(color_perc(i, j))
					break;
				elseif ~isempty(find(temp == color_perc(i, j))
					row_temp = color_perc(i, j : (j + color_avg - 1));
					row = cat(2, row, row_temp);
				end
			end
		elseif
			row = color_perc(1, 2 : end);
			row(isnan(row)) = [];
			[tx, ty] = size(row);
			temp = zeros([1, (4 * color_avg - tx);
			row = cat(2, row, temp);
		end
		new_color(i, :) = row;
	end
end
