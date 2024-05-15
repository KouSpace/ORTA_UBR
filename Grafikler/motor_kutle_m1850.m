clc;           % Clear the command window.
clear;         % Clear all variables.
close all;     % Close all figure windows.

% Read data from CSV file
data = readmatrix('M1850W.xlsx');

% Extract THRUST and TIME from data
THRUST = data(:, 2);  % Assuming THRUST is in the second column
TIME = data(:, 1);    % Assuming TIME is in the first column

% Interpolate thrust values
T_YANMA = 0:0.01:4.301;
itki = interp1(TIME, THRUST, T_YANMA, 'linear', 'extrap');

% Constants
G = 9.807;          % Acceleration due to gravity in m/s^2
ISP = 189.4;        % Specific impulse in seconds
initial_mass = 29.958;  % Initial mass of the rocket in kg

% Calculate mass flow rate
dm = itki / (G * ISP);

% Initialize mass array
mass = zeros(1, length(T_YANMA));
mass(1) = initial_mass;

% Update mass over time
for k = 2:length(T_YANMA)
    mass(k) = mass(k-1) - dm(k-1) * 0.01;  % Update mass
end

% Plot results
figure;
plot(T_YANMA, mass, 'LineWidth', 1.5);
grid on;
grid minor;
title('Roket Kütle Değişimi');
xlabel('Zaman (s)');
ylabel('Kütle (kg)');
