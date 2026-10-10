clear;
clf;

function val = x_func(n_val)
    if n_val >= -3 & n_val <= -1 then
        val = 1 + n_val/3;
    elseif n_val >= 0 & n_val <= 3 then
        val = 1;
    else
        val = 0;
    end
endfunction

n = -10:10;

x = zeros(1, length(n));
y1 = zeros(1, length(n));
y2 = zeros(1, length(n));
y3 = zeros(1, length(n));

for i = 1:length(n)
    x(i) = x_func(n(i));
    
    y1(i) = x_func(-n(i) + 4);
    
    y2(i) = x_func(-n(i) - 4);
    
    y3(i) = x_func(-n(i) + 4);
end

subplot(4, 1, 1);
plot2d3(n, x);
plot(n, zeros(1, length(n)), 'k');
xtitle("(a) Tín hiệu gốc x(n)", "n", "Biên độ");

subplot(4, 1, 2);
plot2d3(n, y1);
plot(n, zeros(1, length(n)), 'k');
xtitle("(b.1 & c) Gấp x(n) rồi trễ 4 mẫu: x(-n+4)", "n", "Biên độ");

subplot(4, 1, 3);
plot2d3(n, y2);
plot(n, zeros(1, length(n)), 'k');
xtitle("(b.2) Trễ x(n) 4 mẫu rồi gấp: x(-n-4)", "n", "Biên độ");

subplot(4, 1, 4);
plot2d3(n, y3);
plot(n, zeros(1, length(n)), 'k');
xtitle("Tín hiệu x(-n+4)");
