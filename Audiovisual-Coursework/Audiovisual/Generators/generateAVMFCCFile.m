function [vector] = generateAVMFCCFile(inputVideo, inputAudio, fileName)

    [audioData, ~] = audioread(inputAudio + ".wav");

    % -------- AUDIO MFCC CONSTRUCTION   --------%
    numFilters = 20;
    audioFeatureLength = 14;
    visualFeatureLength = 46;
    audioVisualFeatureLength = visualFeatureLength + audioFeatureLength;
    frameLength = 320;

    sampleSize = length(audioData);
    numFrames = floor(sampleSize / frameLength);
    audioVector = zeros(numFrames, audioFeatureLength);

    for frame = 1: numFrames * 2 - 1

        firstSample = ((frame - 1) * frameLength / 2) + 1;
        lastSample = (firstSample + frameLength) - 1;
        shortTimeFrame = audioData(firstSample:lastSample);
        energyComponent = log(sum(shortTimeFrame .^ 2));
        [magnitudeSpectrum, ~] = magAndPhase(shortTimeFrame);
        halfedMagSpec = magnitudeSpectrum(1:floor(length(magnitudeSpectrum) / 2));
        filterBank = triangleFilterBank(numFilters, length(halfedMagSpec), halfedMagSpec);
        finalizedFilterBank = (filterBank * halfedMagSpec')';

        for iterator = 1: length(finalizedFilterBank)
            if (finalizedFilterBank(iterator) == 0)
                finalizedFilterBank(iterator) = 0.0001;
            end
        end

        loggedFilterBank = log(finalizedFilterBank);
        transformedFilterBank = dct(loggedFilterBank);
        truncatedFilterBank = transformedFilterBank(:, 1:audioFeatureLength);

        truncatedFilterBank(:, audioFeatureLength) = energyComponent;
        audioVector(frame, :) = truncatedFilterBank;
    end


    % -------- VISUAL MFCC CONSTRUCTION   --------%
    videoStruct = readVideo(inputVideo + ".mp4");
    generatedPCA = DCTFeatureExtraction(videoStruct);
    featureArray = generateFeatureArray(videoStruct);
    normalizedFeatureArray = normalizeFeatures(featureArray);
    visualVector = [normalizedFeatureArray generatedPCA];
    
    interpolatedVector = visualFeatureInterpolation(visualVector, numFrames * 2 - 1);
    superVector = [audioVector interpolatedVector];  
    vector = superVector;

    fid = fopen(fileName, 'w', 'ieee-be');
    fwrite(fid, numFrames * 2, 'int32'); % number of vectors in file (4 byte int)
    fwrite(fid, 100000, 'int32'); % sample period in 100ns units (4 byte int)
    fwrite(fid, audioVisualFeatureLength * 4, 'int16'); % number of bytes per vector (2 byte int) 
    fwrite(fid, 6, 'int16'); % code for the sample kind (2 byte int)

    for i = 1: numFrames * 2 - 1
        for j = 1:audioVisualFeatureLength
            fwrite(fid, superVector(i, j), 'float32');
        end
    end
end