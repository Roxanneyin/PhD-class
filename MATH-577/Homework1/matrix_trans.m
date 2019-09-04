function Product = matrix_trans(B)
a = [2 0 0 0; 0 1 0 0; 0 0 1 0; 0 0 0 1]; %right
b = [1 0 0 0; 0 1 0 0; 0 0 1/2 0; 0 0 0 1]; %left
c = [1 0 1 0; 0 1 0 0; 0 0 1 0; 0 0 0 1]; %left
d = [0 0 0 1; 0 1 0 0; 0 0 1 0; 1 0 0 0]; %right
e = [1 -1 0 0; 0 1 0 0; 0 -1 1 0; 0 -1 0 1]; %left
f = [1 0 0 0; 0 1 0 0; 0 0 1 1; 0 0 0 0]; %right
g = [0 0 0 0; 0 1 0 0; 0 0 1 0; 0 0 0 1]; %right

Product = e * c * b * B * a * d * f * g;

% or otherwise
A = e * c * b, C = a * d * f * g;
Product = A * B * C;
end

