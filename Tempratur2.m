clc;
clear;

%Fråga 3d
q0=3000;
q0min=2800;
q0max=3200;
q1=200;
q1min=190;
q1max=210;
n=[40 80 160 320];

for i = 1:4
    [x, T] = stav(n(i), q0, q1);
    [xmax, Tmax] = stav(n(i), q0max, q1max);
    [xmin, Tmin] = stav(n(i), q0min, q1min);

    maxerror = abs(max(Tmax) - max(T));
    minerror = abs(max(Tmin) - max(T));

    medelerror = mean([maxerror minerror]);
    disp("För n=" + num2str(n(i)) + " är den maximala temperaturen " + num2str(max(T)) + " ± " + num2str(medelerror)) 
end
