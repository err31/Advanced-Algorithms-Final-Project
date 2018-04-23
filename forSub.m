function x = forSub(a,b)

    n = length(b);
    x = zeros(n,1);
    x(1) = b(1)/a(1,1);
    for i = 2:n
        x(i,1) = (b(i)-a(i,1:i-1)*x(1:i-1,1))./a(i,i);
    end

end