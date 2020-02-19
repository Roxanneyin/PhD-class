A = [8 4 2 1; 4 8 4 2; 2 4 8 4; 1 2 4 8];
v = [1 1 1 1]'./2;
n = 10;
off_diag_max = [];

format long

for k = 1:n
    [Q,R] = qr(A);
    A = R*Q; max = 0;
    for i = 1:4
        for j = 1:4
            if (i ~= j & A(i,j) > max)
                max = A(i,j);
            end
        end
    end
    off_diag_max = [off_diag_max max];
end

A
off_diag_max