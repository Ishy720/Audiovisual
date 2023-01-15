function [resultantFBank] = triangleFilterBank(n, k, magSpec, truncation)
    %   TRIANGLEFBANK return a filterbank
    %   n filters, k frequency coefficients
    %   loHz: minimum frequency (usually zero)
    %   hiHz: maximum frequency of magspec (e.g. 8000 for fs=16000)
    
    if nargin < 4
        truncation = 1;
    end

    % Inline conversion functions
    f2m = @(x) 2595 .* log10(1 + (x./700));
    m2f = @(x) 700 .* (10 .^ (x./2595) - 1);

    % convert the freq in Hz to MEL.
    melConversion = f2m(magSpec);

    x_mel = linspace(melConversion, n + 2);
    x_hz = m2f(x_mel);

    fbank = zeros(n, k);
    bin = floor(1 + k * x_hz / hiHz);
    bin(n + 2) = k;

    for j = 1:n
        for i = bin(j):bin(j+1)
             fbank(j, i) = (i - bin(j)) / (bin(j+1)-bin(j));
        end
        for i = bin(j+1):bin(j+2)
             fbank(j, i) = (bin(j+2) - i) / (bin(j+2)-bin(j+1));
        end
    end
    
    loggedFBank = log(fbank);
    dctFBank = dct(loggedFBank);
    resultantFBank = dctFBank(1:floor(length(fbank)*truncation));
end
