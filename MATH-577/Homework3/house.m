function [W,R] = house(A)

[m,n] = size(A);
if (m < n)
    print("Error: rows more than cols!")
end

W = zeros(m,n);

for k = 1:n
    x = A(k:m,k);
    if (x(1) > 0)
        sgn = 1;
    else
        sgn = -1;
    end
    v = sgn * norm(x,2) * eye(m - k + 1, 1) + x;
    v = v / norm(v,2);
    A(k:m,k:n) = A(k:m,k:n) - 2 * v * v' * A(k:m,k:n);
    W(k:m,k) = v;
end

R = A(1:n,:);

end

