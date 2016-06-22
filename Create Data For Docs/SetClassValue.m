function [c1, c2, c3, c4, c5, c6, c7, c8, c9, c10] = ...
	SetClassValue(c1, c2, c3, c4, c5, c6, c7, c8, c9, c10, indices, codes)

	for i = 1 : length(codes) - 1
        disp(codes(i))
        code = codes(i);
        switch (cell2mat(code))
			case '1'
				c1 = ChangeValueInClass(c1, indices);
			case '2'
				c2 = ChangeValueInClass(c2, indices);
			case '3'
				c3 = ChangeValueInClass(c3, indices);
			case '4'
				c4 = ChangeValueInClass(c4, indices);
			case '5'
				c5 = ChangeValueInClass(c5, indices);
			case '6'
				c6 = ChangeValueInClass(c6, indices);
			case '7'
				c7 = ChangeValueInClass(c7, indices);
			case '8'
				c8 = ChangeValueInClass(c8, indices);
			case '9'
				c9 = ChangeValueInClass(c9, indices);
			case '10'
				c10 = ChangeValueInClass(c10, indices);
			otherwise
				warning('You screwed up :(')
        end
	end
end

