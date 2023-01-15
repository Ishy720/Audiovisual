function [] = displayVideo(videoStruct, videoWidth, videoHeight, frameRate)
    displayFigure = figure;
    set(displayFigure, "position", [150 150 videoWidth videoHeight]);
    movie(displayFigure, videoStruct, 1, frameRate);
end