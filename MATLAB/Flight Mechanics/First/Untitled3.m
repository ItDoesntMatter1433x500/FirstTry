clear all;
close all;
clc;

syms alf P l;
m=200;
g=9.81;
ro=0.91;
V0=40;
S=3.5;
Cxa0=0.045;
A=0.09;
Cya0=0.33;
Cyaa=0.087*180/pi;
Cyaf=0.022;
theta=5;
phi=10;
dxf=0.39;
mz0=0.25;
mzd=-0.0339;
mzom=-25;
ba=0.55;
P=353.1;
alf=2.4179*pi/180;
bet=-1.3748*pi/180;


Cya=Cya0+Cyaa*alf+Cyaf*phi;
Cxa=Cxa0+A*(Cya0+Cyaa*alf)^2;
Xa=ro*V0*V0*S*Cxa/2;
Ya=ro*V0*V0*S*Cya/2;
mz=mz0-dxf*Cya+mzd*bet+mzom*0;


A=[-1.6104 1.6317 0; 0 0 1; 21.8 -21.8 -280.3];
L=[l 0 0; 0 l 0; 0 0 l];
AA=L-A;
det(AA)
solve(det(AA),l)
% % Aa=solve(ro*V0*V0*S*Cya/2-m*g*cos(theta*pi/180)==0,alf)
% % % Aa=Aa+0.01;
% % solve(P*cos(Aa)-ro*V0*V0*S*Cxa0+A*((Cya0+Cyaa*Aa*180/pi)^2)/2-m*g*sin(theta*pi/180),P)
% % delta=dxf*Cya0*cos(alf)-mzom*omz-mz0
% % % F=[y*cos(x)-Xa-m*g*sin(theta);
% % %    y*sin(x)+Ya-g*m*cos(theta)];