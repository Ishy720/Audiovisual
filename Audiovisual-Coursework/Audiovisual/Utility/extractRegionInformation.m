function [regionInformation] = extractRegionInformation(regionProp)
    regionCentroid = regionProp.Centroid;
    centreX = regionCentroid(1);
    centreY = regionCentroid(2);
    regionArea = regionProp.Area;
    regionPerimeter = regionProp.Perimeter;
    regionBound = regionProp.BoundingBox;
    width = regionBound(3);
    height = regionBound(4);
    regionInformation = struct("centreX", centreX, "centreY", centreY, "area", regionArea, "perimeter", regionPerimeter, "width", width, "height", height);
end

