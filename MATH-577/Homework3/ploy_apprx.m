function x = ploy_apprx

format long;

m = 50; n = 12;
t = linspace(0, 1, m);
A = fliplr(vander(t));
A = A(:,1:n);
b = cos(4 * t)';

%(a)
R = chol(A' * A);
x1 = R \ (R' \ (A' * b));

%(b)
[Q, R] = mgs(A);
x2 = R \ (Q' * b);

%(c)
[W, R] = house(A);
Q = formQ(W);
Q = Q(:,1:n);
x3 = R \ (Q' * b);

%(d)
[Q, R] = qr(A);
x4 = R \ (Q' * b);

%(e)
x5 = A \ b;

%(f)
[U, S, V] = svd(A, 0);
x6 = V * (S \ (U' * b));

x = [x1, x2, x3, x4, x5, x6];

end