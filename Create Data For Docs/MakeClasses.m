dirFrames = 'Frames/';
dirFiles = 'Files/';

framesList = dir(strcat(dirFrames, '*.jpeg'));
filesList = dir(strcat(dirFiles, '*.txt'));

[c1, c2, c3, c4, c5, c6, c7, c8, c9, c10] = InicializeClass(framesList, ...
		length(framesList));

for j = 1 : length(filesList)
	f = fopen(filesList(j).name);
	codeLine = fgets(f);
	fclose(f);

	codes = strsplit(codeLine, ',');

	name = strsplit(filesList(j).name, '.txt');
	name = cell2mat(name(1));

	frameNames = extractfield(framesList, 'name');
	indices = find(strncmp(name, frameNames, length(name)));

	[c1, c2, c3, c4, c5, c6, c7, c8, c9, c10] = SetClassValue(c1, c2, c3, c4,...
			c5, c6, c7, c8, c9, c10, indices, codes);
end

save('Class1', 'c1')
save('Class2', 'c2')
save('Class3', 'c3')
save('Class4', 'c4')
save('Class5', 'c5')
save('Class6', 'c6')
save('Class7', 'c7')
save('Class8', 'c8')
save('Class9', 'c9')
save('Class10', 'c10')
