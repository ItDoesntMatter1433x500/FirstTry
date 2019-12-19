clear
close
clc

icas(1,1)=0;
icas(1,2)=0;
ooo=1:500;
for i=3:502
    icas(1,i)=1-1.4*icas(1,i-1)*icas(1,i-1)+0.3*icas(1,i-2);
end
lol=icas(1,3:502);
clear icas;
icas(1,1:500)=lol(1:500);
clear lol;
icas(1,:)=icas(1,:)-min(icas(1,:));
icas(1,:)=icas(1,:)/(max(icas(1,:))/1.2);
icas(1,:)=icas(1,:)-0.1;
figure(222);
plot(ooo,icas(1,:));
ylim([-0.1 1.1]);
hold on;