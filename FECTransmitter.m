classdef FECTransmitter < handle
    %FECTransmitter Summary of this class goes here
    %   Detailed explanation goes here
    
    properties
        dataToSend;
        redundancy = 0;
        ber = 0;
        gerrors;
        gerrorsdist;
        wrongBits = 0;
        decodedText;
        incorrectLetters;
        percentIncorrectLetters;
        channel_param;
        channel;
    end

    properties(Constant)
        TripleCode = "Potrojeniowy";
        Hamming = "Hamming";
        BSCChannel = "BSC";
        RS = "RS";
        noCode = "nocode";
        GilbertElliott = "Gilbert";
    end
    
    methods
        function obj = FECTransmitter()
        end
        
        %channel - kod kanału (patrz stałe wyżej)
        %channel_param - parametry kanału, w tablicy zgodnie z kolejnością
        %podawania parametrów do funkcji przesyłającej dane
        %code - kod kodu (patrz stałe wyżej)
        %code_param - parametry kodu, w tablicy, zgodnie z kolejnością
        %podawania parametrów do funkcji kodującej (np. [n, k] dla
        %Hamminga)
        function obj = sendData(obj, binaryData, channel, channel_param, code, code_param) 
            obj.channel_param = channel_param;
            obj.channel = channel;
%             obj.dataToSend = data;
            %kodowanie
            if(code == obj.TripleCode)
                codedData = binaryToTriple(binaryData);
            elseif(code == obj.Hamming)
                codedData = binaryToHamming(binaryData, code_param(1), code_param(2));
            elseif(code == obj.RS)
                codedData = binaryToRS(binaryData, code_param(1), code_param(2));
            elseif(code == obj.noCode)
                codedData = binaryData;
            end
            
            %przesył danych przez wybrany kanał
            if(channel == obj.BSCChannel)
                sentData = bsc(codedData, channel_param(1));
            elseif(channel == obj.GilbertElliott)
                sentData = gilbert(codedData, channel_param(1), channel_param(2), channel_param(3), channel_param(4));
            end

%             dekodowanie
            if(code == obj.TripleCode)
                decodedData = tripleToBinary(sentData);
            elseif(code == obj.Hamming)
                decodedData = hammingToBinary(sentData, code_param(1), code_param(2));
            elseif(code == obj.RS)
                decodedData=RSToBinary(sentData, code_param(1), code_param(2));
            elseif(code == obj.noCode)
                decodedData = sentData;
%             end

            %zapis statystyk
            [obj.wrongBits, obj.ber] = biterr(binaryData, decodedData);
%             obj.redundancy = 100*(height(codedData)*width(codedData))/(height(decodedData)*width(decodedData));
%             obj.decodedText = binaryToString(decodedData);
%             obj.incorrectLetters=differentLetters(decodedData,binaryData);
%             obj.percentIncorrectLetters = 100*obj.incorrectLetters/length(binaryData);
            [obj.gerrors, obj.gerrorsdist] = groupErrors(binaryData, decodedData);

        end

       function displayData(obj)
            disp("Wyświetlanie wiadomosci:");
            disp(obj.decodedText);
            disp("Statystyki:");
            disp("Przekłamane bity: " + obj.wrongBits);
            disp("BER: " + obj.ber);
            disp("Błędne litery: " +obj.incorrectLetters);
            disp("Procentowo: " + obj.percentIncorrectLetters + "%");
            disp("Nadmiarowość: " + obj.redundancy + "%");
       end

       function saveData(obj)
         
           if exist("results.csv", "file") == 0
               tytuly={"pg", "pb", "gtb" "btg", "ber", "grupowe"};
               writecell(tytuly, "results.csv")
           end
           data = [obj.channel_param, obj.ber, obj.gerrors, obj.gerrorsdist];
           writematrix(data, "results.csv", 'WriteMode', 'append')
       end
    end
end

