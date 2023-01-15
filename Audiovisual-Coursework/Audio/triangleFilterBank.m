function [fbank] = triangleFilterBank(n, k, magSpec, truncation)
    %   TRIANGLEFBANK return a filterbank
    %   n filters, k frequency coefficients, magSpec magnitude spectrum
    
    if nargin < 4
        truncation = 1;
    end

    % Inline conversion functions
    f2m = @(x) 2595 .* log10(1 + (x./700));
    m2f = @(x) 700 .* (10 .^ (x./2595) - 1);

    % convert the freq in Hz to MEL.
    initialMel = f2m(0);
    lastMel = f2m(8000);

    x_mel = linspace(initialMel, lastMel, n + 2);
    x_hz = m2f(x_mel);

    fbank = zeros(n, k);
    bin = floor(1 + k * x_hz / 8000);
    bin(n + 2) = k;

    for j = 1:n
        for i = bin(j):bin(j+1)
             fbank(j, i) = (i - bin(j)) / (bin(j+1)-bin(j));
        end
        for i = bin(j+1):bin(j+2)
             fbank(j, i) = (bin(j+2) - i) / (bin(j+2)-bin(j+1));
        end
    end
%     keyboard;
%     fbanked = (fbank * magSpec')';
%     
%     for index = 1: length(fbanked)
%         if fbanked(index) == 0
%             fbanked(index) = 0.1;
%         end
%     end
%     
%     loggedFBank = log(fbanked);
%     dctFBank = dct(loggedFBank);
%     resultantFBank = dctFBank(1:floor(length(fbanked)*truncation));
end
