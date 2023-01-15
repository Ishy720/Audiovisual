function [shortTimeMag, shortTimePhase] = magAndPhase(speechFrame)
	hammedWindow = hamming(length(speechFrame));
    frame = speechFrame .* hammedWindow';
	complexSpectrum = fft(frame);
	magnitudeSpectrum = abs(complexSpectrum);
	phaseSpectrum = angle(complexSpectrum);
	shortTimeMag = magnitudeSpectrum;
	shortTimePhase = phaseSpectrum;
end

% audioData = This is our audio data from our voice recording.
% (22760:22760+320-1) = Grabs a section of our voice, of 320 samples.
% .* is matrix multiplication.
% [calculatedMagnitude, calculatedPhase] = magAndPhase(audioData(22760:22760+320-1));
