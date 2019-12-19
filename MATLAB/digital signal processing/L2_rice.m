close all;
clear all;
clc;

A=imread('rice.png');
figure, imshow(A),title('Исходник');
C=graythresh(A);

B=im2bw(A,C);
figure, imshow(B),title('Бинаризация');

C1=100/255;
B1=im2bw(A,C1);
figure, imshow(B1),title('Бинаризация 2');

A1=A(1:128,:);
A2=A(129:end,:);
B1=im2bw(A1,graythresh(A1));
B2=im2bw(A2,graythresh(A2));

B=zeros(size(A));
B(1:128,:)=B1;
B(129:end,:)=B2;

figure, imshow(B),title('Локальная бинаризация');

I=ones(3);

opn=imopen(B,I);
figure, imshow(opn),title('Размыкание');

R=bwlabel(opn);
figure, imshow(R,[]),title('Покраска');
cc=imhist(uint8(R));
figure, plot(cc(2:end));

 
 RICE=zeros(size(R));
 RICE(find(R==66))=1;

 [x,y]=find(R==66);
 xx=round(mean(x));
 yy=round(mean(y));
 RICE=RICE.*255;
 RICE(xx-1:xx+1,yy-1:yy+1)=128;
 figure, imshow(uint8(RICE));
 
 
 Edge = bwperim(RICE);
 [y,x]=find(Edge==1);
 Grad=1:360;
 
 R=zeros(360,1);
 
 for i=1:length(x)
     dx=x(i)-xx;
     dy=y(i)-yy;
     p(i)=sqrt(dx*dx+dy*dy);
     ug(i)=atan2(dy,dx)+180+1;
     f=round(ug(i));
     R(i) = max([p(i),R(i)]);
 end
 
 figure, plot(ug,p);
figure, plot(R);
% figure, subplot(10,10,1);
% for i=1:max(max(R))
% 
% RICE=zeros(size(R));
% RICE(find(R==i))=1;
% subplot(10,10,i);
% imshow(RICE);
% end