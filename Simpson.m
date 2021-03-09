%Fråga 1a
clc; clear;
format long
func = @(t) (9+5.*cos(0.4.*t).^2).*(5.*exp(-0.5.*t)+2.*exp(0.15.*t));
a = 3;
b = 9;
I = integral(func,a,b)
nv = [8 16 32 64 128 256]
hVec = []; EhVec=[]; ShVec=[];
for i = 1:length(nv)
    n=nv(i);
    h = (b - a)/n;
    tv = [3:h:9];
    f = func(tv);
    Sh = h/3*(f(1)+4*sum(f([2:2:n]))+2*sum(f([3:2:n-1])) + f(n+1))
    ShVec=[ShVec;Sh]
    Eh = abs(I-Sh);
    hVec=[hVec;h];
    EhVec=[EhVec;Eh];
end
%Fråga 1c
loglog(hVec,EhVec)
for i=1:length(EhVec)-1
Eh1=(EhVec(i)/EhVec(i+1))
end
%fråga 1d
for i=1:length(ShVec)-2
Eh2=(ShVec(i)-ShVec(i+1))/(ShVec(i+1)-ShVec(i+2))
end
