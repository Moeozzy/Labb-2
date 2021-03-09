function [xVec, TVec] = stav(n, q0, q1)
L=3;
k=2;
t0=290;
t1=400;
h=L/(n+1);

Q=@(x) q0*exp(-q1*(x-0.7*L)^2)+200;

v = ones(n, 1) * 2;
p = ones(n-1, 1) * -1;
A = diag(v, 0) + diag(p, 1) + diag(p,-1);

b=[];

i=1;
for x = 2:1:n-1
    b(i) = ((h^2)/k) * Q(x*h);
    i = i + 1;
end

alpha = ((h^2)/k) * Q(0) + t0;
beta = ((h^2)/k) * Q((n+1)*h) + t1;

b = [alpha b beta]';

T = A \ b;
T = [t0; T; t1]';

xVec = 0:h:L;
TVec = T;
end
