function [yn, yorigin] = fold(xn, xorigin)

    yn = xn($:-1:1);
    
    L = length(xn);
    yorigin = L - xorigin + 1;
    
    nx = (1:L) - xorigin;
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
    xtitle('Tin hieu gap (fold) y(n) = x(-n)', 'n', 'Bien do');
    xgrid();
endfunction
