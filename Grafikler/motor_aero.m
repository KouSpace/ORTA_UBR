clc;           % Clear the command window.
clear;         % Clear all variables.
close all;     % Close all figure windows.

data = readmatrix('M2500T.xlsx');

% Extract THRUST and TIME from data
THRUST = data(:, 2);  % Assuming THRUST is in the second column
TIME = data(:, 1);    % Assuming TIME is in the first column

% Constants
G = 9.807;      % Acceleration due to gravity in m/s^2
ISP = 209.5;    % Specific impulse in seconds
initial_mass = 25;  % Initial mass of the rocket in kg

% Calculate mass flow rate
dm = THRUST / (G * ISP);

% Initialize mass array
mass = zeros(1, length(TIME));
mass(1) = initial_mass;

% Update mass over time
for k = 2:length(TIME)
    mass(k) = mass(k-1) - dm(k-1) * 0.01;  % Update mass
end

% Plot results
figure;
plot(TIME, mass);
grid on;
grid minor;
title('M2500T Roket Kütle Değişimi');
xlabel('Zaman (s)');
ylabel('Kütle (kg)');
