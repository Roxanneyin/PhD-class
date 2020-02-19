m = 50; n = 10;
t = (0:m-1)' / (m-1);
A = [];
for i = 1:n
    A = [A t.^(i-1)];
end
b = exp(sin(4*t));

% Conditioning
x = A \ b; y = A * x;
kappa = cond(A)
theta = asin(norm(b - y) / norm(b))
eta = norm(A) * norm(x) / norm(y)

% Householder
[Q,R] = qr(A,0);
x = R \ (Q' * b);
s1 = x(10)

[Q2,R2] = qr([A b],0);
R2_new = R2(1:n, 1:n);
Qb = R2(1:n, n+1);
x = R2_new \ Qb;
s2 = x(10)

x = A \ b;
s3 = x(10)

% Gram-Schmidt
[Q,R] = mgs(A);
x = R \ (Q' * b);
s4 = x(10)

[Q2,R2] = mgs([A b]);
R2_new = R2(1:n,1:n);
Qb = R2(1:n,n+1);
x = R2_new \ Qb;
s5 = x(10)

% Normal equations
x = (A' * A) \ (A' * b);
s6 = x(10)

% SVD
[U,S,V] = svd(A,0);
x = V * (S \ (U' * b));
s7 = x(10)