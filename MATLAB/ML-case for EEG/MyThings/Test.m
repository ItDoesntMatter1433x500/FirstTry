clear;
close;
clc;

icas(1,1)=0.1;
icas(1,2)=1-1.4*0.01;
ooo=1:500;
for i=3:500
    icas(1,i)=1-1.4*icas(1,i-1)*icas(1,i-1)+0.3*icas(1,i-2);
end
icas(1,:)=icas(1,:)-min(icas(1,:));
icas(1,:)=icas(1,:)/(max(icas(1,:))/1.2);
icas(1,:)=icas(1,:)-0.1;
figure(222);
plot(ooo,icas(1,:));
ylim([-0.1 1.1]);
hold on;


for i=1:489
    for j=1:10
        In(j,i)=icas(1,i-1+j);
    end
    Out(i)=icas(1,i+10);
end