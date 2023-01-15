function noiseScalingTerm = calculateNoiseScalingTerm(speechAudioData, noiseAudioData)
    noisePower = calculateSNRComponent(noiseAudioData);
    speechPower = calculateSNRComponent(speechAudioData);
    calculatedSNR = 10 * log10(speechPower / noisePower); 
    noiseScalingTerm = sqrt((speechPower / noisePower) * (10 .^ -(calculatedSNR / 10)));
end
