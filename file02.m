fileID = fopen('data01.txt','r');

A = [1:100];
B = fscanf(fileID,'%d',100);
B = B'; %100x1から1x100への転置
fclose(fileID);

plot(A,B);