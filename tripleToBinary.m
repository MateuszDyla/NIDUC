function decodedVectors = tripleToBinary(sentVectors)
%TRIPLETOBINARY Dekoduje macierz wartości binarnych zakodowanych
%potrojeniowo 
%Iteruje co 3 bity, i następnie sumuje 3 następne bity po iteratorze. Jeśli
%suma ta jest większa od 2, to znaczy, że prawdopodobnie przed zakodowaniem
%był tam bit wysoki. W innym przypadku, prawdopodobnie znajdowało się tam
%zero.
    decodedVectors = [];
    for vector = sentVectors.'
        newVector = [];

        i = 1;
        while i <= length(vector)
            highBits = sum(vector(i:i+2));

            if(highBits) >=2
                bit = 1;
            else
                bit = 0;
            end
            newVector = [newVector, bit];
            i=i+3;
        end
        decodedVectors = [decodedVectors; newVector];
    end
    
end

