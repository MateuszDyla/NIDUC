function binaryData = textToBinary(textData)
%TEXTTOBINARY Konwertuje każdy znak tekstu na blok wartości binarnych
    
binaryData = logical(dec2bin(textData, 8) - '0');

end

