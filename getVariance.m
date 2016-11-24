function time = getVariance(signal)
    amp = [0 0 0];
    index = 1;
    curMax = -10000000;
    next = 0;
    maxThres = -8000;
    minThres = -10000;
    peaks = 0;
    variance = 0;
    v = [];
    first = 0;
    for i = 1:length(signal)
        if signal(i) > maxThres 
            if signal(i) > curMax
                curMax = signal(i);
                timeMax = i;
            end
            next = 1;  
        end
        if (signal(i) < minThres) && (next == 1) 
            amp(index) = curMax;
            peaks = peaks + 1;
            if(index <3)
                index = index + 1;
            else
                index = 1;
            end
            if peaks >= 4
                %if variance is greater than a threshold -> freezing
                variance = var(amp);
                v = [v var(amp)];
                if (variance > 15000000) && (first == 0)
                    time = timeMax;
                    first = 1;
                end 
            end
            curMax = -10000000;
            next = 0;
        end

    end
end