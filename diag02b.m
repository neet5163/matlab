user_ans = inputdlg('input num:','input dialog');
if numel(user_ans) == 0
    return;
end

disp(user_ans);
num = str2num(user_ans{1,1});
disp(num);
