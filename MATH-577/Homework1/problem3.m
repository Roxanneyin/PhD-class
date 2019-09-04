A = [2 -3 1 3; 4 1 -1 5; 1 1 0 6; -7 0 0 9];
norm(A, 1)
norm(A, 2)
norm(A, inf)
norm(A, 'fro')

% Verify 3.3
x = [1, 2, 3, 4];
norm(x, inf), norm(x, 2)
norm(x, 2), 2 * norm(x, inf)
norm(A, inf), 2 * norm(A, 2)
norm(A, 2), 2 * norm(A, inf)