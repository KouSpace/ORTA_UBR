clc;
clear;
close all;
THRUST = xlsread('MOTOR2.csv','A1:A61');
TIME = xlsread('MOTOR2.csv','B1:B61');

T_YANMA=0:0.01:4.301;
itki=interp1 (TIME, THRUST,T_YANMA);
itki=vpa(itki);

plot(THRUST, TIME)
title('M2500T İTKİ KUVVETİ MODELİ')
grid on


