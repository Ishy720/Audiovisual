% Lecture 9, Slide 10 => This function is the mathematic equivelant of the summation for Pspeech and Pnoise.
% When calculating speech power, only parts of the audio file where speech occurs should be included.
function noiseComponent = calculateSNRComponent(audioData)
    noiseComponent = mean(audioData .^ 2);
end
