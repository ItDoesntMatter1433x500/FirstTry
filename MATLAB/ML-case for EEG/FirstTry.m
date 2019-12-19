% % Brest-Algorythm

clear;
close all;
clc;

tic;
% % Loading file

f=fopen('C:\YandexDisk\Project\Signals\1.txt');

all = fscanf(f,'%f');

% % Split signals

for i=0:fix(length(all)/16)-1
    
   s(1,i+1)=all(16*i+1);
   s(2,i+1)=all(16*i+2);
   s(3,i+1)=all(16*i+3);
   s(4,i+1)=all(16*i+4);
   s(5,i+1)=all(16*i+5);
   s(6,i+1)=all(16*i+6);
   s(7,i+1)=all(16*i+7);
   s(8,i+1)=all(16*i+8);
   s(9,i+1)=all(16*i+9);
   s(10,i+1)=all(16*i+10);
   s(11,i+1)=all(16*i+11);
   s(12,i+1)=all(16*i+12);
   s(13,i+1)=all(16*i+13);
   s(14,i+1)=all(16*i+14);
   s(15,i+1)=all(16*i+15);
   s(16,i+1)=all(16*i+16);
   
end

% FastICA

Sf=fastica(s);

s1=Sf(1,:);     % % Pervii

% % Normalization

s1=s1-min(minmax(s1));
s1=s1/max(minmax(s1));

% % ----

f=true; % % Flag of end of signal

q=0;
koord(1)=1;

while f
q=q+1;
clear P1 In Out;   


for i=koord(q):koord(q)+59      %
    for j=1:10                  %
        In(j,i)=s1(i-1+j);      %   Viborka
    end                         %
    Out(i)=s1(i+10);            %
end

% %  Neural Network
P1=newff(minmax(In),[5,1],{'tansig','purelin'});
P1.performFcn = 'sse';
P1.trainParam.goal = 0.001;
P1.trainParam.epochs = 5000;
P1=train(P1,In,Out);

SS(q)={P1};

z=true;

while z
    
    x=sim(P1,[s1(i); s1(i+1); s1(i+2); s1(i+3); s1(i+4); s1(i+5); s1(i+6); s1(i+7); s1(i+8); s1(i+9)]);

    if abs(x-s1(i+10))>0.1
        
        z=false;
        koord(q+1)=i+9;
    
    else
        
        i=i+1;
    
        if i>length(s1)-10;
            koord(q+1)=i+9;
            break;
        end
    
    end

end

if length(s1)-koord(length(koord))<70
    
    f=false;
    
end

% % % --------------------
% % % --------------------
% % % Plot
clear n1 or1;
% figure(q);

for i=koord(q):koord(q+1)-10
   
    n1(i-koord(q)+1)=sim(P1,[s1(i); s1(i+1); s1(i+2); s1(i+3); s1(i+4); s1(i+5); s1(i+6); s1(i+7); s1(i+8); s1(i+9)]);
    or1(i-koord(q)+1)=s1(i+10);
end

t1=koord(q):koord(q+1)-10;
plot(t1,or1,'Color','b','LineWidth',0.1);
hold on;
plot(t1,n1,'Color','r','LineWidth',0.1);
hold on;
plot([koord(q+1)-10 koord(q+1)-10],[0 1],'LineWidth',0.2,'Color','k');
hold on;
% xlim([koord(q) koord(q+1)-10]);
grid on;

% legend('Signal','Perceptron','location','best');
% % % --------------------
% % % --------------------

dlina(q)=koord(q+1)-koord(q)+1;

end


toc;

% % ???? feedforward - newff https://naukovedenie.ru/PDF/94TVN214.pdf +
% http://window.edu.ru/resource/149/77149/files/%D0%9C%D0%BE%D0%B4%D0%B5%D0%BB%D0%B8%D1%80%D0%BE%D0%B2%D0%B0%D0%BD%D0%B8%D0%B5%20%D1%81%D0%B5%D1%82%D0%B5%D0%B9%20%D0%9B%D0%A0.pdf
% ??




% figure(1);
% 
% t=0:11519;
% t=t*0.004;
% 
% for i=1:8
% subplot(8,1,i);
% plot(t,s(i,:));
% xlim([0 t(length(t))]);
% grid on;
% end
% 
% sss=fastica(s);
% 
% figure(2);
% 
% for i=1:8
% subplot(8,1,i);
% plot(t,sss(i,:));
% xlim([0 t(length(t))]);
% grid on;
% end
