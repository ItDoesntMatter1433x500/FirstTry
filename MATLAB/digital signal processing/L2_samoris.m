close all;
clear all;
clc;

A=imread('Shnyaga.png');
figure, imshow(A),title('Исходник');
C=graythresh(A);

B=im2bw(A,0.33);
B=imcomplement(B);
figure, imshow(B),title('Бинаризация');

I=ones(3);

C=imdilate(B,I);
figure, imshow(C),title('Имдилате');

D=imerode(B,I);
figure, imshow(D),title('Эрозия');

E=imerode(B,I);
E=imdilate(E,I);
figure, imshow(E),title('Эрозия + дилатация');

E=imdilate(B,I);
E=imerode(E,I);
figure, imshow(E),title('дилатация + эррозия');

opn=imopen(B,I);
figure, imshow(opn),title('Размыкание');

cll=imclose(B,I);
figure, imshow(cll),title('Замыкание');

Deletee=bwareaopen(opn,1500);
figure, imshow(Deletee),title('Удаление');

Deletee=imclose(Deletee,I);
figure, imshow(Deletee),title('Замыкание del');


R=bwlabel(Deletee);
figure, imshow(R,[]),title('Замыкание');


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