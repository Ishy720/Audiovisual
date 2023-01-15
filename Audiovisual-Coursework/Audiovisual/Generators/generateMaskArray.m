function [array] = generateMaskArray(videoStruct, ptr)
    numFrames = length(videoStruct); 
    for iterator = 1: numFrames
        retrievedFrameImage = videoStruct(iterator).cdata;
        croppedImage = retrieveFace(retrievedFrameImage);
        imshow(croppedImage);
        imageReshape = reshape(croppedImage, 520, 520);
        [~, ~, ~, D] = computeMeanColour(imageReshape, ptr);
        placeholderArray(iterator, :, :) = D;
    end
    
    array = placeholderArray;
end