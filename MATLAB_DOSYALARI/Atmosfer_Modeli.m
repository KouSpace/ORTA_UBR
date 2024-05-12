clc; 
clear;
close all;

k=1.4;
R=287.15;
i=1; 
yukseklik=1:1:11000;

for (h=1:1:11000)

T = 15.04-0.00649*h;
P(i) = 101.29*((T+273)/288.08)^5.256;
p(i) = P(i) / (0.2869*(T+273.1));
c(i) = sqrt(k*R*(T+273));
i=i+1;

end

figure (1)
plot(yukseklik,p);
xlabel ('yükseklik[m]');
ylabel ('hava-yoğunluğu[kg/m3]');
figure (2)
plot(yukseklik,c);
xlabel ('yükseklik[m]');
ylabel ('ses-hızı[m/s]');


