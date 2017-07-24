                                                      
%               ,--.                                         
%             ,--.'|   ,---,       .--.--.      ,---,        
%         ,--,:  : |  '  .' \     /  /    '.   '  .' \       
%      ,`--.'`|  ' : /  ;    '.  |  :  /`. /  /  ;    '.     
%      |   :  :  | |:  :       \ ;  |  |--`  :  :       \    
%      :   |   \ | ::  |   /\   \|  :  ;_    :  |   /\   \   
%      |   : '  '; ||  :  ' ;.   :\  \    `. |  :  ' ;.   :  
%      '   ' ;.    ;|  |  ;/  \   \`----.   \|  |  ;/  \   \ 
%      |   | | \   |'  :  | \  \ ,'__ \  \  |'  :  | \  \ ,' 
%      '   : |  ; .'|  |  '  '--' /  /`--'  /|  |  '  '--'   
%      |   | '`--'  |  :  :      '--'.     / |  :  :         
%      '   : |      |  | ,'        `--'---'  |  | ,'         
%      ;   |.'      `--''                    `--''           
%      '---'                                                 
                                                
%These are some constants
  Gc=32.2;
  y=1.2;
  R=65;
  Tc=6322;
%Calculating characteristic velocity
  CharV=(sqrt(Gc*y*R*Tc))/( y* (sqrt( (2/(y+1) )^((y+1)/(y-1)) ) ) );

%%Calcualting C at sea level
%This value was obtained from a graph an approximation
  Cvac=1.6;
%The value "e" is Ae/At
  e=5.28;
  Pa=14.7;
  Pc=500;
  Ct=Cvac-((e*Pa)/Pc);

%Now calculating the specific impulse
  Is=(CharV*Ct)/Gc;
%Calculating the throat area and diameter
  Ft=1000;
  At=Ft/(Ct*Pc);
  Dt=sqrt((4/pi)*At);
  Rt=Dt/2;

%Calculating the exhaust diameter
  De=sqrt(e)*Dt;
  Re=De/2;
%Now finding the chamber volume
%We will use these values but these are subject to changing drastically depending on your desired thrust. 
  L=45;
  Vc=L*At;

%%%%%Finding the chamber diameter%%%%
%We are going to use a convergent half angle of 20 degrees and constatn
%area ratio of e0=1.6 and circular arc radius of Rarc=1.5Rt
%Finding the Chamber diameter
  e0=1.6;
  Dc=sqrt(e0)*Dt;
  Rc=Dc/2; 

%Finding the convergent cone length
  Rarc=1.5*Rt;
  theta=20;
  CCL=  ((Rt*(sqrt(e0)-1))  +  (Rarc*(secd(20)-1)))/(tand(20));

%Calcualting the approximate convergent cone volume
  CCVol=(pi/3)*CCL*( (Rc^2)+(Rt^2) +(Rc*Rt) );

%Caluclating the required volume for cylindrical chamber section
  CCS=Vc-CCVol;

%Calculating the required legnth for cylindrical chamber section
  LCC=CCS/(1.6*At);

%Calculating the distance from the injector face to throat
  DFT=LCC+CCL;

%Calculating the nozzle contour downstream of the throat (The radius)
%Moreso calculating the NOZZLE LENGTH
  Ln= ((Rt*(sqrt(e)-1))  +  ((Rt*.328)*(secd(15)-1)))/(tand(15));

%Calculating some more geometrical values that will be useful for mocking up the chamber.
%These theta values where found on a graph
  thetN=26;
  thetE=14;
  Nt=.328*Rt*sind(thetN);
  Na=Rt+(0.328*Rt)*(1-cosd(thetN));
  Et=Ln;
  Ea=Re;


