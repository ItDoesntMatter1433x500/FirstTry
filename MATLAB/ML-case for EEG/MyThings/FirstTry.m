% % Brest-Algorythm

clear;
close;
clc;
AAA=[];
% Constants

N=70;
m=10;



tic;

% % % % % % Loading file
% % % 
% % % [data, head] = lab_read_edf('C:\YandexDisk\Project\Signals\4.edf');
% % % 
% % % head.hdr.intro='0                                                                                                                                                                       22.01.1816.14.566400                                                45      1       24  ';
% % % head.hdr.channels=22;
% % % head.hdr.channelname(17,:)='Ss1             ';
% % % head.hdr.channelname(18,:)='Ss2             ';
% % % head.hdr.channelname(19,:)='Ss3             ';
% % % head.hdr.channelname(20,:)='Ss4             ';
% % % head.hdr.channelname(21,:)='Ss5             ';
% % % head.hdr.channelname(22,:)='Ss6             ';
% % % head.hdr.channelname(23:length(head.hdr.channelname(:,1)),:)=[];
% % % head.hdr.transducer(17,:)='EEG Ss1                                                                         ';
% % % head.hdr.transducer(18,:)='EEG Ss2                                                                         ';
% % % head.hdr.transducer(19,:)='EEG Ss3                                                                         ';
% % % head.hdr.transducer(20,:)='EEG Ss4                                                                         ';
% % % head.hdr.transducer(21,:)='EEG Ss5                                                                         ';
% % % head.hdr.transducer(22,:)='EEG Ss6                                                                         ';
% % % head.hdr.transducer(23:length(head.hdr.transducer(:,1)),:)=[];
% % % head.hdr.physdime(23:length(head.hdr.physdime(:,1)),:)=[];
% % % head.hdr.physmin(17:22,:)=2;
% % % head.hdr.physmin(23:length(head.hdr.physmin(:,1)),:)=[];
% % % head.hdr.physmax(17:22,:)=-1;
% % % head.hdr.physmax(23:length(head.hdr.physmax(:,1)),:)=[];
% % % head.hdr.digimin(23:length(head.hdr.digimin(:,1)),:)=[];
% % % head.hdr.digimax(23:length(head.hdr.digimax(:,1)),:)=[];
% % % head.hdr.prefilt(23:length(head.hdr.prefilt(:,1)),:)=[];
% % % head.hdr.numbersperrecord(23:length(head.hdr.numbersperrecord(:,1)),:)=[];
% % % head.numchannels=22;
% % % head.channels(17,:)='Ss1             ';
% % % head.channels(18,:)='Ss2             ';
% % % head.channels(19,:)='Ss3             ';
% % % head.channels(20,:)='Ss4             ';
% % % head.channels(21,:)='Ss5             ';
% % % head.channels(22,:)='Ss6             ';
% % % head.channels(23:length(head.channels(:,1)),:)=[];
% % % head.ecg_ch=22;
% % % head.numdatachannels=22;
% % % data(17:length(data(:,1)),:)=[];
% % % 
% % % % % % Loading file
% % % % clear vse f;
% % % % % % Split ----------- FastICA ------------ Normalization
% % % 
% % % s11=vertcat(data(12,:),data(14,:),data(16,:));
% % % s1=fastica(s11,'g','skew','Stabilization','on');
% % % data(17,:)=s1(1,:);
% % % % data(17,:)=data(17,:)-min(data(17,:));
% % % % data(17,:)=data(17,:)/(max(data(17,:))/1.2);
% % % % data(17,:)=data(17,:)-0.1;
% % % clear s11 s1;
% % % 
% % % 
% % % s22=vertcat(data(2,:),data(4,:),data(6,:));
% % % s2=fastica(s22,'g','skew','Stabilization','on');
% % % data(18,:)=s2(1,:);
% % % % data(18,:)=data(18,:)-min(data(18,:));
% % % % data(18,:)=data(18,:)/(max(data(18,:))/1.2);
% % % % data(18,:)=data(18,:)-0.1;
% % % clear s22 s2;
% % % 
% % % s33=vertcat(data(6,:),data(8,:),data(10,:));
% % % s3=fastica(s33,'g','skew','Stabilization','on');
% % % data(19,:)=s3(1,:);
% % % % data(19,:)=data(19,:)-min(data(19,:));
% % % % data(19,:)=data(19,:)/(max(data(19,:))/1.2);
% % % % data(19,:)=data(19,:)-0.1;
% % % clear s33 s3;
% % % 
% % % s44=vertcat(data(1,:),data(3,:),data(5,:));
% % % s4=fastica(s44,'g','skew','Stabilization','on');
% % % data(20,:)=s4(1,:);
% % % % data(20,:)=data(20,:)-min(data(20,:));
% % % % data(20,:)=data(20,:)/(max(data(20,:))/1.2);
% % % % data(20,:)=data(20,:)-0.1;
% % % clear s44 s4;
% % % 
% % % s55=vertcat(data(5,:),data(7,:),data(9,:));
% % % s5=fastica(s55,'g','skew','Stabilization','on');
% % % data(21,:)=s5(1,:);
% % % % data(21,:)=data(21,:)-min(data(21,:));
% % % % data(21,:)=data(21,:)/(max(data(21,:))/1.2);
% % % % data(21,:)=data(21,:)-0.1;
% % % clear s55 s5;
% % % 
% % % s66=vertcat(data(11,:),data(13,:),data(15,:));
% % % s6=fastica(s66,'g','skew','Stabilization','on');
% % % data(22,:)=s6(1,:);
% % % % data(22,:)=data(22,:)-min(data(22,:));
% % % % data(22,:)=data(22,:)/(max(data(22,:))/1.2);
% % % % data(22,:)=data(22,:)-0.1;
% % % clear s66 s6;
% % % 
% % % data(17:22,:)=data(17:22,:)*100;
% % % 
% % % % lab_write_edf('C:\YandexDisk\Project\Signals\4f.edf',data,head);
% % % 
% % % icas = data(17:22,:);
% % % 
% % % % vse = fscanf(f,'%f');
% % % % 
% % % % % % Split signals
% % % % 
% % % % for i=0:fix(length(vse)/16)-1
% % % %     
% % % %    s(1,i+1)=vse(16*i+1);
% % % %    s(2,i+1)=vse(16*i+2);
% % % %    s(3,i+1)=vse(16*i+3);
% % % %    s(4,i+1)=vse(16*i+4);
% % % %    s(5,i+1)=vse(16*i+5);
% % % %    s(6,i+1)=vse(16*i+6);
% % % %    s(7,i+1)=vse(16*i+7);
% % % %    s(8,i+1)=vse(16*i+8);
% % % %    s(9,i+1)=vse(16*i+9);
% % % %    s(10,i+1)=vse(16*i+10);
% % % %    s(11,i+1)=vse(16*i+11);
% % % %    s(12,i+1)=vse(16*i+12);
% % % %    s(13,i+1)=vse(16*i+13);
% % % %    s(14,i+1)=vse(16*i+14);
% % % %    s(15,i+1)=vse(16*i+15);
% % % %    s(16,i+1)=vse(16*i+16);
% % % %    
% % % % end
% % % % 
% % % % % clear vse f;
% % % % % % % Split ----------- FastICA ------------ Normalization
% % % % 
% % % % s11=vertcat(s(1,:),s(2,:),s(3,:));
% % % % s1=fastica(s11,'g','skew','Stabilization','on');
% % % % icas(1,:)=s1(1,:);
% % % icas(1,:)=icas(1,:)-min(icas(1,:));
% % % icas(1,:)=icas(1,:)/(max(icas(1,:))/1.2);
% % % icas(1,:)=icas(1,:)-0.1;
% % % % clear s11 s1;
% % % % 
% % % % 
% % % % s22=vertcat(s(4,:),s(5,:),s(6,:));
% % % % s2=fastica(s22,'g','skew','Stabilization','on');
% % % % icas(2,:)=s2(1,:);
% % % icas(2,:)=icas(2,:)-min(icas(2,:));
% % % icas(2,:)=icas(2,:)/(max(icas(2,:))/1.2);
% % % icas(2,:)=icas(2,:)-0.1;
% % % % clear s22 s2;
% % % % 
% % % % s33=vertcat(s(6,:),s(7,:),s(8,:));
% % % % s3=fastica(s33,'g','skew','Stabilization','on');
% % % % icas(3,:)=s3(1,:);
% % % icas(3,:)=icas(3,:)-min(icas(3,:));
% % % icas(3,:)=icas(3,:)/(max(icas(3,:))/1.2);
% % % icas(3,:)=icas(3,:)-0.1;
% % % % clear s33 s3;
% % % % 
% % % % s44=vertcat(s(9,:),s(10,:),s(11,:));
% % % % s4=fastica(s44,'g','skew','Stabilization','on');
% % % % icas(4,:)=s4(1,:);
% % % icas(4,:)=icas(4,:)-min(icas(4,:));
% % % icas(4,:)=icas(4,:)/(max(icas(4,:))/1.2);
% % % icas(4,:)=icas(4,:)-0.1;
% % % % clear s44 s4;
% % % % 
% % % % s55=vertcat(s(11,:),s(12,:),s(13,:));
% % % % s5=fastica(s55,'g','skew','Stabilization','on');
% % % % icas(5,:)=s5(1,:);
% % % icas(5,:)=icas(5,:)-min(icas(5,:));
% % % icas(5,:)=icas(5,:)/(max(icas(5,:))/1.2);
% % % icas(5,:)=icas(5,:)-0.1;
% % % % clear s55 s5;
% % % % 
% % % % s66=vertcat(s(14,:),s(15,:),s(16,:));
% % % % s6=fastica(s66,'g','skew','Stabilization','on');
% % % % icas(6,:)=s6(1,:);
% % % icas(6,:)=icas(6,:)-min(icas(6,:));
% % % icas(6,:)=icas(6,:)/(max(icas(6,:))/1.2);
% % % icas(6,:)=icas(6,:)-0.1;
% % % % clear s66 s6;
% % % 
% % % 
% % % zzz=1:length(icas(1,:));
% % % % % % ---------------------------------
% % % figure(222);
% % % for i=1:1%length(icas(:,1))
% % % subplot(1,1,i);
% % % plot(zzz,icas(i,:),'Color','b','LineWidth',0.3);
% % % ylim([-0.1 1.1]);
% % % xlim([1 length(icas(i,:))]);
% % % grid on;
% % % hold on;
% % % end

