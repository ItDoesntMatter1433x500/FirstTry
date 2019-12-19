clear;
close;
clc;

[data, head] = lab_read_edf('C:\YandexDisk\Project\Signals\4.edf');

head.hdr.intro='0                                                                                                                                                                       22.01.1816.14.566400                                                45      1       24  ';
head.hdr.channels=22;
head.hdr.channelname(17,:)='Ss1             ';
head.hdr.channelname(18,:)='Ss2             ';
head.hdr.channelname(19,:)='Ss3             ';
head.hdr.channelname(20,:)='Ss4             ';
head.hdr.channelname(21,:)='Ss5             ';
head.hdr.channelname(22,:)='Ss6             ';
head.hdr.channelname(23:length(head.hdr.channelname(:,1)),:)=[];
head.hdr.transducer(17,:)='EEG Ss1                                                                         ';
head.hdr.transducer(18,:)='EEG Ss2                                                                         ';
head.hdr.transducer(19,:)='EEG Ss3                                                                         ';
head.hdr.transducer(20,:)='EEG Ss4                                                                         ';
head.hdr.transducer(21,:)='EEG Ss5                                                                         ';
head.hdr.transducer(22,:)='EEG Ss6                                                                         ';
head.hdr.transducer(23:length(head.hdr.transducer(:,1)),:)=[];
head.hdr.physdime(23:length(head.hdr.physdime(:,1)),:)=[];
head.hdr.physmin(17:22,:)=2;
head.hdr.physmin(23:length(head.hdr.physmin(:,1)),:)=[];
head.hdr.physmax(17:22,:)=-1;
head.hdr.physmax(23:length(head.hdr.physmax(:,1)),:)=[];
head.hdr.digimin(23:length(head.hdr.digimin(:,1)),:)=[];
head.hdr.digimax(23:length(head.hdr.digimax(:,1)),:)=[];
head.hdr.prefilt(23:length(head.hdr.prefilt(:,1)),:)=[];
head.hdr.numbersperrecord(23:length(head.hdr.numbersperrecord(:,1)),:)=[];
head.numchannels=22;
head.channels(17,:)='Ss1             ';
head.channels(18,:)='Ss2             ';
head.channels(19,:)='Ss3             ';
head.channels(20,:)='Ss4             ';
head.channels(21,:)='Ss5             ';
head.channels(22,:)='Ss6             ';
head.channels(23:length(head.channels(:,1)),:)=[];
head.ecg_ch=22;
head.numdatachannels=22;
data(17:length(data(:,1)),:)=[];

% % % Loading file
% clear vse f;
% % % Split ----------- FastICA ------------ Normalization

s11=vertcat(data(12,:),data(14,:),data(16,:));
s1=fastica(s11,'g','skew','Stabilization','on');
data(17,:)=s1(1,:);
% data(17,:)=data(17,:)-min(data(17,:));
% data(17,:)=data(17,:)/(max(data(17,:))/1.2);
% data(17,:)=data(17,:)-0.1;
clear s11 s1;


s22=vertcat(data(2,:),data(4,:),data(6,:));
s2=fastica(s22,'g','skew','Stabilization','on');
data(18,:)=s2(1,:);
% data(18,:)=data(18,:)-min(data(18,:));
% data(18,:)=data(18,:)/(max(data(18,:))/1.2);
% data(18,:)=data(18,:)-0.1;
clear s22 s2;

s33=vertcat(data(6,:),data(8,:),data(10,:));
s3=fastica(s33,'g','skew','Stabilization','on');
data(19,:)=s3(1,:);
% data(19,:)=data(19,:)-min(data(19,:));
% data(19,:)=data(19,:)/(max(data(19,:))/1.2);
% data(19,:)=data(19,:)-0.1;
clear s33 s3;

s44=vertcat(data(1,:),data(3,:),data(5,:));
s4=fastica(s44,'g','skew','Stabilization','on');
data(20,:)=s4(1,:);
% data(20,:)=data(20,:)-min(data(20,:));
% data(20,:)=data(20,:)/(max(data(20,:))/1.2);
% data(20,:)=data(20,:)-0.1;
clear s44 s4;

s55=vertcat(data(5,:),data(7,:),data(9,:));
s5=fastica(s55,'g','skew','Stabilization','on');
data(21,:)=s5(1,:);
% data(21,:)=data(21,:)-min(data(21,:));
% data(21,:)=data(21,:)/(max(data(21,:))/1.2);
% data(21,:)=data(21,:)-0.1;
clear s55 s5;

s66=vertcat(data(11,:),data(13,:),data(15,:));
s6=fastica(s66,'g','skew','Stabilization','on');
data(22,:)=s6(1,:);
% data(22,:)=data(22,:)-min(data(22,:));
% data(22,:)=data(22,:)/(max(data(22,:))/1.2);
% data(22,:)=data(22,:)-0.1;
clear s66 s6;

data(17:22,:)=data(17:22,:)*100;

lab_write_edf('C:\YandexDisk\Project\Signals\4f.edf',data,head);