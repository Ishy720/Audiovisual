function [ptr] = defineRegion(videoStruct)
    image = videoStruct(1).cdata;
    croppedImage = cropImage(image);
    P = roipoly(croppedImage);
    ptr = find(P);
end

