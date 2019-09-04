close all

rng default;
n = 30000;
dataIn = randi([0,1],n,1);

stem(dataIn(1:25));
title('Random Bits');
xlabel('Bit index');
ylabel('Binary Value');

k = 4;
dataInMatrix = reshape(dataIn,length(dataIn)/k,k);
dataSymbolsIn = bi2de(dataInMatrix);

figure;
stem(dataSymbolsIn(1:25));
title('Random Symbol');
xlabel('Symbol Index');
ylabel('Integer Value');

M = 16;
dataMod = qammod(dataSymbolsIn,M,'bin');
dataModG = qammod(dataSymbolsIn,M);

EbN0 = 10;
numSamplesPerSymbol = 1;
snr = EbN0 + 10*log10(k) - 10*log10(numSamplesPerSymbol);
%snr = 100

receivedSignal = awgn(dataMod,snr,'measured');
receivedSignalG = awgn(dataModG,snr,'measured');

%sPlotFig = scatterplot(dataMod,1,0,'g.');
sPlotFig = scatterplot(receivedSignal,1,0,'green.');
hold on
scatterplot(dataMod,1,0,'black*',sPlotFig);

dataSymbolsOut = qamdemod(receivedSignal,M,'bin');
dataSymbolsOutG = qamdemod(receivedSignalG,M);

figure;
stem(dataSymbolsOut(1:25));

dataOutMatrix = de2bi(dataSymbolsOut,k);
dataOutMatrixG = de2bi(dataSymbolsOutG,k);

[numErrors,ber] = biterr(dataIn,dataOut);
[numErrorsG,berG] = biterr(dataIn,dataOutG);

x1 = (0:15);
x = x1';
y1 = qammod(x,M,'bin');

scatterplot(y1);
text(real(y1)+0.2,imag(y1)+0.2,dec2bin(x));
axis([-4 4 -4 4]);

