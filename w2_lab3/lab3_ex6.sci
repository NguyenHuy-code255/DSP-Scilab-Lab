function [yn, yorigin] = convolution(xn, xorigin, hn, horigin)
    yn = convol(xn, hn);
    
    yorigin = xorigin + horigin - 1;
    
    nx = (1:length(xn)) - xorigin;
    nh = (1:length(hn)) - horigin;
    ny = (1:length(yn)) - yorigin;
    
    clf();
    
    subplot(3,1,1);
    plot2d3(nx, xn);
    plot(nx, xn, 'ro');
    xtitle('Tin hieu dau vao x(n)', 'n', 'Bien do');
    xgrid();
    
    subplot(3,1,2);
    plot2d3(nh, hn);
    plot(nh, hn, 'go');
    xtitle('Dap ung xung h(n)', 'n', 'Bien do');
    xgrid();
    
    subplot(3,1,3);
    plot2d3(ny, yn);
    plot(ny, yn, 'bo');
    xtitle('Tin hieu tich chap y(n) = x(n) * h(n)', 'n', 'Bien do');
    xgrid();
endfunction
