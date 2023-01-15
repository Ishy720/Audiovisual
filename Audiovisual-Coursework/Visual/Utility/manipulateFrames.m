function [generatedArray] = manipulateFrames(videoStruct)
    numFrames = length(videoStruct); 
    for iterator = 1: numFrames
        retrievedFrameImage = videoStruct(iterator).cdata;
        manipulatedImage = retrievedFrameImage;
        manipulatedImage(:, :, 1) = uint8(0.65 * double(retrievedFrameImage(:, :, 1)));
        constructedArray(iterator, :, :, :) = manipulatedImage;
    end

    generatedArray = constructedArray;
end

