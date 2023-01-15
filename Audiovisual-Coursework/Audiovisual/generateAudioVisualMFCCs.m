function [] = generateAudioVisualMFCCs()
    audioDirectory = "TrimmedAudio/";
    videoDirectory = "TrimmedVideos/";
    vFileName = strcat(videoDirectory, "NamesVideo");
    aFileName = strcat(audioDirectory, "NamesVideo");
    mfcFN = "NamesVideo";
    for iterator = 1: 20
        videoFileName = strcat(strcat(vFileName, string(iterator)), "Trimmed");
        audioFileName = strcat(strcat(aFileName, string(iterator)), "Trimmed");
        mfcFileName = strcat(mfcFN, string(iterator));
        vector = generateAVMFCCFile(videoFileName, audioFileName, mfcFileName);
    end
end

