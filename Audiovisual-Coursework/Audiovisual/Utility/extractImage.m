function [image] = extractImage(imageArray, index)
    imageValue = imageArray(index, :, :);
    image = reshape(imageValue, 640, 800);
    imshow(image < std(image(:)));
end
