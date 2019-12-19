% Очистка памяти и командной строки
clear; clc;     

%% 1) Загрузка исходных данных
% 1.1) Загрузка исходнных данных из файла VOLUMES_EUR.mat
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
% 1.2) Указание периодов обучения сети и периода тестирования
% TrainStartDate = datenum('01.01.2010', 'dd.mm.yyyy');
% TrainEndDate = datenum('31.12.2010', 'dd.mm.yyyy');
% 
% TestStartDate = datenum('01.01.2011', 'dd.mm.yyyy');
% TestEndDate = datenum('22.11.2011', 'dd.mm.yyyy');

%% 2) Предварительна обработка исходных данных
% 2.1) Масштабирование данных по потреблению: [min - max] -> [0 - 1]
Data = Data - min(Data);       % Масштабирование
Data = Data/max(Data);
% 2.2) Получение массива для обучения сети P: h, h-24; h-48 (см архитектуру сети)
% Index0 = find(Data(:,1) >= TrainStartDate & Data(:,1) <= TrainEndDate);
% Index1 = find(Data(:,1) >= TrainStartDate-1 & Data(:,1) <= TrainEndDate-1);
% Index2 = find(Data(:,1) >= TrainStartDate-2 & Data(:,1) <= TrainEndDate-2);
% P(:,1) = Data(Index0,4);
% P(:,2) = Data(Index1,4);
% P(:,3) = Data(Index2,4);
P(:,1) = Data(1:100,1);

%% 3) Настройка нейронной сети
% 3.1) Описание архитектуры нейронной сети (см схему)
NumberOfInputNeurons = 10;          % Количество входов нейронной сети
NumberOfHiddenNeurons = 5;         % Количество нейронов в скрытом слое
NumberOfOutputNeurons = 1;         % Количество выходов

% 3.2) Описание параметров нейронной сети (используем то, что дает Хайкин в примере)
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

% 3.3) Инициализация нейронной сети (используем то, что дает Хайкин в примере)
NumPats = (length(P(:,1))-10)/1; 
W1 = randn(NumberOfHiddenNeurons, NumberOfInputNeurons+1);
W2 = randn(NumberOfOutputNeurons, NumberOfHiddenNeurons+1);
dW1l = W1 * 0;      		
dW2l = W2 * 0; 
LearningRate1  = LearningRate * ones(size(W1));    
LearningRate2  = LearningRate * ones(size(W2));

fprintf('Инициализация завершена\n')

%% 4) Обучение нейронной сети

tic

epoch = 1;

% 4.1) Цикл обучения сети
while epoch < Epochs & dflag == 0,

      fprintf('Вдох в обучающий цикл эпохи %g из %g \n',epoch, Epochs);

      for i = 1 : NumPats
         % Выход сети
         target = P(i+10,1);
         % Вход
%          i1 = P([(i-1)*24+1:i*24],2);
%          i2 = P([(i-1)*24+1:i*24],3);
         input  = [[P(i:i+9,1)]; 1];
         
         % Одна итерация работы сети
         sumHidden   = W1*input;
         outHidden   = bpm_phi(sumHidden);
         sumOutput   = W2*[outHidden' 1]';
         outOutput   = bpm_phi(sumOutput);
         outputError = target - outOutput;
         errEpoch(i) = sumsqr(outputError);         % Ошибка результата

         % Преобразование весов - шаг 1
         dc  = bpm_phi_d(sumOutput) .* outputError;
         dW2 = LearningRate2 .* dc(:,ones(NumberOfHiddenNeurons+1,1)) .* [outHidden(:,ones(NumberOfOutputNeurons,1))' ones(NumberOfOutputNeurons,1)];

         % Преобразование весов - шаг 2
         db  = bpm_phi_d(sumHidden) .* ( sum( (W2(1:NumberOfOutputNeurons,1:NumberOfHiddenNeurons)' .* dc(:,ones(1, NumberOfHiddenNeurons))'),2)); 
         dW1 = LearningRate1 .* db(:,ones(NumberOfInputNeurons+1,1)) .* (input(:,ones(NumberOfHiddenNeurons,1))');
         
         W1 = W1 + dW1 + Momentum*dW1l;	
         W2 = W2 + dW2 + Momentum*dW2l; 
         dW1l = dW1;     			
         dW2l = dW2;
      end

      EpErr(epoch)=sum(errEpoch)/NumPats;
      fprintf('Среднеквардатичная ошибка: %g\n', EpErr(epoch))
      DiffEpErr = 100*(PepErr-EpErr(epoch))/PepErr;
      fprintf('Процентное изменение средней ошибки за эпоху: %g\n\n', DiffEpErr)

      if abs(DiffEpErr) < StopCrit, 
        fprintf('Обучение остановлено на эпохе: %g\n\n',epoch)
        dFlag = 1;
      end

      PepErr = EpErr(epoch);
      epoch = epoch + 1;
end

% % 4.2) Формировнаие итоговых весов и смещений
b1 = W1(:,NumberOfInputNeurons+1);    
b2 = W2(:,NumberOfHiddenNeurons+1);     
W1 = W1(:,1:NumberOfInputNeurons);    
W2 = W2(:,1:NumberOfHiddenNeurons);

fprintf('Обучение заняло %g секунд \n\n',toc)
   
%% 5) Тестовое прогнозирование

% 5.1) Получение массива для тестирования сети T: h, h-24; h-48 (см архитектуру сети)
% % Index0 = find(Data(:,1) >= TestStartDate & Data(:,1) <= TestEndDate);
% % Index1 = find(Data(:,1) >= TestStartDate-1 & Data(:,1) <= TestEndDate-1);
% % Index2 = find(Data(:,1) >= TestStartDate-2 & Data(:,1) <= TestEndDate-2);
% % T(:,1) = Data(Index0,4);
% % T(:,2) = Data(Index1,4);
% % T(:,3) = Data(Index2,4);
T(:,1) = Data(1:500,1);

% 5.2) Прогнозирование на полученной сети (сеть описывается b1, b2, W1, W2)
NumPats = (length(T(:,1))-10)/1;

for i = 1 : NumPats
    % Вход
   
    input  = [T(i:i+9,1)];
    % Прогноз
    outHiddenLayer = bpm_phi(W1 * input + b1);
    outOutputLayer = bpm_phi(W2 * outHiddenLayer + b2);
    % Переменная результата
    Result(i,1) = outOutputLayer;
end

% 5.3) Инверсия масштаба
Result(:,2) = T(11:length(T),1);       % Записываем в 3 столбец факт

%% 6) Оценка ошибки прогнозирования

for i = 1 : length(Result);
    if Result(i,2)==0
        Result(i,2)=mean([Result(1:i-1,2)]);
    end
    MAE(i,1) = abs(Result(i,2) - Result(i,1));
    MAPE(i,1) = abs((Result(i,2) - Result(i,1))/Result(i,2)) * 100;
    
end

fprintf('Ошибка прогнозирования: MAPE = %g '' and MAE = %g MWh \n', mean(MAPE), mean(MAE))