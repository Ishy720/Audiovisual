% Implemented functional truncation.
% Implemented higher amount of filter banks, originally 8, now 20. Will be
% 21 with energy component/

function [vector] = generateMFCCFile(inputFile, fileName)
    [audioData, fs] = audioread(inputFile);
    sampleSize = length(audioData);
    frameLength = 320;
    numFrames = floor(sampleSize / frameLength);
    %fs=16000;
    nfilts = 20;
    tsize = 14;
    vector = zeros(numFrames, tsize);
    
    for frame = 1:numFrames*2-1

        firstSample = ((frame - 1) * frameLength / 2) + 1;
        
        lastSample = (firstSample + frameLength) -1;
        shortTimeFrame = audioData( firstSample:lastSample);  
        magSpec = magAndPhase(shortTimeFrame);
        halfedMagSpec = magSpec(1:floor(length(magSpec) / 2));
        fbank = triangleFilterBank(nfilts, length(halfedMagSpec), halfedMagSpec);
        % + 1 for energy component, may be incorrect.
        fbanked = (fbank * halfedMagSpec')';

        % Clean up trailing zeros in test and training data, and re train.
        % This function shouldnt be needed once cleaning is complete.
        % But will keep function anyway.
        for index = 1: length(fbanked)
            if fbanked(index) == 0
                fbanked(index) = 0.0001;
            end
        end

        loggedFBank = log(fbanked);
        dctFBank = dct(loggedFBank);
        truncated = dctFBank(:, 1:tsize);
        
%         truncation = 1;
%         resultantFBank = dctFBank(1:floor(length(fbanked) * truncation));
        energyComponent = log(sum(shortTimeFrame .^ 2));
        truncated(:, tsize) = energyComponent;
        vector(frame, :) = truncated;
        %writeProtoFile(fileName, 8, size(vector));
    end
    
    fid = fopen(fileName, 'w', 'ieee-be');
    % Write the header information%
    fwrite(fid, numFrames * 2, 'int32'); % number of vectors in file (4 byte int)
    fwrite(fid, 100000, 'int32'); % sample period in 100ns units (4 byte int)
    fwrite(fid, tsize * 4, 'int16'); % number of bytes per vector (2 byte int) 
    fwrite(fid, 6, 'int16'); % code for the sample kind (2 byte int)
    % Write the data: one coefficient at a time:
    for i = 1: numFrames * 2-1
        for j = 1:tsize
            fwrite(fid, vector(i, j), 'float32');
        end
    end
    
end

