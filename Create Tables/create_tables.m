function [color_texture] =  create_tables(color, texture)

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
		temp(isnan(temp)) = 0;
        temp =  temp(temp ~= 0);
		if length(temp) > color_avg
			temp = sort(temp, 'descend');
			temp = temp(1 : color_avg);
			row = [];
			for j = 2 : 4 : y
				if isnan(color(i, j))
					break;
				elseif ~isempty(find(temp == color(i, j), 1))
					row_temp = color(i, j : (j + 3));
					row = cat(2, row, row_temp);
                end
                if length(row) == (4 * color_avg)
                    break;
                end
			end
        else
			row = color(i, 2 : end);
			row(isnan(row)) = 0;
            row = row(row ~= 0);
			[tx, ty] = size(row);
            if ty ~= (4 * color_avg)
                temp = zeros(1, ((4 * color_avg) - ty));
                row = cat(2, row, temp);
            end
        end
        i
		new_color(i, :) = row;
        
    end
    
    texture(isnan(texture)) = 0;
    color_texture = cat(2, new_color, texture);
end
