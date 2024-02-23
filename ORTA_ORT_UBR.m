 clc;  clear;  close all;
%Başlangıç koşul değerleri tanımlandı.
 theta=70;            
 V_0=100;     
 t=0;    dt=0.01;
 Zmax=0; Vmax=0;
 Ax=0;   Az=9.801;
 Rx=0;  Rz=0;

% x,z üzerindeki sıfır ivme matrisi oluşturuldu ve ilk değerleri atandı.
 A=zeros(1,1);       
 A(1,1)=Ax;             
 A(2,1)=Az;

 % x,z üzerindeki sıfır konum matrisi oluşturuldu. Başta roket yerde olduğu için 
% ilk değerleri atandı.
 R=zeros(1,1);
 R(1,1)=Rx;             
 R(2,1)=Rz;
 
% Hız sıfır matrisi oluşturuldu ve uçuş yolu açısına göre ilk x,z hız
% vektörleri hesaplanarak matrise atandı.
 V=zeros(1,1);
 V(1,1)=V_0*cosd(theta);
 V(2,1)=-V_0*sind(theta);   %Uçuş -z ekseninde gerçekleştiği için
                            % (-) ile çarpıldı   
 Vz=V(2,1);
 Vx=V(1,1);
 i=0;      
 % İlk konum değerine göre döngü içersine girilip konum yatay eksende 0 
 % değerine ulaştığında döngü bitirilir ve toplam konum, hız ve  ivme
 % dizileri elde edilir.
 while (Rz<=0)
 % Euler yöntemi yardımıyla hız ve konum hesaplamaları yapıldı.
     i=i+1;             
     V = V + A*dt;
     R = R + V*dt;
     t = t+dt;          
     Vz=V(2,1);
     Rz=R(2,1); Rx=R(1,1);
     % Alınan hız ve konum bilgileri dinamik dizide tutuldu.
     RZ(i,1)=Rz;  RX(i,1)=Rx; 
     VZ(i,1)=Vz;

     if (abs(Rz) > abs(Zmax))
        Zmax=Rz; % Apogee nok. hesaplandı.
     end
     if (Vz > Vmax)
         Vmax=Vz;    % Max hız hesaplandı.
     end
 end
 
 plot(RX,abs(RZ),'b') % Konum-zaman grafiği çizildi.
 xlabel ('Menzil[m]')
 ylabel ('Yükseklik[m]')
 title('Yörünge Grafiği')
 grid on
