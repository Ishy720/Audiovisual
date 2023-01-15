function [] = resampleAudio(inputAudioFile, desiredFrequency, newFileName)
    [audioData, fs] = audioread(inputAudioFile);
    audioData = resample(audioData, 16000, 44100);
    audiowrite(newFileName, audioData, desiredFrequency);
end