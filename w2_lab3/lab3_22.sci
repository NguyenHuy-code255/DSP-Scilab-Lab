function val = get_x(n_val)
    if (n_val >= -2 & n_val <= 2) then
        val = 1;
    elseif (n_val == 3 | n_val == 4) then
        val = 0.5;
    else
        val = 0;
    end
endfunction

n = -6:8;
x = zeros(1, length(n));
xa = zeros(1, length(n));
xb = zeros(1, length(n));
xc = zeros(1, length(n));
xd = zeros(1, length(n));
xe = zeros(1, length(n));
xf = zeros(1, length(n));
x_even = zeros(1, length(n));
x_odd = zeros(1, length(n));

for i = 1:length(n)
    ni = n(i);
    x(i) = get_x(ni);
    xa(i) = get_x(ni - 2);       // (a)
    xb(i) = get_x(4 - ni);       // (b)
    xc(i) = get_x(ni + 2);       // (c)
    
    // (d) x(n)u(2-n)
    u = 0; if (2 - ni >= 0) then u = 1; end;
    xd(i) = get_x(ni) * u;
    
    // (e) x(n-1)delta(n-3)
    delta = 0; if (ni == 3) then delta = 1; end;
    xe(i) = get_x(ni - 1) * delta;
    
    // (f) x(n^2)
    xf(i) = get_x(ni^2);
    
    // (g) Even part và (h) Odd part
    x_even(i) = (get_x(ni) + get_x(-ni)) / 2;
    x_odd(i) = (get_x(ni) - get_x(-ni)) / 2;
end


clf();
subplot(3,3,1); plot2d3(n, x); title('Signal x(n)');
subplot(3,3,2); plot2d3(n, xa); title('(a) x(n-2)');
subplot(3,3,3); plot2d3(n, xb); title('(b) x(4-n)');
subplot(3,3,4); plot2d3(n, xc); title('(c) x(n+2)');
subplot(3,3,5); plot2d3(n, xd); title('(d) x(n)u(2-n)');
subplot(3,3,6); plot2d3(n, xe); title('(e) x(n-1)\delta(n-3)');
subplot(3,3,7); plot2d3(n, xf); title('(f) x(n^2)');
subplot(3,3,8); plot2d3(n, x_even); title('(g) Even part of x(n)');
subplot(3,3,9); plot2d3(n, x_odd); title('(h) Odd part of x(n)');
