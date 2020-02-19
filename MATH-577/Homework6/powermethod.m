A = [8 4 2 1; 4 8 4 2; 2 4 8 4; 1 2 4 8];
v = [1 1 1 1]'./2;
n = 10;
lambda1 = []; lambda2 = []; lambda3 = [];

format long
for k = 1:n
    w = A * v;
    v = w / norm(w);
    lambda1 = [lambda1 v'*A*v];
end

v = [1 1 1 1]'./2;

for k = 1:n
    w = A \ v;
    v = w / norm(w);
    lambda2 = [lambda2 v'*A*v];
end

v = [1 1 1 1]'./2;
lambda3 = [v'*A*v];

for k = 1:n
    w = (A - lambda3(k)*eye(4)) \ v;
    v = w / norm(w);
    lambda3 = [lambda3 v'*A*v];
end

lambda1
lambda2
lambda3