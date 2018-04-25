function x = GaussElimination(a,b)
    [row, col] = size(a);
    a(:, col+1) = b;
    counter=1;counter1=1;
    while counter<column
        counter1=counter+1;
        while counter1<=row
             if a(counter,counter)== 0
                a(counter,:)=a(counter1,:);
                a(counter1,:)=a(counter1,:)-(a(counter1,counter)/a(counter,counter))*a(counter,:);
            counter1=counter1+1;
             end
            a(counter1,:)=a(counter1,:)-(a(counter1,counter)/a(counter,counter))*a(counter,:);
            counter1=counter1+1;
        end
        counter=counter+1;
    end