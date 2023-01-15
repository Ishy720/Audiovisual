function [] = displayIsolatedMeanColour(image, ptr)
    [~, ~, ~, D] = computeMeanColour(image, ptr);
    imshow(D < std(D(:)));
end