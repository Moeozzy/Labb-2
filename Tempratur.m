clc;
clear;

L=3;
k=2;
t0=290;
t1=400;
q0=3000;
q1=200;
n=10;
h=L/(n+1);

Q=@(x) q0*exp(-q1*(x-0.7*L)^2)+200;

%Fråga 3a
v = ones(n, 1) * 2;
p = ones(n-1, 1) * -1;
A = diag(v, 0) + diag(p, 1) + diag(p,-1)

b=[];

i=1;
for x = 2:1:n-1
    b(i) = ((h^2)/k) * Q(x*h);
    i = i + 1;
end

alpha = ((h^2)/k) * Q(0) + t0;
beta = ((h^2)/k) * Q((n+1)*h) + t1;

b = [alpha b beta]'

%Fråga 3b
T = A \ b
T = [t0; T; t1]';
figure(1)
plot(0:h:L, T)

%Fråga 3c
nUtokad = [40 80 160 320]';

[x1, T1] = stav(nUtokad(1), q0, q1);
[x2, T2] = stav(nUtokad(2), q0, q1);
[x3, T3] = stav(nUtokad(3), q0, q1);
[x4, T4] = stav(nUtokad(4), q0, q1);

figure(2)
hold on
plot(x1, T1)
plot(x2, T2)
plot(x3, T3)
plot(x4, T4)
legend("n = 40", "n = 80", "n = 160", "n = 320")
hold off

max = [max(T1), max(T2), max(T3), max(T4)]';
min = [min(T1), min(T2), min(T3), min(T4)]';
medel = [mean(T1), mean(T2), mean(T3), mean(T4)]';

tabellV = [nUtokad, min, max, medel];

tabell = array2table(tabellV, 'VariableNames', {'n','min T','max T','medel T'})
