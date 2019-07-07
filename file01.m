fileID = fopen('data01.txt','w');

for i=1:100
    fprintf(fileID,"%d\n", i)
end
