clear all;
clc; 

r3 = 1;
e = 0.8126;
tet0 = 149.0*pi/180;
a = 0.893;
ae = 1.496*10^8; %радиус вращения Земли
sut = 60*60*24;  %число секунд в сутках
muc = 1.3249*10^11;
tau = 772;
psi30=75*pi/180;
n3=0.9856*pi/180;
np=0.5260*pi/180;
psiP0=70*pi/180;
rp=1.52;


E0=2*atan(sqrt((1-e)/(1+e))*tan(tet0/2));
E0_grad=E0*180/pi
tau0=sqrt((a*ae)^3/muc)*(E0-e*sin(E0))/sut
taui=tau0+tau/2
n=sqrt(muc/(a*ae)^3)
M=n*taui*sut
E=M+e*sin(M)/(1-e*cos(M))-0.5*((e*sin(M))/(1-e*cos(M)))^3;
E_grad=E*180/pi
teti=2*atan(sqrt((1+e)/(1-e))*tan(E/2))+2*pi;
teti_grad=teti*180/pi
psii=psi30+teti-tet0;
psii_grad=psii*180/pi
psi3i=psi30+n3*tau/2;
psi3i_grad=psi3i*180/pi
psiPi=psiP0+np*tau/2;
psiPi_grad=psiPi*180/pi
rimod=a*(1-e*cos(E))

r3i1=r3*cos(psi3i);
r3i2=r3*sin(psi3i);
r3i=[r3i1 ; r3i2;0]

rpi1=rp*cos(psiPi);
rpi2=rp*sin(psiPi);
rpi=[rpi1 ; rpi2;0]

ri1=rimod*cos(psii);
ri2=rimod*sin(psii);
ri=[ri1;ri2;0]

nc1=-cos(psii);
nc2=-sin(psii);
nc=[nc1;nc2;0]

modr3=sqrt((r3i1-ri1)^2+(r3i2-ri2)^2)
modrp=sqrt((rpi1-ri1)^2+(rpi2-ri2)^2)

m3=[(r3i1-ri1)/modr3;(r3i2-ri2)/modr3;0]

mp=[(rpi1-ri1)/modrp;(rpi2-ri2)/modrp;0]

%%%%%%%dlya zvezd:
asir=(100+(56/60))*pi/180;
dsir=(-16-(40/60))*pi/180;

aproc=(114+(24/60))*pi/180;
dproc=(5+(18/60))*pi/180;

aant=(246+(52/60))*pi/180;
dant=(-26-(22/60))*pi/180;

nsir=[cos(dsir)*cos(asir);cos(dsir)*sin(asir);sin(dsir)]

nproc=[cos(dproc)*cos(aproc);cos(dproc)*sin(aproc);sin(dproc)]

nant=[cos(dant)*cos(aant);cos(dant)*sin(aant);sin(dant)]

A=[1 0 0;0 cos(23.27*pi/180) sin(23.27*pi/180);0 -sin(23.27*pi/180) cos(23.27*pi/180)];

n1=A*nsir
n2=A*nproc
n3=A*nant

a1=acos(sum(nsir.*nc));
a1_grad=acos(sum(nsir.*nc))*180/pi
a2=acos(sum(nproc.*nc));
a2_grad=acos(sum(nproc.*nc))*180/pi
a3=acos(sum(nproc.*nc));
a3_grad=acos(sum(nant.*nc))*180/pi

modri=sqrt(ri(1)^2+ri(2)^2+ri(3)^2);
ncc=ri/modri
a0=acos(sum(mp.*nc));
a0_grad=acos(sum(mp.*nc))*180/pi

h1=(n1-sum(n1.*mp)*mp)/(modrp*1.496*10^8*sin(a1))
h2=(n2-sum(n2.*mp)*mp)/(modrp*1.496*10^8*sin(a2))
h3=(n3-sum(n3.*nc)*ncc)/(modri*1.496*10^8*sin(a3))
h4=(n3-sum(n3.*mp)*mp)/(modrp*1.496*10^8*sin(a3))
h5=(mp-sum(ncc.*mp)*ncc)/(modri*1.496*10^8*sin(a0))+(ncc-sum(ncc.*mp)*mp)/(modrp*1.496*10^8*sin(a0))

H=[h1';h2';h3']
Hh=[h1';h2';h3';h4';h5']

W=(4.84814*10^(-5))^2*inv(H'*H)
ro=sqrt(W(1,1)+W(2,2)+W(3,3))

Ww=(4.84814*10^(-5))^2*inv(Hh'*Hh)
roo=sqrt(Ww(1,1)+Ww(2,2)+Ww(3,3))
