close all;
clear all;
clc;

A=imread('Shnyaga.png');
figure, imshow(A),title('��������');
C=graythresh(A);

B=im2bw(A,0.33);
B=imcomplement(B);
figure, imshow(B),title('�����������');

I=ones(3);

C=imdilate(B,I);
figure, imshow(C),title('��������');

D=imerode(B,I);
figure, imshow(D),title('������');

E=imerode(B,I);
E=imdilate(E,I);
figure, imshow(E),title('������ + ���������');

E=imdilate(B,I);
E=imerode(E,I);
figure, imshow(E),title('��������� + �������');

opn=imopen(B,I);
figure, imshow(opn),title('����������');

cll=imclose(B,I);
figure, imshow(cll),title('���������');

Deletee=bwareaopen(opn,1500);
figure, imshow(Deletee),title('��������');

Deletee=imclose(Deletee,I);
figure, imshow(Deletee),title('��������� del');


R=bwlabel(Deletee);
figure, imshow(R,[]),title('���������');


D1=zeros(size(R));
D1(find(R==1))=1;
figure, imshow(D1);

D2=zeros(size(R));
D2(find(R==2))=1;
figure, imshow(D2);

D3=zeros(size(R));
D3(find(R==3))=1;
figure, imshow(D3);

D4=zeros(size(R));
D4(find(R==4))=1;
figure, imshow(D4);

edg1=bwperim(D1);
figure, imshow(edg1);

edg2=bwperim(D2);
figure, imshow(edg2);

edg3=bwperim(D3);
figure, imshow(edg3);

edg4=bwperim(D4);
figure, imshow(edg4);