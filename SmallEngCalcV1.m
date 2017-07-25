

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

%Now combustion chamber calculations, this length is changed for different performance results it is chosen based on 
% how long you want (or need so as not to casue an explosion) your propellant to be in the combustion chamber.
  L=100;
  Vc=L*At;
%The multiplicative factor below works well for small designs, not excalty for larger scale rockets.
  Dc=5*Dt;
  Ac=(pi*(Dc^2))/4;

%Calculating the combustion chamber length
  %This first value is using a calculated factor of 1.1 for gasoline and gaseous oxygen.
  Lc=Vc/(1.1*Ac)
  %This was another calcualtion for combustion chamber length from a logarithmic plot that gives better results.
  Lc2=exp((.029*log((Dt)^2)) + (.47*log(Dt)) +1.94);

%Crude calcualtion of chamer wall thickness knowing the working stress of copper.
  tw=(Pc*Dc)/16000;

%Printing out some variables.  
  Dt
  De
  Dc
  Lc2;

%These are the hypotenuse lengths calculated for when I am doing CAD and need to get the arc of the diverging nozzle.
%These are for the nozzle choke.
  z1=(Dc-Dt)/2;
  Bth=z1/(sind(60))
  z2=(De-Dt)/2;
  Bex=z2/(sind(15))





