function [calculatedDCT, reconstructedImage] = calculate2dDCT(inputImage)
    calculatedDCT = dct2(inputImage);
    reconstructedImage = idct2(calculateDCT);
    reconstructedImage = rescale(reconstructedImage);
    imshow(log(abs(calculatedDCT)), [], "colormap", jet(64));
end
