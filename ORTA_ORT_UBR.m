 clc;  clear;  close all;
%Başlangıç koşul değerleri tanımlama
 theta=70;            
 V_0=100;     
 t=0;    dt=0.01;
 Zmax=0; Vmax=0;
 Ax=0;   Az=9.801;
%Hız, Konum, İvme denklerimi için sıfır matrisi- 
% tanımlanarak ilk değerleri atandı
 A=zeros(1,1);       
 A(1,1)=Ax;             
 A(2,1)=Az;

 R=[0;0];
 Rz=R(2,1);
 Rx=R(1,1);

 V=zeros(1,1);
 V(1,1)=V_0*cosd(theta);
 V(2,1)=-V_0*sind(theta);   %Uçuş -z ekseninde gerçekleştiği için
                            % (-) ile çarpıldı   
 Vz=V(2,1);
 Vx=V(1,1);
 i=0;      
 %Roket yörüngesini hesaplayabilmek için Euler Metodu ile Konum 
 %ve Hız değerleri hesaplanarak dinamik bir dizi içerisine atama yapıldı
 while (Vz<0 || Rz<=0)  
     i=i+1;             
     V = V + A*dt;
     R = R + V*dt;
     t = t+dt;          
     Vz=V(2,1);
     Rz=R(2,1); Rx=R(1,1);
     RZ(i,1)=Rz;  RX(i,1)=Rx; 
     VZ(i,1)=Vz;
     if (abs(Rz) > abs(Zmax))
        Zmax=Rz;
     end
     if (Vz > Vmax)
        Vmax=Vz;
     end
 end
 plot(RX,abs(RZ),'b')   
 xlabel ('Menzil[m]')
 ylabel ('Yükseklik[m]')
 title('Yörünge Grafiği')
 grid on
