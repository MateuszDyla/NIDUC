function text = binaryToString(binaryVectors)
    text = "";
    [ySize, xSize] = size(binaryVectors);
    i = 1;
    while i <= ySize
        decVal = binaryVectorToDecimal(binaryVectors(i,:));
        text = text + char(decVal);
        i = i + 1;
    end


end

