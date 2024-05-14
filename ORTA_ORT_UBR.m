 clc;  clear;  close all;

 theta=70;            
 V_0=100;     
 t=0;    dt=0.01;
 Zmax=0; Vmax=0;
 Ax=0;   Az=9.801;
 Rx=0;  Rz=0;

 A=zeros(1,1);       
 A(1,1)=Ax;             
 A(2,1)=Az;

 R=zeros(1,1);
 R(1,1)=Rx;             
 R(2,1)=Rz;
 
 V=zeros(1,1);
 V(1,1)=V_0*cosd(theta);
 V(2,1)=-V_0*sind(theta);  
                               
 Vz=V(2,1);
 Vx=V(1,1);
 i=0;      
 
 while (Rz<=0)
 
     i=i+1;             
     V = V + A*dt;
     R = R + V*dt;
     t = t+dt;          
     Vz=V(2,1);
     Rz=R(2,1); Rx=R(1,1);
     
     RZ(i,1)=Rz;  RX(i,1)=Rx; 
     VZ(i,1)=Vz;
     VX(i,1)=Vx;

     if (abs(Rz) > abs(Zmax))
        Zmax=Rz; 
     end
     if (Vz > Vmax)
         Vmax=Vz;    
     end
 end
 
 plot(RX,abs(RZ),'LineWidth',1.5) 
 xlabel ('Menzil[m]')
 ylabel ('Yükseklik[m]')
 title('Roket Yörünge Grafiği')
 legend('Roket')
 grid on
