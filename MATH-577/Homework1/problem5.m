x = -1:0.05:1;
y1 = exp(x);
y2 = 3 * exp(-10 * x .^ 2);
plot(x, y1)
hold on
plot(x, y2)
xlabel('x on [-1,1]'), ylabel('value of function')
title('plot for two exp functions')
legend('exp(x)', '3*exp(-10x^2)')