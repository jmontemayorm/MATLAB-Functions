function strTime = min2timeString(mins)
    strTime = sprintf("%i h %i min",floor(mins/60),mod(mins,60));
end

