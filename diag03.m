FileName = uiputfile('*.txt');

if FileName == 0
    return
end

fileID = fopen(FileName,'w');
A=1:100;
fprintf(fileID,"%d\n", A);

fclose(fileID);
