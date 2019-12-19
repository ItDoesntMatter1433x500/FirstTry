clc;
clear all;
close all;

%Дано
Jx=600;
Jy=400;
Jz=800;
myu=3.968*10^5;
R=6370;
teta0=3;
gamma0=4;
psi0=2;
h=750;

nyu=vpa(sqrt(myu/(R+h)^3),4)

kgamma=vpa(4*nyu^2*(Jz-Jy),5)
H=vpa(nyu*(Jx+Jy-Jz),5)
kteta=vpa(3*nyu^2*(Jx-Jy), 5)
kpsi=vpa(nyu^2*(Jz-Jx),5)

a0=vpa(Jx*Jy,4)
a2=vpa(H^2+Jx*kpsi+Jy*kgamma,4)
a4=vpa(kpsi*kgamma,4)
vpa(a2^2-4*a0*a4,4)
s1=vpa((-a2+sqrt(a2^2-4*a0*a4))/(2*a0),4)
s2=vpa((-a2-sqrt(a2^2-4*a0*a4))/(2*a0),4)
s11=vpa(sqrt(s1),4)
s12=vpa(-sqrt(s1),4)
s21=vpa(sqrt(s2),4)
s22=vpa(-sqrt(s2),4)
wteta=vpa(nyu*sqrt(3*(Jx-Jy)/Jz),4)
Tteta=vpa(2*pi/wteta,5)
wgamma=vpa(sqrt(kgamma/Jx),4)
wpsi=vpa(sqrt(kpsi/Jy),4)
Tgamma=vpa(2*pi/wgamma,5)
Tpsi=vpa(2*pi/wpsi,5)


Dx=0.5;
Dy=0.5;

a0=Jx*Jy
a1=Jy*Dx+Jx*Dy
a2=H^2+Jx*kpsi+Jy*kgamma+Dx*Dy
a3=Dx*kpsi+Dy*kgamma
a4=kpsi*kgamma
uslovie=a3*(a1*a2-a0*a3)-a1^2*a4

[t,x]=ode45(@fun1,[0 20000],[teta0 0]);
figure;
plot(t,x(:,1));
grid on;
figure;
plot(t,x(:,2));
grid on;

[t,y]=ode45(@fun2,[0 20000],[gamma0 0 psi0 0]);
figure;
plot(t,y(:,1));
grid on;
figure;
plot(t,y(:,2));
grid on;
figure;
plot(t,y(:,3));
grid on;
figure;
plot(t,y(:,4));
grid on;

[t,z]=ode45(@fun3,[0 20000],[gamma0 0 psi0 0]);
figure;
plot(t,z(:,1));
grid on;
figure;
plot(t,z(:,2));
grid on;
figure;
plot(t,z(:,3));
grid on;
figure;
plot(t,z(:,4));
grid on;

