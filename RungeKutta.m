%Fråga 2d
clc; clear;
T = 5;
t= 0;
h= 0.01;
n = (T-t)/h;
u0= [0.5 0]';
[t_svar, f_svar] = RK4(u0,T,n); 
fprintf('y(T) = %g, y''(T) = %g\n',f_svar(end,1),f_svar(end,2))
plot(t_svar', f_svar(:,1))
grid on
%Fråga 2e
x=10;
hvec = zeros(x,1); fi = zeros(x,1);
for ii=1:x
    hvec(ii) = T/n;
    [t_svar, f_svar] = RK4(u0,T,n);
    n = n*2;
    fi(ii) = f_svar(end,1);
end
lenphi = length(fi);
Kvot= zeros(lenphi-2,1); N = zeros(lenphi-2,1);
for ii=1:lenphi-2
    Kvot(ii) = abs((fi(ii)-fi(ii+1))/(fi(ii+1)-fi(ii+2))); 
    N(ii) = log2(Kvot(ii));                                    
end
T = table(Kvot, N, 'VariableNames', {'Kvot', 'Noggranhetsordning'})
