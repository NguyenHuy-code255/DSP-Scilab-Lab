// Dinh nghia tin hieu
x = [1, 2, -3, 2, 1];
h = [1, 0, -1, -1, 1];
N = length(x);
n_idx = 0:(N-1);

// Phuong phap 1: Folding & Shifting
y_loop = zeros(1, N);
for n = 0:(N-1)
    for k = 0:(N-1)
        idx_x = pmodulo(n - k, N) + 1; 
        y_loop(n+1) = y_loop(n+1) + h(k+1) * x(idx_x);
    end
end
//disp("Ket qua theo Folding & Shifting:");
disp(y_loop);

// Phuong phap 2: Ma tran
Hc = zeros(N, N);
for row = 1:N
    for col = 1:N
        idx = pmodulo(row - col, N) + 1;
        Hc(row, col) = h(idx);
    end
end

y_matrix = Hc * x';
disp("Ket qua theo Matrix method:");
disp(y_matrix');

// Tinh nang luong
E_x = x.^2;
E_y = y_loop.^2;

// Ve do thi x(n), y(n) va Nang luong
scf(0); clf();

// Ve x(n)
subplot(3, 1, 1);
plot2d3(n_idx, x, style=2);
plot2d(n_idx, x, style=-9);
title('Tin hieu x(n)');
xlabel('n'); ylabel('Bien do');
xgrid(1);

// Ve y(n)
subplot(3, 1, 2);
plot2d3(n_idx, y_loop, style=5);
plot2d(n_idx, y_loop, style=-9);
title('Tin hieu tich chap vong y(n)');
xlabel('n'); ylabel('Bien do');
xgrid(1);

// Ve nang luong
subplot(3, 1, 3);
plot2d3(n_idx, E_x, style=3);
plot2d(n_idx, E_x, style=-9);
plot2d3(n_idx, E_y, style=6);
plot2d(n_idx, E_y, style=-4);
title('Nang luong tuc thoi cua cac tin hieu');
xlabel('n'); ylabel('Nang luong');
hl = legend(['E_x(n)'; 'E_y(n)'], pos=2);
xgrid(1);
