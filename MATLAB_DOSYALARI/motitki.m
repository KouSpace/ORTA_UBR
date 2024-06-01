clc;
clear;
close all;
% THRUST = xlsread('MOTOR2.csv','A1:A61');
% TIME = xlsread('MOTOR2.csv','B1:B61');
% 
% T_YANMA=0:0.01:4.301;
% itki=interp1(TIME, THRUST,T_YANMA);
% itki=vpa(itki);
% 
% plot(THRUST, TIME)
% title('M2500T İTKİ KUVVETİ MODELİ')
% grid on

 % T_YANMA=0:1:60;
% 
% 
% THRUST=[4485.5
% 4479.46
% 4485.5
% 4261.83
% 4068.39
% 3929.35
% 3747.99
% 3282.52
% 2877.49
% 2762.63
% 2708.23
% 2671.96
% 2611.5
% 2575.23
% 2551.05
% 2532.92
% 2514.78
% 2478.51
% 2369.7
% 2279.02
% 2224.62
% 2091.62
% 2085.58
% 2031.17
% 1946.54
% 1934.45
% 1867.95
% 1861.91
% 1861.91
% 1813.55
% 1795.41
% 1728.91
% 1662.42
% 1505.24
% 1408.52
% 1245.3
% 1620.1
% 1432.7
% 1269.48
% 1184.85
% 1130.44
% 1069.99
% 1027.68
% 930.95
% 870.5
% 1094.17
% 912.82
% 852.37
% 797.96
% 701.24
% 719.37
% 677.06
% 646.83
% 525.93
% 398.98
% 235.76
% 187.4
% 145.08
% 48.36
% 48.36
% 0
% ] 
% plot(T_YANMA,THRUST)




THRUST=xlsread('MOTOR2.xlsx','MOTOR2','A1:A61');
TIME=xlsread ('MOTOR2.xlsx','MOTOR2','B1:B61');
T_YANMA=0:0.01:4.122;
itki=interp1 (TIME, THRUST,T_YANMA);
itki=vpa(itki);
G=9.807;
ISP=189.4;
m=4.122;
dm=(itki)/(G*ISP);
i=1;
% for(k=1:1:431)
%  m=m-dm (k)*0.01;
%  M(k)=m; 
% end
% plot (T_YANMA,M);
% grid on;
% grid minor;
% title('Zamana Bağlı Atılan Model');
% xlabel('Zaman');
% ylabel('Kütle');



