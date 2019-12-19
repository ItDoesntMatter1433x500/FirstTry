% ������� ������ � ��������� ������
clear; clc;     

%% 1) �������� �������� ������
% 1.1) �������� ��������� ������ �� ����� VOLUMES_EUR.mat
% load VOLUMES_EUR VOLUMES_EUR;

icas(1,1)=0;
icas(1,2)=0;
for i=3:502
    icas(1,i)=1-1.4*icas(1,i-1)*icas(1,i-1)+0.3*icas(1,i-2);
end
lol=icas(1,3:502);
icas=[];
icas=lol;
clear lol;

Data = icas(1,:);
Data = Data';
% 1.2) �������� �������� �������� ���� � ������� ������������
% TrainStartDate = datenum('01.01.2010', 'dd.mm.yyyy');
% TrainEndDate = datenum('31.12.2010', 'dd.mm.yyyy');
% 
% TestStartDate = datenum('01.01.2011', 'dd.mm.yyyy');
% TestEndDate = datenum('22.11.2011', 'dd.mm.yyyy');

%% 2) �������������� ��������� �������� ������
% 2.1) ��������������� ������ �� �����������: [min - max] -> [0 - 1]
Data = Data - min(Data);       % ���������������
Data = Data/max(Data);
% 2.2) ��������� ������� ��� �������� ���� P: h, h-24; h-48 (�� ����������� ����)
% Index0 = find(Data(:,1) >= TrainStartDate & Data(:,1) <= TrainEndDate);
% Index1 = find(Data(:,1) >= TrainStartDate-1 & Data(:,1) <= TrainEndDate-1);
% Index2 = find(Data(:,1) >= TrainStartDate-2 & Data(:,1) <= TrainEndDate-2);
% P(:,1) = Data(Index0,4);
% P(:,2) = Data(Index1,4);
% P(:,3) = Data(Index2,4);
P(:,1) = Data(1:100,1);

%% 3) ��������� ��������� ����
% 3.1) �������� ����������� ��������� ���� (�� �����)
NumberOfInputNeurons = 10;          % ���������� ������ ��������� ����
NumberOfHiddenNeurons = 5;         % ���������� �������� � ������� ����
NumberOfOutputNeurons = 1;         % ���������� �������

% 3.2) �������� ���������� ��������� ���� (���������� ��, ��� ���� ������ � �������)
LearningRate = .1;
Momentum = .5;
Epochs = 20000;
W1i = 0;
b1i = 0; 
W2i = 0;
b2i = 0;
StopCrit = 0.001;
PepErr = 10;
dflag = 0;

% 3.3) ������������� ��������� ���� (���������� ��, ��� ���� ������ � �������)
NumPats = (length(P(:,1))-10)/1; 
W1 = randn(NumberOfHiddenNeurons, NumberOfInputNeurons+1);
W2 = randn(NumberOfOutputNeurons, NumberOfHiddenNeurons+1);
dW1l = W1 * 0;      		
dW2l = W2 * 0; 
LearningRate1  = LearningRate * ones(size(W1));    
LearningRate2  = LearningRate * ones(size(W2));

fprintf('������������� ���������\n')

%% 4) �������� ��������� ����

tic

epoch = 1;

% 4.1) ���� �������� ����
while epoch < Epochs & dflag == 0,

      fprintf('���� � ��������� ���� ����� %g �� %g \n',epoch, Epochs);

      for i = 1 : NumPats
         % ����� ����
         target = P(i+10,1);
         % ����
%          i1 = P([(i-1)*24+1:i*24],2);
%          i2 = P([(i-1)*24+1:i*24],3);
         input  = [[P(i:i+9,1)]; 1];
         
         % ���� �������� ������ ����
         sumHidden   = W1*input;
         outHidden   = bpm_phi(sumHidden);
         sumOutput   = W2*[outHidden' 1]';
         outOutput   = bpm_phi(sumOutput);
         outputError = target - outOutput;
         errEpoch(i) = sumsqr(outputError);         % ������ ����������

         % �������������� ����� - ��� 1
         dc  = bpm_phi_d(sumOutput) .* outputError;
         dW2 = LearningRate2 .* dc(:,ones(NumberOfHiddenNeurons+1,1)) .* [outHidden(:,ones(NumberOfOutputNeurons,1))' ones(NumberOfOutputNeurons,1)];

         % �������������� ����� - ��� 2
         db  = bpm_phi_d(sumHidden) .* ( sum( (W2(1:NumberOfOutputNeurons,1:NumberOfHiddenNeurons)' .* dc(:,ones(1, NumberOfHiddenNeurons))'),2)); 
         dW1 = LearningRate1 .* db(:,ones(NumberOfInputNeurons+1,1)) .* (input(:,ones(NumberOfHiddenNeurons,1))');
         
         W1 = W1 + dW1 + Momentum*dW1l;	
         W2 = W2 + dW2 + Momentum*dW2l; 
         dW1l = dW1;     			
         dW2l = dW2;
      end

      EpErr(epoch)=sum(errEpoch)/NumPats;
      fprintf('������������������ ������: %g\n', EpErr(epoch))
      DiffEpErr = 100*(PepErr-EpErr(epoch))/PepErr;
      fprintf('���������� ��������� ������� ������ �� �����: %g\n\n', DiffEpErr)

      if abs(DiffEpErr) < StopCrit, 
        fprintf('�������� ����������� �� �����: %g\n\n',epoch)
        dFlag = 1;
      end

      PepErr = EpErr(epoch);
      epoch = epoch + 1;
end

% % 4.2) ������������ �������� ����� � ��������
b1 = W1(:,NumberOfInputNeurons+1);    
b2 = W2(:,NumberOfHiddenNeurons+1);     
W1 = W1(:,1:NumberOfInputNeurons);    
W2 = W2(:,1:NumberOfHiddenNeurons);

fprintf('�������� ������ %g ������ \n\n',toc)
   
%% 5) �������� ���������������

% 5.1) ��������� ������� ��� ������������ ���� T: h, h-24; h-48 (�� ����������� ����)
% % Index0 = find(Data(:,1) >= TestStartDate & Data(:,1) <= TestEndDate);
% % Index1 = find(Data(:,1) >= TestStartDate-1 & Data(:,1) <= TestEndDate-1);
% % Index2 = find(Data(:,1) >= TestStartDate-2 & Data(:,1) <= TestEndDate-2);
% % T(:,1) = Data(Index0,4);
% % T(:,2) = Data(Index1,4);
% % T(:,3) = Data(Index2,4);
T(:,1) = Data(1:500,1);

% 5.2) ��������������� �� ���������� ���� (���� ����������� b1, b2, W1, W2)
NumPats = (length(T(:,1))-10)/1;

for i = 1 : NumPats
    % ����
   
    input  = [T(i:i+9,1)];
    % �������
    outHiddenLayer = bpm_phi(W1 * input + b1);
    outOutputLayer = bpm_phi(W2 * outHiddenLayer + b2);
    % ���������� ����������
    Result(i,1) = outOutputLayer;
end

% 5.3) �������� ��������
Result(:,2) = T(11:length(T),1);       % ���������� � 3 ������� ����

%% 6) ������ ������ ���������������

for i = 1 : length(Result);
    if Result(i,2)==0
        Result(i,2)=mean([Result(1:i-1,2)]);
    end
    MAE(i,1) = abs(Result(i,2) - Result(i,1));
    MAPE(i,1) = abs((Result(i,2) - Result(i,1))/Result(i,2)) * 100;
    
end

fprintf('������ ���������������: MAPE = %g '' and MAE = %g MWh \n', mean(MAPE), mean(MAE))