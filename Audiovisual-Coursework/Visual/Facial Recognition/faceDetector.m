function [faceDetections] = faceDetector(image)
    detector = vision.CascadeObjectDetector("FrontalFaceLBP");
    detector.MergeThreshold = 25;
    faceBoxes = detector(image);
    faceDetections = faceBoxes;
end

