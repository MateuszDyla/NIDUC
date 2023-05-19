function [GEamount, GEdistribution] = groupErrors(arr1, arr2)
%GROUPERRORS Summary of this function goes here
%   Detailed explanation goes here

GEdistribution = zeros(1,8);
GEamount = 0;
for i=1 : height(arr1)
    vec1 = arr1(i,:);
    vec2 = arr2(i,:);
    distcounter = 0;
    counter = 0;
    for j = 1 : width(vec1)
        if(vec1(j) == vec2(j))
            if(distcounter > 0)
                GEdistribution(distcounter) = GEdistribution(distcounter)+1;
            end

            if(counter > 1)
                GEamount = GEamount+1;
            end
            counter=0;
            distcounter = 0;
            continue;
        end
        distcounter=distcounter+1;
        counter = counter+1;
    end

    if(distcounter > 0)
        GEdistribution(distcounter) = GEdistribution(distcounter)+1;
    end

    if(counter > 1)
        GEamount = GEamount+1;
    end
    counter=0;
    distcounter = 0;
end

