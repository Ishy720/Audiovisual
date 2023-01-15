function [croppedImage] = cropImage(image)
    cropVector = faceDetector(image);
    croppedImage = imcrop(image, cropVector');
end