icas(1,1)=0;
icas(1,2)=0;
ooo=1:500;
for i=3:502
    icas(1,i)=1-1.4*icas(1,i-1)*icas(1,i-1)+0.3*icas(1,i-2);
end
lol=icas(1,3:502);
icas=[];
icas(1,:)=lol;
clear lol;
icas(1,:)=icas(1,:)-min(icas(1,:));
icas(1,:)=icas(1,:)/(max(icas(1,:))/1.2);
icas(1,:)=icas(1,:)-0.1;
figure(222);
plot(ooo,icas(1,:));
ylim([-0.1 1.1]);
hold on;

koord=[1; 1; 1; 1; 1; 1];

icas(:,length(icas(1,:))+1)=icas(:,length(icas(1,:)));

for num=1:1%length(icas(:,1))           % % % Cycle of one signal
    f=true; % % Flag of end of signal
    q=0;
while f
q=q+1;
clear P1 In Out;   


for i=koord(num,q):koord(num,q)+N-m-1                 %
    for j=1:m                                         %
        In(j,i-koord(num,q)+1)=icas(num,i-1+j);       %   Viborka
    end                                               %
    Out(i-koord(num,q)+1)=icas(num,i+m);              %
end


% %  Neural Network

P1=newff(In,Out,5,{'logsig'});
P1.initFcn = 'initlay';
P1.layers{1}.initFcn = 'initwb';
P1.layers{2}.initFcn = 'initwb';
P1.layerWeights{1,1}.initFcn = 'randnr';
P1.layerWeights{2,1}.initFcn = 'randnc';
init(P1);
P1.performFcn = 'sse';
P1.trainFcn = 'trainlm';
P1.trainParam.goal = 0.005;
P1.trainParam.epochs = 160000;
P1.trainParam.min_grad = 1e-10;
P1.trainParam.max_fail = 100000;
% P1.trainParam.time = 30;
[P1,koefs]=train(P1,In,Out);

