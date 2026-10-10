t = 0:0.001:0.1;
xa = 3 * sin(100 * %pi * t);

Fs = 300;
n = 0:30;
xn = 3 * sin((%pi / 3) * n);

delta = 0.1;
xqn = floor(xn / delta) * delta;

subplot(3, 1, 1);
plot(t, xa);

subplot(3, 1, 2);
plot2d3(n, xn);

subplot(3, 1, 3);
plot2d3(n, xqn);
