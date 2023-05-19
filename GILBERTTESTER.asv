clear;
transmiter = FECTransmitter();
data = fileread("romeo.txt");
binaryData = textToBinary(data);
bers = zeros(1,100);

% for i=1 : 1000
%     transmiter.sendData(data, transmiter.BSCChannel, [0.1], transmiter.noCode, []);
%     bers(i) = transmiter.ber;
%     disp(i);
%     transmiter.saveData();
% end
% c = 0;
% pg = 0.0005:0.0005:0.01;
% pb = 0.1:0.1:0.5;
% gtb = 0.0005:0.0005:0.01;
% btg = 0.005:0.005:0.1;
% 
% params = combvec(pg, pb, gtb, btg)';
% for i = 1:width(params)
%     transmiter.sendData(binaryData, transmiter.GilbertElliott, params(i,:), transmiter.noCode, []);
%     transmiter.saveData();
%     c=c+1;
%     disp(c);
% end

% disp(max(bers));

transmiter.sendData(binaryData, transmiter.GilbertElliott, [0.0005 0.001 ], transmiter.noCode, []);

