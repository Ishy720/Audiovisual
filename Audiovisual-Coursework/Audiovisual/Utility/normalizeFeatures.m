function [normalizedFeatures] = normalizeFeatures(featureArray)

areas = featureArray(:, 1);
heights = featureArray(:, 2);
widths = featureArray(:, 3);
perimeters = featureArray(:, 4);
cenXs = featureArray(:, 5);
cenYs = featureArray(:, 6);

normalizedAreas = normalize(areas, "range", [-1 1]);
normalizedHeights = normalize(heights, "range", [-1 1]);
normalizedWidths = normalize(widths, "range", [-1 1]);
normalizedPerimeters = normalize(perimeters, "range", [-1 1]);
normalizedCenXs = normalize(cenXs, "range", [-1 1]);
normalizedCenYs = normalize(cenYs, "range", [-1 1]);

normalizedFeatures = [normalizedAreas, normalizedHeights, normalizedWidths, normalizedPerimeters, normalizedCenXs, normalizedCenYs];

end