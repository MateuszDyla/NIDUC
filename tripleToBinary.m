function decodedVectors = tripleToBinary(sentVectors)
%TRIPLETOBINARY Dekoduje macierz wartości binarnych zakodowanych
%potrojeniowo 
%Iteruje co 3 bity, i następnie sumuje 3 następne bity po iteratorze. Jeśli
%suma ta jest większa od 2, to znaczy, że prawdopodobnie przed zakodowaniem
%był tam bit wysoki. W innym przypadku, prawdopodobnie znajdowało się tam
%zero.

%Prealokacja macierzy wyjściowej]
    [ySize, xSize] = size(sentVectors);
    decodedVectors = zeros(ySize, xSize/3);

    j = 1;
    while j <= ySize
        i = 1;
        x = 1;
        vector = sentVectors(j,:);
        while i < length(vector)
            highBits = sum(vector(i:i+2));

            if(highBits) >=2
                bit = 1;
            else
                bit = 0;
            end
            decodedVectors(j, x) = bit;
            i=i+3;
            x = x + 1;
        end
        j = j + 1;
    end
    
end

