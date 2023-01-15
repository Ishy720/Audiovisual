function [rpStruct] = findLargestRegionProp(rpStructure)
    numRegionProps = length(rpStructure);
    iRegionProp = rpStructure(1);
    for iterator = 1: numRegionProps
        currentRegionProp = rpStructure(iterator);
        currentArea = currentRegionProp.Area;
        iArea = iRegionProp.Area;
        if (currentArea > iArea)
            iRegionProp = currentRegionProp;
        end
    end
    
    rpStruct = iRegionProp;
end

