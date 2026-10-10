function [yn, yorigin] = multi(x1n, x1origin, x2n, x2origin)
    n1 = (1:length(x1n)) - x1origin;
    n2 = (1:length(x2n)) - x2origin;
    
    min_n = min(min(n1), min(n2));
    max_n = max(max(n1), max(n2));
    n_chung = min_n:max_n; 
    
    y1 = zeros(1, length(n_chung));
    y2 = zeros(1, length(n_chung));
    
    y1((n1(1) - min_n + 1) : (n1($) - min_n + 1)) = x1n;
    y2((n2(1) - min_n + 1) : (n2($) - min_n + 1)) = x2n;
    
    yn = y1 .* y2;
    
    yorigin = 1 - min_n;
    
    min_y = min([min(x1n), min(x2n), min(yn)]) - 1.5;
    max_y = max([max(x1n), max(x2n), max(yn)]) + 1.5;
    
    clf();
    
    subplot(3,1,1);
    plot2d3(n1, x1n);
    plot(n1, x1n, 'ro');
    xtitle('Tin hieu x1(n)', 'n', 'Bien do');
    xgrid();

    // Đồ thị x2(n)
    subplot(3,1,2);
    plot2d3(n2, x2n);
    plot(n2, x2n, 'go');
    xtitle('Tin hieu x2(n)', 'n', 'Bien do');
    xgrid();
    
    // Đồ thị y(n)
    subplot(3,1,3);
    plot2d3(n_chung, yn);
    plot(n_chung, yn, 'bo');
    xtitle('Tin hieu tich y(n) = x1(n) .* x2(n)', 'n', 'Bien do');
    xgrid();
endfunction
