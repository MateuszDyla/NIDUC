function binaryData = textToBinary(textData)
%TEXTTOBINARY Summary of this function goes here
%   Detailed explanation goes here
    
binaryData = logical(dec2bin(textData, 8) - '0');

end