SS(num,q)={P1};

% % ---------------------


z=true;
i=koord(num,q)+N-m-1;
% ii=i;
clear n1;
n1=[];

while z         % % % Find the Wall
    clear vh;
    
    for  lk=1:m
        vh(lk)=icas(num,i-1+lk);
    end
    vh=vh';
    
    x=sim(P1,vh);
      
    if abs(x-icas(num,i+m))>0.15
        
        z=false;
        koord(num,q+1)=i+m-1;
    
    else
        n1(length(n1)+1)=x;
        i=i+1;
        
        if i>length(icas(num,:))-m
            koord(num,q+1)=i+m-1;
            break;
        end
    
    end
% % % % % % % % % % % %     
%   ???????? ???????  %
% % % % % % % % % % % % 


end

dlina(num,q)=koord(num,q+1)-koord(num,q)+1;

for sch=1:10:fix((dlina(num,q)-m-1)/10)  %  Quantity of BIG runs
  
clear sig1 sig2;

sig1=icas(num,koord(num,q):koord(num,q+1));
sig2=icas(num,koord(num,q):koord(num,q+1));
sig2(sch+m-1)=sig2(sch+m-1)+1e-08;


lyap=[];

for g=sch:length(sig1)-m-1 % quantity of small runs
    clear vh1 vh2;  
    for gg=g:g+m-1
        vh1(gg-g+1)=sig1(gg);
        vh2(gg-g+1)=sig2(gg);
    end
    vh1=vh1';
    vh2=vh2';
   
    
    x=sim(P1,vh1);
    sig1(g+m)=x;

    x1=sim(P1,vh2);
    sig2(g+m)=x1;
    
    if log(abs(x1-x))<0
        lyap(length(lyap)+1)=log(abs(x1-x));
    end
    
