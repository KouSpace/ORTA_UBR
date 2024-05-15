clc;
clear;
close all;

% Read data from Excel file
data = readmatrix('M1850W.xlsx');

% Extract THRUST and TIME from data
THRUST = data(:, 2);  % Assuming THRUST is in the second column
TIME = data(:, 1);    % Assuming TIME is in the first column

% Remove duplicate time values
[TIME, uniqueIdx] = unique(TIME);
THRUST = THRUST(uniqueIdx);

% Interpolate thrust values
T_YANMA = 0:0.01:4.7;
itki = interp1(TIME, THRUST, T_YANMA, 'linear');

% Plot results
figure;
plot(T_YANMA, itki, 'LineWidth', 1.5);
title('M1850W İtki Kuvveti Modeli');
xlabel('Zaman (s)');
ylabel('İtki Kuvveti (N)');
grid on;
grid minor;
