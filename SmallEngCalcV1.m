
%This code is to automatcially calculate design parameter for a De Laval
%nozzle ranging from 0 to 100 lb of thrust


% Assume we are using gaseous oxygen and gasoline
% Pc is at 500 psi and Tc=5862 deg F
%Isp,sec =279
%Mixture ratio r= 2.5
% y=1.2

%Calculating the total mass flow rate
F=75;
Isp=279;
wt=F/Isp;
%This is the mass flow rate for thevoxidizer and fuel
r=2.5;
wf=wt/(r+1);
w0=wt-wf;
%This is the throat temperature in rankine.
Tc=5862;
Tt=(Tc+460)*.909;
%This is the pressure at the throat.
Pc=500;
Pt=(.564)*Pc;
% We will now calcualte the nozzle cross sectional sruface area
y=1.2;
Gc=32.2;
R=65;
% Cross sectional area and diameter of the throat.
At=(wt/Pt)*sqrt((R*Tt)/(y*Gc));
Dt=sqrt((4*At)/pi);
%Important ratio to have, and calcualting the exhause area and diameter.
ae=5.28;
Ae=(ae)*At;
De=sqrt((4*Ae)/pi);
%Now combustion chamber calculations
L=100;
Vc=L*At;
%This is a configurable parameter
Dc=5*Dt;
Ac=(pi*(Dc^2))/4;
%Calculating the combustion chamber length
Lc=Vc/(1.1*Ac)
Lc2=exp((.029*log((Dt)^2)) + (.47*log(Dt)) +1.94);
%Calculating the wall thickness
tw=(Pc*Dc)/16000;
Dt
De
Dc
Lc2;
%These are the hypotenuse lengths calculated
%These are for the nozzle choke
z1=(Dc-Dt)/2;
Bth=z1/(sind(60))
z2=(De-Dt)/2;
Bex=z2/(sind(15))





