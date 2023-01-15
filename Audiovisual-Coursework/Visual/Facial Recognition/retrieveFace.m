function [croppedImage] = retrieveFace(image)
    cropVector = faceDetector(image);
    croppedImage = imcrop(image, cropVector(1, :)');
end
