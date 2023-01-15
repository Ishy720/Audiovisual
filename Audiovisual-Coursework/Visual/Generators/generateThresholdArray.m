function [rpStructure] = generateThresholdArray(videoStruct)
    numFrames = length(videoStruct); 
    for iterator = 1: numFrames
        lowerBoundThreshold = 25;
        higherBoundThreshold = 150;
        retrievedFrameImage = videoStruct(iterator).cdata;
        faceImage = retrieveFace(retrievedFrameImage);
        [mouthImage, ~] = retrieveMouth(faceImage);
        grayedImage = rgb2gray(mouthImage);
        contrastedImage = imadjust(grayedImage);
        segregatedImage = (contrastedImage > lowerBoundThreshold & contrastedImage < higherBoundThreshold);
        closedImage = bwmorph(segregatedImage, "close");
        regionPropStructure = regionprops(closedImage, "Centroid", "Area", "Perimeter");
        imshow(closedImage);
    end

    rpStructure = regionPropArray;
end

% If array bounds are exceeded for either retrieveMouth or retrieveFace
% then the MergeThreshold is too aggressive and it didn't detect anything.