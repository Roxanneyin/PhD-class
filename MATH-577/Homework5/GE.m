m = 60;
b = 2:-1:-57; b(m) = -58; b = b';
x0 = ones(m,1);
A = tril(-ones(m),-1) + diag(ones(m,1));
A(:,m) = 1;
[L,U,P] = lu(A);

d = P * b; y = zeros(m,1); x = zeros(m,1);
y(1)=d(1);
for i=2:m
    for j=1:i-1
        d(i)=d(i)-L(i,j)*y(j);
    end
    y(i)=d(i);
end

x(m)=y(m)/U(m,m);
for i=(m-1):-1:1
    for j=m:-1:i+1
        y(i)=y(i)-U(i,j)*x(j);
    end
    x(i)=y(i)/U(i,i);
end

max(abs(U(:)))
norm(x - x0, inf)

B = A;
B(:,m) = 1.1;
[L1,U1,P1] = lu(B);

d1 = P1 * b; y1 = zeros(m,1); x1 = zeros(m,1);
y1(1)=d1(1);
for i=2:m
    for j=1:i-1
        d1(i)=d1(i)-L1(i,j)*y1(j);
    end
    y1(i)=d1(i);
end

x1(m)=y1(m)/U1(m,m);
for i=(m-1):-1:1
    for j=m:-1:i+1
        y1(i)=y1(i)-U1(i,j)*x1(j);
    end
    x1(i)=y1(i)/U1(i,i);
end

x2 = B \ b;
max(abs(U1(:)))
norm(x1 - x2, inf)