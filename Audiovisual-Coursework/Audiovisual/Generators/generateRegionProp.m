function [rpStruct] = generateRegionProp(videoStruct, frameNum)
    lowerBoundThreshold = 25;
    higherBoundThreshold = 150;
    grayedImage = generateGrayedImage(videoStruct, frameNum);
    contrastedImage = imadjust(grayedImage);
    segregatedImage = (contrastedImage > lowerBoundThreshold & contrastedImage < higherBoundThreshold);
    closedImage = bwmorph(segregatedImage, "close");
    rpStruct = regionprops(closedImage, "Centroid", "Area", "Perimeter", "BoundingBox");
end

