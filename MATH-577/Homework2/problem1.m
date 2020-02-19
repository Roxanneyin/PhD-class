A = [1 2; 0 2];
[U, S, V] = svd(A);
v1 = V(:, 1); v2 = V(:, 2);
u1 = U(:, 1); u2 = U(:, 2);
simga_u1 = S(1, 1) * u1;
sigma_u2 = S(2, 2) * u2;
t = 0:0.01:(2 * pi);
x1 = cos(t); y1 = sin(t);
w = A * [x1; y1];
x2 = w(1, :); y2 = w(2, :);

figure(1);
plot(x1, y1, 'k');
hold on;
line_plot(v1, 'b');
hold on;
line_plot(v2, 'r');
grid on;
title('On pre-image unit circle');

figure(2);
plot(x2, y2, 'k');
hold on;
line_plot(simga_u1, 'b');
hold on;
line_plot(sigma_u2, 'r');
grid on;
title('On image ellipse');

function line_plot(v, color)

t = 0:0.01:1;
x = v(1) * t; y = v(2) * t;
plot(x, y, color);;

end