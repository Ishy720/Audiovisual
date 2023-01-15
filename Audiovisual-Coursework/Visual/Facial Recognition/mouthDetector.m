function [mouthDetections] = mouthDetector(image)
    detector = vision.CascadeObjectDetector("Mouth");
    detector.MergeThreshold = 50;
    mouthBoxes = detector(image);
    mouthDetections = mouthBoxes;
end

