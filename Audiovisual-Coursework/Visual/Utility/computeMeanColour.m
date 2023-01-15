function [R, G, B, D] = computeMeanColour(image, ptr)
    videoFrame = double(image);
    R = videoFrame(:, :, 1);
    G = videoFrame(:, :, 2);
    B = videoFrame(:, :, 3);
    foregroundRegionMeanColour = [mean(R(ptr)) mean(G(ptr)) mean(B(ptr))];
    D = (sqrt((videoFrame(:, :, 1) - foregroundRegionMeanColour(1)) .^ 2 + (videoFrame(:, :, 2) - foregroundRegionMeanColour(2)) .^ 2 + (videoFrame(:, :, 3) - foregroundRegionMeanColour(3)) .^2));
end

% Cross reference D calculation with lab code.
