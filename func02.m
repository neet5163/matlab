function o1 = func02(a1,a2,a3,a4)
    function z =child_func(x,y)
        z = x+y;
    end

tmp1 = child_func(a1,a2);
tmp2 = local_func(a3,a4);

o1 = child_func(tmp1,tmp2);

end

function o = local_func(a1,a2)
    o = a1+a2;
end