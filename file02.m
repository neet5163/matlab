fileID = fopen('data01.txt','r');

A = [1:100];
B = fscanf(fileID,'%d',100);
B = B'; %100x1����1x100�ւ̓]�u
fclose(fileID);

plot(A,B);