for fileNumber = 1:10
    disp("Please speak and I will record it, each recording lasts for 5 seconds in total.");
    record(r);
    pause(5);
    stop(r);
    audioDataArray = getaudiodata(r, "double");
    xNorm = 0.99 * audioDataArray / max(abs(audioDataArray));
    audiowrite("speech" + fileNumber + ".wav", xNorm, 16000);
end
