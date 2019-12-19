clear all
I=imresize(imread('A.jpeg'),0.25);
I0=I;
% Ig=rgb2gray(I);
% Ig2=uint8(double(I(:,:,1))*0.3333+double(I(:,:,2))*0.3333+double(I(:,:,3))*0.3333);
% figure 
% subplot(2,2,1)
% imshow(I)
% subplot(2,2,2)
% imshow(Ig)
% subplot(2,2,3)
% imshow(Ig2)
%In=Is*k+b
%0=k*34+b
%255=k*255+b
% [y x]=size(I);
% for yy=1:y
%     for xx=1:x
%         if I(yy,xx)<80
%            I(yy,xx)=80;
%         end;
%         if I(yy,xx)>180
%            I(yy,xx)=180;
%         end;
%     end;
% end;
%             
% mi=double(min(min(I)));
% ma=double(max(max(I)));
% k=255/(ma-mi);
% b=0-mi*k;
% In=uint8(double(I)*k+b);
R=I(:,:,1);
G=I(:,:,2);
B=I(:,:,3);
Rn=histeq(R);
Gn=histeq(G);
Bn=histeq(B);
In(:,:,1)=Rn;
In(:,:,2)=Gn;
In(:,:,3)=Bn;
h0=imhist(I0);
h1=imhist(In);
% figure 
% subplot(1,2,1)
% imshow(I0)
% subplot(1,2,2)
% imshow(In)
% 
figure 
subplot(3,1,1)
plot(imhist(R))
subplot(3,1,2)
plot(imhist(G))
subplot(3,1,3)
plot(imhist(B))

