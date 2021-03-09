%Fråga 2f
clc; clear;
m=0.6;
L=1.5;
g=9.81;
u=0.2;
f = @(t,y) [y(2); -(u/m)*y(2)-(g/L)*sin(y(1))]; 
t0 = 0;  
u0 = [0.5;0];             
T = 5;                            
[tsvar,ysvar] = ode45(f,[t0,T],u0);     

yend = ysvar(end,:);               

fprintf('y(T) = %g, y''(T) = %g\n',ysvar(end,1),ysvar(end,2))

plot(tsvar,ysvar(:,1),'b'); 
hold on     
title('Lösning y(t) av BVP')
xlabel('t'); 
grid on
