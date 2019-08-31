close all

rng default
n = 30000;
dataIn = randi([0,1],n,1);

stem(dataIn(1:25))
title('Random Bits')
xlabel('Bit index')
ylabel('Binary Value')

k = 4;
dataInMatrix = reshape(dataIn,length(dataIn)/k,k);
dataSymbolsIn = bi2de(dataInMatrix);

figure
stem(dataSymbolsIn(1:25))
title('Random Symbol')
xlabel('Symbol Index')
ylabel('Integer Value')

M = 16;
dataMod = qammod(dataSymbolsIn,M,'bin');
dataModG = qammod(dataSymbolsIn,M);

EbN0 = 10;
numSamplesPerSymbol = 1;
snr = EbN0 + 10*log10(k) - 10*log10(numSamplesPerSymbol)
!snr = 100

receivedSignal = awgn(dataMod,snr,'measured');
receivedSignalG = awgn(dataModG,snr,'measured');


!sPlotFig = scatterplot(dataMod,1,0,'g.');
sPlotFig = scatterplot(receivedSignal,1,0,'g.');
hold on
scatterplot(dataMod,1,0,'k*',sPlotFig)