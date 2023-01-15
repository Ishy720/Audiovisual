function maskedMagnitude = applyMask(frameLength, numFrames, idealBinaryMask)
    h = hann(frameLength);
    for frame = 1:numFrames
        startSample = ((frame - 1) * frameLength / 2) + 1;
        endSample = (startSample + frameLength);
        yy = y(startSample:endSample);
        noisyFrame = h * yy;
        [noisyMagnitude, ~] = magAndPhase(noisyFrame);
        maskedMagnitude(frame) = idealBinaryMask(frame) * noisyMagnitude;
    end
end

