% for i=1:100
%     x(i)=0;
%     y(i)=0;
% end;
% for i=101:300
%     x(i)=1;
%     y(i)=(i-101)/200;
% end;
% for i=301:400
%     x(i)=0;
%     y(i)=0;
% end;
% c=conv(x,y);
% xc=xcorr(x,y);
% axc=xcorr(x,x);
% figure
% subplot(5,1,1)
% plot(x)
% title('»сходный сигнал')
% subplot(5,1,2)
% plot(y)
% title('ядро свертки')
% subplot(5,1,3)
% plot(c)
% title('—вертка')
% subplot(5,1,4)
% plot(xc)
% title(' оррел€ци€')
% subplot(5,1,5)
% plot(axc)
% title('јвтокоррел€ци€')
clear all
I=imread('im.jpg');
Ig=rgb2gray(I);
h=fspecial('gaussian',16);
Idouble=double(Ig);
If=uint8(conv2(Idouble,h));
If2=imcrop(If,[8 8 228 231]);
figure
subplot(2,1,1)
imshow(Ig)
subplot(2,1,2)
imshow(If2)