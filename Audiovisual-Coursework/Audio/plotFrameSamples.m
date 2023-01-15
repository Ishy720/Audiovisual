function plottedFrames = plotFrameSamples(audioData, frameLength)
    sampleSize = length(audioData);
    numFrames = floor(sampleSize / frameLength);
    for frame = 1:numFrames,
        firstSample = ((frame - 1) * frameLength / 2) + 1;
        lastSample = (firstSample + frameLength);
        shortTimeFrame = audioData( firstSample:lastSample);
        [magSpec, phaseSpec] = magAndPhase(shortTimeFrame);
        subplot(2, 1, 1);
        plot(magSpec);
        subplot(2, 1, 2);
        plot(phaseSpec);
    end
end
