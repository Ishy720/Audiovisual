function [croppedImage, array] = retrieveMouth(image)
    cropVector = mouthDetector(image);
    array = cropVector;
    if (length(cropVector) > 1)
        determinedVector = cropVector(1, :);
        for iterator = 1: size(cropVector)
            retrievedArray = cropVector(iterator, :);
            if (retrievedArray(2) > determinedVector(2))
                determinedVector = retrievedArray;
            end
        end
    end


    croppedImage = imcrop(image, determinedVector');
end 