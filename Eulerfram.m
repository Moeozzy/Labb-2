%fråga 2b
clc; clear; 
[t_svar, f_svar] = feuler([0.5 0],5,5/0.01);
fprintf('y(T) = %g, y''(T) = %g\n',f_svar(end,1),f_svar(end,2))
plot(t_svar(1:end-1),f_svar(:,1))
xlabel('t'), ylabel('y'), title('Euler')
grid on

Nfunc = @(x) 2.^x;
u0 = [0.5 0];
T = 5;
n = [1:20];
intervall= Nfunc(n);
fi= zeros(length(intervall),1);
raknare=1;
%fråga 2c
for ii = intervall
    [fetch_t_svar, fetch_f_svar] = feuler(u0,T,ii);
    fi(raknare) = fetch_f_svar(end,1);
    raknare = raknare + 1;
end
Kvot = (fi(2:end-1)-fi(1:end-2))./(fi(3:end)-fi(2:end-1));
N = log2(Kvot);
tabell = table(N, Kvot, 'VariableNames', {'Nogrannhetsordning', 'Kvot'})
