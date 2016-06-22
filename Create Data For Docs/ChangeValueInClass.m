function [classArray] = ChangeValueInClass(classArray, indices)

	for i  = 1 : length(indices)
		classArray(indices(i)).value = 1;
	end
	
end

