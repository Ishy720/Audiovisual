function [featureArrays] = fetchVideoRegionProps(videoStruct)
    numFrames = length(videoStruct); 
    for iterator = 1: numFrames
        generatedRegionProps = generateRegionProp(videoStruct, iterator);
        largestRegionProp = findLargestRegionProp(generatedRegionProps);
        regionInformation = extractRegionInformation(largestRegionProp);
        regionArea = regionInformation.area;
        regionHeight = regionInformation.height;
        regionWidth = regionInformation.width;
        regionPerimeter = regionInformation.perimeter;
        regionCentroidX = regionInformation.centreX;
        regionCentroidY = regionInformation.centreY;
         
        areas(iterator, :) = regionArea;
        heights(iterator, :) = regionHeight;
        widths(iterator, :) = regionWidth;
        perimeters(iterator, :) = regionPerimeter;
        cenXs(iterator, :) = regionCentroidX;
        cenYs(iterator, :) = regionCentroidY;

    end

    featureArrays = [areas, heights, widths, perimeters, cenXs, cenYs];
end

