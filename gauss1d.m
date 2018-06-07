function y = gauss1d(x,sig,c)
    y = exp(-(x-c).^2/(2*sig.^2));
end

