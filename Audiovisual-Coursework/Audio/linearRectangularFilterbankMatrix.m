function filterBankMatrix = linearRectangularFilterbankMatrix(magnitudeSpectralVector, filterBankChannelsAmount)
    vectorLength = length(magnitudeSpectralVector);
	sampleLength = vectorLength / filterBankChannelsAmount;
    initialDivider = 1;
	for filterBank = 1: filterBankChannelsAmount
        if filterBank ~= 1
			initialDivider = (sampleLength * (filterBank - 1)) + 1;
        end
        r = zeros(1, vectorLength);
        r(initialDivider:sampleLength*filterBank) = 1; 
        fbank(filterBank) = r * magnitudeSpectralVector;
    end
    filterBankMatrix = fbank;
end

% 8 Channels
% filterBankInput = calculatedMagnitude(1:256);
% filterBankMatrixVector = linearRectangularFilterbankMatrix(filterBankInput, 8);
