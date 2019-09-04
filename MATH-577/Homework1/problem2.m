syms x1 x2 x3
eq1 = 2 * x1 + x2 + x3 - 4;
eq2 = x1 + 3 * x2 + 2 * x3 - 6;
eq3 = x1 + 2 * x2 + 2 * x3 - 5;
[x1, x2, x3] = solve(eq1, eq2, eq3, x1, x2, x3);
A = [2, 1, 1; 1, 3, 2; 1, 2, 2];
x = [x1, x2, x3];
A * x'