function [t_svar, f_svar] = feuler(u0,T,n)
    
    m = 0.6;
    L = 1.5;
    g = 9.81;
    u = 0.2;
    h = T / n;
    y = u0;
    f = @(y) [y(2), -(u/m)*y(2)-(g/L)*sin(y(1))]';
    t_svar = [0:h:T];
    f_svar = zeros(2,length(t_svar)-1)';
    
    for ii = 1:length(t_svar)-1
        y = y + h * f(y);
        f_svar(ii,1) = y(1);
        f_svar(ii,2) = y(2);
    end          
end
