function F = DZ1(x)

alf=x(1);
P=x(2);
delta=x(3);
    
m=200;
g=9.81;
ro=0.91;
V0=40;
S=3.5;
Cxa0=0.045;
A=0.09;
Cya0=0.33;
Cyaa=0.087;
Cyaf=0.022;
theta=5;
phi=5;
dxf=0.39;
mz0=0.25;
mzd=-0.0339;
mzom=-25;

Cya=Cya0+Cyaa*alf*180/pi+Cyaf*phi;
Cxa=Cxa0+A*(Cya0+Cyaa*alf*180/pi)^2;
Xa=ro*V0*V0*S*Cxa/2;
Ya=ro*V0*V0*S*Cya/2;


F=[P*cos(alf)-Xa-m*g*sin(theta*pi/180);
   P*sin(alf)+Ya-g*m*cos(theta*pi/180);
   dxf*(Cya0+Cyaa*alf*180/pi+Cyaf*phi)*cos(alf)-mz0-mzom*0-mzd*delta];
end