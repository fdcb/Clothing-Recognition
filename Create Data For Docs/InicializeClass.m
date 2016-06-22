function [c1, c2, c3, c4, c5, c6, c7, c8, c9, c10] = ...
	InicializeClass(framesList, size)

	for i = 1 : size
		c1(i).name = framesList(i).name;
		c1(i).value = 0;
	end

	c2 = c1;
	c3 = c1;
	c4 = c1;
	c5 = c1;
	c6 = c1;
	c7 = c1;
	c8 = c1;
	c9 = c1;
	c10 = c1;
	
end

