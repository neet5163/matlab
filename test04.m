A={1 2 3 4; 'A' 'B' 'C' 'D'};

for i = A
    if i{1,1} == 1
        str=sprintf('1st %d %s',i{1,1},i{2,1});
        disp(str);
    elseif i{1,1} == 2
        disp('2nd');
        continue;
    elseif i{1,1} == 3
        disp('3rd');
        break;
    else
        str=sprintf('4th %d %s',i{1,1},i{2,1});
        disp(str);
    end
end
