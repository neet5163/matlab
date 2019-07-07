fileID = fopen('data01B.txt','w');

A = 1:100
    fprintf(fileID,"%d\n", A)
    fclose(fileID);