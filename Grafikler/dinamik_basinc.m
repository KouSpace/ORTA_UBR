clc;           % Clear the command window.
clear;         % Clear all variables.
close all;     % Close all figure windows.

% Read data from CSV file
v = 50; % Hız (m/s)
g = 9.81; % Yer çekimi ivmesi (m/s^2)

% Yükseklik aralığı
h_max = 3000; % Maksimum yükseklik (m)
h_step = 100; % Adım boyu (m)
heights = 0:h_step:h_max;

% Atmosfer yoğunluğu hesaplaması (sade model)
rho0 = 1.225; % Deniz seviyesinde hava yoğunluğu (kg/m^3)
T0 = 288.15; % Deniz seviyesinde sıcaklık (K)
L = 0.0065; % Sıcaklık gradyanı (K/m)
R = 287.05; % Gaz sabiti (J/(kg*K))
P0 = 101325; % Deniz seviyesinde basınç (Pa)

% Dinamik basınç hesaplaması
dynamic_pressures = zeros(size(heights));
for i = 1:length(heights)
    h = heights(i);
    T = T0 - L * h;
    P = P0 * (1 - L * h / T0) ^ (g / (R * L));
    rho = P / (R * T);
    dynamic_pressures(i) = 0.5 * rho * v^2;
end

% Zaman aralığı
t_max = 30; % Maksimum zaman (s)
t_step = 0.1; % Zaman adımı (s)
times = 0:t_step:t_max;

% Dinamik basıncı zaman fonksiyonu olarak hesaplama (basit model: lineer yükseklik artışı)
h_func = (h_max / t_max) * times;
dynamic_pressures_time = interp1(heights, dynamic_pressures, h_func);

% Grafik oluşturma
figure;
plot(times, dynamic_pressures_time, 'LineWidth', 2);
xlabel('Zaman (s)');
ylabel('Dinamik Basınç (Pa)');
title('3000 metreye kadar olan Dinamik Basınç - Zaman Grafiği');
grid on;