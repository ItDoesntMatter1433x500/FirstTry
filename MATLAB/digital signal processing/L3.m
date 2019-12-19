close all;
clear all;
clc;
%Есть кадр карты, нужно найти где расположен кусок West на ней
A=imread('ConcordOrthoPhoto.png');
figure, imshow(A);
[h1,w1]=size(A);
FA=fft2(A);
Ga=imgradient(A);
FGa=fft2(Ga);
Ca=edge(A,'Sobel');
FCa=fft2(Ca);

res = [0.95,0.85,0.7];
angle = [5,10,15];
noise=0:0.1:1;

for i1=1:length(noise)
   
B=imnoise(imread('WestConcordOrthoPhoto.png'),'Salt & pepper',noise(i1));


% figure,imshow(B);
[h2,w2]=size(B);

FB=fft2(B,h1,w1);
FB1=conj(FB);
FR=FA.*FB1;
FR=FR./abs(FR);
R=ifft2(FR);

% figure, imshow(R,[]),title('Фурье');

m=max(max(R));
f=true;

for i=1:w1-1
    for j=1:h1-1
        if R(i,j)==m
            f=false;
            break;
        end
    end
    if f
    else
        break;
        
    end
end

XbestF(i1)=i;
YbestF(i1)=j;

A1=A;
A1(i:i+h2-1,j:j+w2-1)=B+80;
% figure, imshow(A1,[]), title('Фазовый');
%Градиентовый метод
Gb=imgradient(B);
% figure, imshow(Ga,[]);
FB=fft2(Gb,h1,w1);
FB1=conj(FB);
FR=FA.*FB1;
% FR=FR./abs(FR);
R=ifft2(FR);

m=max(max(R));
f=true;

for i=1:w1
    for j=1:h1
        if R(i,j)==m
            f=false;
            break;
        end
    end
    if f
    else
        break;
        
    end
end

XbestG(i1)=i;
YbestG(i1)=j;

A1=A;
A1(i:i+h2-1,j:j+w2-1)=B+80;
% figure, imshow(A1,[]), title('Градиент');

Cb=edge(B,'Sobel');
% figure, imshow(Ca,[]);
FB=fft2(Cb,h1,w1);
FB1=conj(FB);
FR=FA.*FB1;
% FR=FR./abs(FR);
R=ifft2(FR);

m=max(max(R));
f=true;

for i=1:w1
    for j=1:h1
        if R(i,j)==m
            f=false;
            break;
        end
    end
    if f
    else
        break;
        
    end
end

XbestK(i1)=i;
YbestK(i1)=j;

A1=A;
A1(i:i+h2-1,j:j+w2-1)=B+80;
% figure, imshow(A1,[]), title('Контурный');
end

figure, subplot(3,2,1), plot(noise,XbestF),title('X от шума в Фазовом');
subplot(3,2,2), plot(noise,XbestF),title('Y от шума в Фазовом');
subplot(3,2,3), plot(noise,XbestG),title('X от шума в градиентом');
subplot(3,2,4), plot(noise,XbestG),title('Y от шума в градиентом');
subplot(3,2,5), plot(noise,XbestK),title('X от шума в контурном');
subplot(3,2,6), plot(noise,XbestK),title('Y от шума в контурном');