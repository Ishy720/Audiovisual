function [video] = readVideo(videoFileName)
    v = VideoReader(videoFileName);
    videoHeight = v.Height;
    videoWidth = v.Width;
    videoStruct = struct("cdata", zeros(videoHeight, videoWidth, 3, "uint8"), "colormap", []);

    iterator = 1;
    while hasFrame(v)
        videoStruct(iterator).cdata = readFrame(v);
        iterator = iterator + 1;
    end

    video = videoStruct;

end
