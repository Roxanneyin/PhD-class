m = 200; A = 2*eye(m) + 0.5*randn(m)/sqrt(m);
b = ones(m,1);

[V,~] = eig(A);
plot(V,'k.')

tol = 10^(-12);
maxit = 20;

[x, flag, relres, iter, resvec] = gmres(A,b,[],tol,maxit);

figure
semilogy(0:maxit, resvec/norm(b), '-o');
xlabel('Iteration number');
ylabel('Relative residual');