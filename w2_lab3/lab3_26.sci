n = -5:7;
x = zeros(1, length(n));

// x(n)
for i = 1:length(n)
    if (n(i) >= 0 & n(i) <= 3) then x(i) = 1; end
end


function val = get_val(n_val, n_array, x_array)
    idx = find(n_array == n_val);
    if isempty(idx) then val = 0; else val = x_array(idx); end
endfunction

y = zeros(1, length(n));
y_delayed = zeros(1, length(n));

for i = 1:length(n)
    ni = n(i);
    // y(n) = x(n^2)
    y(i) = get_val(ni^2, n, x);
end

for i = 1:length(n)
    ni = n(i);
    //y(n-2)
    y_delayed(i) = get_val(ni - 2, n, y);
end

clf();
subplot(3,1,1); plot2d3(n, x); title('(1) Input x(n)');
subplot(3,1,2); plot2d3(n, y); title('(2) Output y(n) = x(n^2)');
subplot(3,1,3); plot2d3(n, y_delayed); title('(3) Delayed Output y(n-2)');
