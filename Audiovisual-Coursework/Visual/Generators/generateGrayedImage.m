function [image] = generateGrayedImage(videoStruct, frameNum)
    retrievedFrameImage = videoStruct(frameNum).cdata;
    faceImage = retrieveFace(retrievedFrameImage);
    [mouthImage, ~] = retrieveMouth(faceImage);
    grayedImage = rgb2gray(mouthImage);
    image = grayedImage;
end

