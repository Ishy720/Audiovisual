% numFrames is usually a calculation of: floor(numSamples/frameLength)
% ~, since we're not using the second return value of magAndPhase we can
% just replace the value with ~
function idealBinaryMask = constructBinaryMask(x, d, frameLength, numFrames, numBins)
    h = hann(frameLength);
    for frame = 1:numFrames
        startSample = ((frame - 1) * frameLength / 2) + 1;
        endSample = (startSample + frameLength - 1);
        xx = x(startSample:endSample);
        dd = d(startSample:endSample);
        speechFrame = h .* xx;
        noiseFrame = h .* dd;
        [speechMagnitude, ~] = magAndPhase(speechFrame);
        [noiseMagnitude, ~] = magAndPhase(noiseFrame);
        
        for bin = 1:numBins
            if speechMagnitude(bin) > noiseMagnitude(bin)
                idealBinaryMask(frame, bin) = 1;
            else
                idealBinaryMask(frame, bin) = 0;
            end
        end
    end
end

%imshow(idealBinaryMask) will show the mask.
