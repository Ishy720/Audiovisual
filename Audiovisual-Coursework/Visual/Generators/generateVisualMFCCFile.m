function [vector] = generateVisualMFCCFile(inputVideo, inputAudio, generatedMFCCName)
    videoStruct = readVideo(inputVideo + ".mp4");
    generatedPCA = DCTFeatureExtraction(videoStruct);
    featureArray = generateFeatureArray(videoStruct);
    normalizedFeatureArray = normalizeFeatures(featureArray);
    vector = [normalizedFeatureArray generatedPCA];
    
    [audio, ~] = audioread(inputAudio + ".wav");
    sampleSize = length(audio);
    frameLength = 320;
    numFrames = floor(sampleSize / frameLength);
    
    interpolatedVector = visualFeatureInterpolation(vector, numFrames * 2);
    
    featureLength = 46;

    fileName = generatedMFCCName + ".mfc";
    fid = fopen(fileName, 'w', 'ieee-be');
    fwrite(fid, numFrames * 2, 'int32'); % number of vectors in file (4 byte int)
    fwrite(fid, 100000, 'int32'); % sample period in 100ns units (4 byte int)
    fwrite(fid, 46 * 4, 'int16'); % number of bytes per vector (2 byte int) 
    fwrite(fid, 6, 'int16'); % code for the sample kind (2 byte int)

    for i = 1: numFrames * 2 - 1
        for j = 1:featureLength
            fwrite(fid, interpolatedVector(i, j), 'float32');
        end
    end
end
