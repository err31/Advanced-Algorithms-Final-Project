function x = backSub(a,b)

    n = length(b);
    x = zeros(n,1);
    x(n) = b(n)/a(n,n);
    for i = (n-1):-1:1
        x(i) = (b(i)-a(i,(i+1):n)*x((i+1):n))./a(i,i);
    end

end