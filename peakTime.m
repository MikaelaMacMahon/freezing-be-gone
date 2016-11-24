function time = peakTime(Ax)
       %look at peak values instead of troughs -> fix code
    %Az = data(:,3); %get z acceleration
    B = 1/4*ones(4,1);
    out = filter(B,1,Ax);
    t = (1:length(out))*0.033;
    plot(t, out);
    time = [];
    prevTime = 0;
    curTime = 0;
    dt = 0.033;
    curMax = 0;
    next = 0;
    first = 1;
    %find previous peak, subtract that value from the current peak -> that
    %will be the time interval 
    for i = 1:length(out)
        if out(i) > -12000
            if out(i) > curMax
                curMax = out(i);
               % curMax
                curTime = dt*i;
            end
            next = 1;  
        end
        if (out(i) < -15000) && (next == 1)
            curTime
            prevTime
            if first == 0
                diff = curTime - prevTime;
                time = [time diff];
            end
            next = 0;
            first = 0;
            prevTime = curTime;
            %add a first variable
        end
        curMax = -100000000;
    end
end 
            
            
        
