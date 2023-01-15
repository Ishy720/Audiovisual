function [] = plotHarrisPoints(image, pointsToReturn)
    convertedImage = rgb2gray(image);
    corners = detectHarrisFeatures(convertedImage);
    imshow(convertedImage);
    hold on
    plot(corners.selectStrongest(pointsToReturn));
end
