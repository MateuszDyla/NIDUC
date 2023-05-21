clear;
transmiter = FECTransmitter();
data = fileread("romeo.txt");
binaryData = textToBinary(data);

c = 0;
pg = 0.00001:0.00001:0.0001;
pb = 0.05:0.05:0.5;
gtb = 0.00005:0.00005:0.005;
btg = 0.8:-0.1:0.1;

params = combvec(pg, pb, gtb, btg)'; %stworzenie wektorow z wszystkimi kombinacjami parametrow
numParams = size(params, 1);
parpool(); % Otwarcie puli wątków

parfor i = 1:numParams
    transmiter = FECTransmitter();
    transmiter.sendData(binaryData, transmiter.GilbertElliott, params(i,:), transmiter.noCode, []);
    transmiter.saveData();
end

delete(gcp); % Zamknięcie puli wątków
