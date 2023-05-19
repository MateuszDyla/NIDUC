%inVectors - macierz transmitowanych danych
%Pg - prawdopodobienstwo wystąpienia błędu w stanie dobrym
%Pb - prawdopodobienstwo wystąpienia błędu w stanie złym
%goodToBad - prawdopodobienstwo przejscia z stanu dobrego do złego
%badToGood - prawdopodobienstwo przejscia ze stanu złego do dobrego

function [outVectors] = gilbert(inVectors,Pg, Pb, goodToBad, badToGood)
% if(nargin < 2|| isempty(Pg))
%     Pg = input("Podaj prawdopodobienstwo przeklamania w stanie dobrym: ");
% end
% if(nargin < 3 || isempty(Pb))
%     Pb = input("Podaj prawdopodobienstwo przeklamania w stanie złym: ");
% end
% if(nargin < 4 || isempty(goodToBad))
%     goodToBad = input("Podaj prawdopodobienstwo przejscia ze stanu dobrego do zlego: ");
% end
% if(nargin < 5 || isempty(badToGood))
%     badToGood = input("Podaj prawdopodobienstwo przejscia ze stanu zlego do dobrego: ");
% end

[h, w] = size(inVectors);
randomValues = rand(h,w);
outVectors = zeros(h, w); %prealokacja
state = 1; %stan 1 - good; stan 0 - bad

for i = 1:h
    for j = 1:w
        %losowanie zmiany stanu kanalu odbywa sie co przeslany bit
        if(state == 1 && randomValues(i,j) > (1 - goodToBad))
            state = 0;
            %jeśli wylosowana liczba z zakresu 0-1 jest wieksza niz
            %prawdopodobienstwo zostania w danym stanie, to zmienia sie
            %stan na przeciwny                
        elseif(state == 0 && randomValues(i,j) > (1 - badToGood)) 
            state = 1;
        end

        %przesył danych dwoma kanałami BSC (o innym prawdopodobienstwie przeklamiania - Pb i Pg) w zaleznosci od stanu kanalu 
        if(state == 1)
            outVectors(i,j) = bsc(inVectors(i,j), Pg);
        else
            outVectors(i,j) = bsc(inVectors(i,j), Pb);
        end
    end
end


end

