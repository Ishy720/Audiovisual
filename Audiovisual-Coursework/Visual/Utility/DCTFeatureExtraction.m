function [generatedPCA] = DCTFeatureExtraction(videoStruct)
    numFrames = length(videoStruct);
    for iterator = 1: numFrames
        image = generateGrayedImage(videoStruct, iterator);
        dctImage = dct2(image);
        loggedDCTImage = log(abs(dctImage));
        croppedImage = loggedDCTImage(1:8, 1:8);
        flattenedImage = reshape(croppedImage, [1, 64]);
        DCTVector(iterator, :) = flattenedImage;
    end
    
    [~, score, ~, ~, ~] = pca(DCTVector);
    generatedPCA = score(:, 1:40);
end

