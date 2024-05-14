clc;  clear;  close all;

theta=85;
V_0=2;
t=0;    dt=0.01;
Zmax=0; Vmax=0;
Ax=0;   Az=-9.801;
m=25;

A=zeros(1,1);
A(1,1)=Ax;
A(2,1)=Az;

R=[0;0];

V=zeros(1,1);
V(1,1)=V_0*cosd(theta);
V(2,1)=V_0*sind(theta);
Vz=V(2,1);
Vx=V(1,1);
VT=sqrt((Vz.^2)+(Vx.^2));

i=2;
s=1;

Rz(1)=0;
Rx(1)=0;

ITKI=xlsread('veri_itki_F_2022.xlsx','M2500T','B1:B424');
Cd=xlsread('drag_export.xlsx','A1:A518');

pi=3.14;
Diameter=0.14;
Alan=pi*(Diameter/2)^2;
p=1.225;

g=-9.807;
ISP=205.5;

altitude=980;
Sealevel=980;

k=1.4;
R=287.15;
T = 8.6798;


while (Rz<=3000)
    
    P= 101.29*((T+273)/288.08)^5.256 ;
    p=  P / (0.2869*(T+273)) ;
    altitude=Rz+Sealevel;
    c=sqrt(k*R*(T+273)); 
    if s<424
        Fitki=ITKI(s);
        dm=(Fitki)/(g*ISP);
        m=m-dm*0.01;
    else
        Fitki=0;
    end
    s=s+1;
    D=0.5.*Cd.*p.*Alan.*(VT.^2);
    Az=((Fitki-D)*sind(theta))/m+g;
    Ax=((Fitki-D)*cosd(theta))/m;
    A=sqrt((Az.^2)+(Ax.^2));
    
    Vx=Vx+Ax*dt;
    Vz=Vz+Az*dt;
    VT=sqrt((Vz.^2)+(Vx.^2));
    Rx(i)=Rx(i-1)+Vx(1)*dt+ Ax(1)*(dt^2*0.5);
    Rz(i)=Rz(i-1)+Vz(1)*dt+ Az(1)*(dt^2*0.5);
    t = t+dt;
    time(i) = t;
    VZ(i-1,1)=Vz(1);
    if (abs(Rz) >  abs(Zmax))
        Zmax=Rz;
    end
    if (Vz > Vmax)
        Vmax=Vz;
    end
    i=i+1;
end
plot(Rz,'b')
xlabel ('Menzil[m]')
ylabel ('Yükseklik[m]')
title('Yörünge Grafiði')
grid on
