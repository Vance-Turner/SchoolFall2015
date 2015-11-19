% Exercise 1: Using Monte Carlon to find the integral of Example in page
% 22, within an error of 10^-5, what is N?

% The integral we have is: \int_0_1 exp(-x^3) dx


pointsInside = 0;

% These are variables for each calculation.
newPointsInside = 0;

counter = 0;

newRatio = 1; % Dummy values to force computation!
oldRatio = 0;

innerBlockRun = 100; % How many throws of the dart we should do before finishing

while (abs(newRatio - oldRatio)>10E-5) && (counter < 1E6)
    % Reset points inside, outside..
    pointsInside = newPointsInside;
    
    % We try so many throws of the dart. Because we could repeatedly throw
    % the dart into integral area, we cannot compare the ratio of old and
    % new integrals after every throw: many would be zero. Thus, we try a
    % reasonable number of throws and then compare the ratio.
    innerCounter = 0;
    while innerCounter < innerBlockRun
        % Generate a random coordinate
        x = rand;
        y = rand;
        % Get value on curve for the x value of the coordinate
        yTrue = exp(-x^3);
        
        % Compare to see if our random coordinate is above or below the
        % curve
        if yTrue > y
            newPointsInside = newPointsInside + 1;
        end
        innerCounter = innerCounter + 1;
    end
    
    counter = counter + innerBlockRun;
    % Build the new ratios! (Note the size of the integral area is 1*1=1)
    oldRatio = pointsInside/counter;
    newRatio = newPointsInside/counter;
    
    counter;
end

newRatio
error = abs(oldRatio - newRatio)