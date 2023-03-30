function text = binaryToString(binaryVectors)
    
    binaryVectors = double(binaryVectors);
    text = char((bin2dec(num2str(binaryVectors))))';
end

