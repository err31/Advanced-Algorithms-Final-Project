% Code taken and modified from
% https://www.mathworks.com/matlabcentral/fileexchange/48571-gauss-elimination-method

function x = GaussElimination(a,b)
    [row, col] = size(a);
    a = [a,b];
    counter=1;
    while counter<col
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
    x = backSub(a(:,1:col),a(:,end));
end
