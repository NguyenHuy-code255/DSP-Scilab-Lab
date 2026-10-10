function [yn, yorigin] = advance(xn, xorigin, k)
    yn = xn;

    yorigin = xorigin + k;
    
    nx = (1:length(xn)) - xorigin;
    ny = (1:length(yn)) - yorigin;
    
    clf(); 
    
    subplot(2,1,1);
    plot2d3(nx, xn);
    plot(nx, xn, 'ro'); 
    xtitle('Tin hieu goc x(n)', 'n', 'Bien do');
    xgrid(); 
    
    subplot(2,1,2);
    plot2d3(ny, yn);
    plot(ny, yn, 'bo');
    xtitle('Tin hieu dich som y(n) = x(n + ' + string(k) + ')', 'n', 'Bien do');
    xgrid();
endfunction
