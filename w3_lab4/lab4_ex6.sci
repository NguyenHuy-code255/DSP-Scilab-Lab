// Dinh nghia hai tin hieu dau vao
x = [1, 2, -3, 2, 1];
n_x = 0:4;

h = [1, 0, -1];
n_h = 0:2;

// Phuong phap 1: Folding and Shifting (dung ham convol)
y_conv = convol(h, x);
n_y = 0:(length(x) + length(h) - 2);

disp("Ket qua theo Folding and Shifting:");
disp(y_conv);

// Phuong phap 2: Ma tran
N = length(x);
M = length(h);
L = N + M - 1;

// Tao ma tran H kich thuoc L x N
H_matrix = zeros(L, N);
for i = 1:N
    H_matrix(i:i+M-1, i) = h';
end

// Nhan ma tran H voi vecto x
y_matrix = H_matrix * x';
disp("Ket qua theo Ma tran (Matrix method):");
disp(y_matrix');

// Tinh nang luong e(n) = |x(n)|^2
E_x = x.^2;
E_y = y_conv.^2;

// Ve do thi x(n), y(n) va Nang luong tren cung 1 hinh
scf(0); clf();

// Ve x(n)
subplot(3, 1, 1);
plot2d3(n_x, x, style=2);
plot2d(n_x, x, style=-9);
title('Tin hieu dau vao x(n)');
xlabel('n'); ylabel('Bien do');
xgrid(1);

// Ve y(n)
subplot(3, 1, 2);
plot2d3(n_y, y_conv, style=5);
plot2d(n_y, y_conv, style=-9);
title('Tin hieu tich chap y(n)');
xlabel('n'); ylabel('Bien do');
xgrid(1);

// Ve nang luong 
subplot(3, 1, 3);
plot2d3(n_x, E_x, style=3);
plot2d(n_x, E_x, style=-9);
plot2d3(n_y, E_y, style=6);
plot2d(n_y, E_y, style=-4);
title('Nang luong tuc thoi cua cac tin hieu');
xlabel('n'); ylabel('Nang luong');
hl = legend(['E_x(n)'; 'E_y(n)'], pos=2);
xgrid(1);
