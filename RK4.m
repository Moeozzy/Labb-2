function [t_svar, f_svar] = RK4(u0,T,n)
    
    m = 0.6;
    L = 1.5;
    g = 9.81;
    u = 0.2;
    h = T / n;
    y = u0;
    f = @(y) [y(2), -(u/m)*y(2)-(g/L)*sin(y(1))]';
   
    
    t_svar = zeros(n+1,1);
    f_svar = zeros(n+1,2);
    f_svar(1,:) = u0;
    t=0;
   
    for ii = 1:n
        
        k1 = f(y);
        
        k2 = f(y+h/2*k1);
        
        k3 = f(y+h/2*k2);
        
        k4 = f(y+h*k3);
        
        y = y+(h/6)*(k1 + 2*k2 + 2*k3 + k4);
        
        t = t+h;
        
    
        f_svar(ii+1,:) = y';
        t_svar(ii+1)= t; 
    end    
     
end
