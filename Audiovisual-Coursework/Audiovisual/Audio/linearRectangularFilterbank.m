function filterBank = linearRectangularFilterbank(magnitudeSpectralVector, filterBankChannelsAmount)
	vectorLength = length(magnitudeSpectralVector);
    disp(vectorLength);
	sampleLength = vectorLength / filterBankChannelsAmount;
	initialDivider = 1;
	for filterBank = 1: filterBankChannelsAmount
		if filterBank ~= 1
			initialDivider = (sampleLength * (filterBank - 1)) + 1;
        end
		fbank(filterBank) = sum(magnitudeSpectralVector(initialDivider:sampleLength*filterBank));
    end
    filterBank = fbank;
end
