m = 32;
supdia1 = diag(ones(m-1,1));supdia2 = diag(ones(m-2,1));
appd1 = zeros(m-1,1); appd2 = zeros(1,m);
appd3 = zeros(m-2,1); appd4 = zeros(1,m-1);
A = diag(-ones(m,1)) + [[appd1 supdia1]; appd2] + [[appd1 [[appd3 supdia2]; appd4]]; appd2];

eigtool(A)

y = [];

for i = 0:0.5:50
    y = [y norm(expm(i .* A),2)];
end

t = 0:0.5:50;

figure
semilogy(t,y)
