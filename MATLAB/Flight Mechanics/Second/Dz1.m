%% Дано

Tz=365.25;
rz=1.496*10^8;
rp=rz*1.52;  %радиус планеты назначения
gamma=30;       %+30 для 1-10 номера по списку, -30 для 11-20.
muc=1.3249*10^11;
muz=3.9858*10^5;
Rdz=9.5*10^5;
h0=200;
Rz=6378;


%дата весеннего равноденствия
YYYYr=2018;
MMr=3;
DDr=22;

%дата старта (день рождения в текущем году)
YYYYX=2018;
MMX=6;
DDX=6;


%% Решение

%% I часть 

nz=360/Tz;

np=nz*sqrt(rz^3/rp^3);

% в зависимости от гамма и скорости обращения планеты назначения выбираем
% формулу (4а, 4б, 4в, 4г)

% gamma > 0; nz > np (4б)
k=1;
ta=fix((gamma+360*k)/(nz-np));
%


[DDa, MMa, YYYYa]=AvtK(DDr, MMr, YYYYr, ta);

k=2;
psia=nz*ta-360*k;

t0=VAK(DDX, MMX, YYYYX, DDr, MMr, YYYYr);

psi0=nz*t0;

psi0p=gamma+np*t0;

tau=ta-t0;

k=0;
phi=nz*ta-nz*t0-360*k;

%определяем с помощью Приложения 3

a=0.9*rz;
N=2;

% Приложение 2 (уточняем форму траектории и соответствующие формулы)

c=sqrt(rz^2+rp^2-2*rz*rp*cosd(phi));
s=(rp+rz+c)/2;

sap=sqrt(s/2/a); %син альфа пополам
alpha=2*asin(sap);

sbp=sqrt((s-c)/2/a); %син бета пополам
beta=2*asin(sbp);



%%уточняем a методом деления отрезка пополам

a1=0.6*rz;
a2=1.0*rz;
delt = 0.00001*rz;

while ( abs(a2-a1)/2 > 0.001*rz )
    alpha1=2*asin(sqrt(s/(a1+a2-delt)));
    beta1=2*asin(sqrt((s-c)/(a1+a2-delt)));
    tau1=sqrt(((a1+a2-delt)/2)^3/muc)*(2*pi*(N+1)-(alpha1-sin(alpha1))-(beta1-sin(beta1)));
    alpha2=2*asin(sqrt(s/(a1+a2+delt)));
    beta2=2*asin(sqrt((s-c)/(a1+a2+delt)));
    tau2=sqrt(((a1+a2+delt)/2)^3/muc)*(2*pi*(N+1)-(alpha2-sin(alpha2))-(beta2-sin(beta2)));
    if ( abs(tau1-tau*60*60*24) >= abs (tau2-tau*60*60*24) )
        a1=(a1+a2-delt)/2;
    else
        a2=(a1+a2+delt)/2;  
    end
end 

a=(a1+a2)/2;



%%пересчитываем (если значения сильно расходятся)

sap=sqrt(s/2/a);
alpha=2*asin(sap);

sbp=sqrt((s-c)/2/a);
beta=2*asin(sbp);

%продолжение расчёта параметров орбиты

% tau=sqrt(a^3/mu)*(2*360*3-(alpha-sin(alpha))-(beta-cos(beta))

p=4*a/c^2*(s-rz)*(s-rp)*(sin((alpha-beta)/2))^2;

eps=sqrt(1-p/a);
rpe=a*(1-eps);
raf=a*(1+eps);

b=a*sqrt(1-eps^2);

% выбираем tetaa и teta0, так чтобы угол tetaa-teta0 был равен phi

teta01=acosd(1/eps*(p/rz-1));
teta02=360-acosd(1/eps*(p/rz-1));
tetaa1=acosd(1/eps*(p/rp-1));
tetaa2=360-acosd(1/eps*(p/rp-1));
% tetaa1-teta01;
% tetaa1-teta02;
% tetaa2-teta01; %
% tetaa2-teta02;    

teta0=acosd(1/eps*(p/rz-1));
tetaa=360-acosd(1/eps*(p/rp-1));


%% II часть


vr0=sqrt(muc/p)*eps*sind(teta0);
vn0=sqrt(muc/p)*(1+eps*cosd(teta0));
v0=sqrt(vr0^2+vn0^2);
vkrz=sqrt(muc/rz);
vshn0=vn0-vkrz;
v0z=sqrt(vr0^2+vshn0^2);
vpiz=sqrt(v0z^2-2*muz*(1/Rdz-1/(Rz+h0)));
dv=vpiz-sqrt(muz/(Rz+h0));
az=(2/(Rz+h0)-vpiz^2/muz)^(-1);

epsz=(Rz+h0)/abs(az)+1;
bz=abs(az)*sqrt(epsz^2-1);
nuzp=atand(bz/abs(az));
nuzm=-atand(bz/abs(az));

% pz1=abs(az)*(epsz^2-1)
% pz2=((Rz+h0)*vpiz)^2/muz
% pz1=pz2 при правильных расчётах.

pz=abs(az)*(epsz^2-1);
teta0z=acosd(1/epsz*(pz/Rdz-1));
vr0z=sqrt(muz/pz)*epsz*sind(teta0z);
vn0z=sqrt(muz/pz)*(1+epsz*cosd(teta0z));
v0z=sqrt(vr0z^2+vn0z^2);

deltaz=asind(abs(vshn0)/v0z);
betaz=asind(vn0z/v0z);
alphaz=deltaz-betaz;

psi0z=psi0-alphaz;
psipiz=psi0z+teta0z;