end

syms a b;
biglyap=0;
for sc=1:length(lyap)
biglyap=biglyap+(a*sc+b-lyap(sc))^2;
end
clear aTrue bTrue;
[aTrue,bTrue]=solve([diff(biglyap,a),diff(biglyap,b)],[a,b]);

Aa(sch)=double(aTrue); 

end

if mean(Aa)<0
    figure(222);
    plot([koord(num,q) koord(num,q+1)],[-0.1 1.1],'Color','r','LineWidth',2);
    hold on;
end
AAA(length(AAA)+1)=mean(Aa);
Aa
clear Aa;
       





figure(222);
clear n2 lyap;
% t1=koord(num,q):koord(num,q+1);
% n1=horzcat(icas(num,koord(num,q):koord(num,q)+N-2),n1);
subplot(1,1,num);
plot([koord(num,q)+N-1:koord(num,q+1)],n1,'Color','r','LineWidth',0.1);
hold on;
clear n1;
plot([koord(num,q+1) koord(num,q+1)],[-0.1 1.1],'LineWidth',0.5,'Color','k');

if length(icas(num,:))-koord(num,q+1)<N
    
    f=false;
    
end

% % % --------------------
% % % --------------------

% % % % % % % % Plot
% % % % % clear n1 or1;
% % % % % % figure(q);
% % % % % 
% % % % % for i=koord(num,q):koord(num,q+1)-m
% % % % %    
% % % % %     n1(i-koord(num,q)+1)=sim(P1,[icas(num,i); icas(num,i+1); icas(num,i+2); icas(num,i+3); icas(num,i+4); icas(num,i+5); icas(num,i+6); icas(num,i+7); icas(num,i+8); icas(num,i+9)]);
% % % % %     n2(i-koord(num,q)+1)=sim(P1,[icas(num,i); icas(num,i+1); icas(num,i+2); icas(num,i+3); icas(num,i+4); icas(num,i+5); icas(num,i+6); icas(num,i+7); icas(num,i+8); icas(num,i+9)]+1e-08);
% % % % %     or1(i-koord(num,q)+1)=icas(num,i+m);
% % % % % end
% % % % % figure(55);
% % % % % subplot(6,1,num);
% % % % % t1=koord(num,q):koord(num,q+1)-10;
% % % % % plot(t1,or1,'Color','b','LineWidth',0.1);
% % % % % hold on;
% % % % % plot(t1,n1,'Color','r','LineWidth',0.1);
% % % % % hold on;
% % % % % plot([koord(num,q+1)-9 koord(num,q+1)-9],[0 1],'LineWidth',0.2,'Color','k');
% % % % % hold on;
% % % % % % xlim([koord(q) koord(q+1)-10]);
% % % % % grid on;
% % % % % 
% % % % % % legend('Signal','Perceptron','location','best');

% % % --------------------
% % % --------------------



end

title('Разбиение фильтрованного сигнала');
xlabel('Отсчёты');
ylabel('Фильтрованный нормированный сигнал');

end
mean(dlina);


toc;
