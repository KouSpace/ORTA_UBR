clc;clear;close all;

data = readmatrix('M1850W.xlsx');

THRUST = data(:, 2);
TIME = data(:, 1);

T_YANMA = 0:0.01:4.301;
itki = interp1(TIME, THRUST, T_YANMA, 'linear', 'extrap');

G = 9.807;
ISP = 189.4;
initial_mass = 26.810;

dm = itki / (G * ISP);

mass = zeros(1, length(T_YANMA));
mass(1) = initial_mass;

for k = 2:length(T_YANMA)
    mass(k) = mass(k-1) - dm(k-1) * 0.01;
end

figure;
plot(T_YANMA, mass);
grid on;
grid minor;
title('M1850W Roket Kütle Değişimi');
xlabel('Zaman (s)');
ylabel('Kütle (kg)');
