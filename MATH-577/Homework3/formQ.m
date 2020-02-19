function Q = formQ(W)

[m,n] = size(W);
if (m < n)
    print("Error: rows more than cols!")
end

Q = eye(m,m);

for k = 1:m
    Q(:,k) = formQx(W,Q(:,k));
end

end

function y = formQx(W,x)

[m,n] = size(W);
if (m < n)
    print("Error: rows more than cols!")
end

for k = n:-1:1
    x(k:m) = x(k:m) - 2 * W(k:m,k) * (W(k:m,k)' * x(k:m));
end

y = x;
end

