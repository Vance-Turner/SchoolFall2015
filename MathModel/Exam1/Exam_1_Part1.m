% MATH 6060 -- Exam 1 Part 1 -- Vance Turnewitsch
% A: Write a Matlab routine to calculate \int a_b f(x) dx by Monte Carlo
% Method

% First, we get the function to be integrated.
fxName = input('Enter function to integrate>','s');
if exist(fxName)
    fx = str2func(fxName);
    % Now we get the bounds of integration
    a = input('Enter the lower bound of integration>');
    b = input('Enter the upper bound of integration>');
    if a > b || abs(a-b) < 10E-5
        disp('Bad bounds!');
        exit();
    end
    accuracy = input('Enter number order of accuracy>');
    integral = 0;
    % Now we must start integrating the various sections of this function
    % determined by which parts of positive and negative.
    b0 = a;
    totalIterations = 0;
    while b0 < b
        zeroFound = false;
        % We search for a zero from a up to b
        while b0 < b && zeroFound == true
            testY = fx(b0); % Get the function at this upper bound
            if abs(testY - 0) < 10E-6 % Determine if it is close enough to zero
                zeroFound = true;
            else
                b0 = b0 + (b-a)/10000; % Increment the b0 a little bit
            end
        end
        % If we didn't find a zero, then clamp to final point
        if zeroFound == false
            b0 = b;
        end
        % Now we perform MC integration within this a, b0
        % Now we must determine the size of our box. First, test to determine
        % if we are integrating over a negative or positive area.
        if fx((b0-a)/2) > 0
            intIsPositive = true;
        else
            intIsPositive = false;
        end
        if intIsPositive == true
            % Find the max for box height
            pts = zeros(1,10000);
            for i = 1:10000
                pts(1,i) = fx((b0-a)/10000*i);
            end
            boxHeight = max(pts);
        else
            % Integral area is negative, so get minimum of the function
            boxHeight = fminbnd(fx,a,b0);
        end
        boxWidth = b0-a;
        % Ok, time to integrate!
        pointsInside = 0;
        totalPoints = 0;
        goOn = true;
        innerTestCount = 100;
        while goOn == true
            if (totalPoints == 0)==false
                oldIntegral = boxWidth*boxHeight*pointsInside/totalPoints;
            else
                oldIntegral = 1E6; % Crazy integral!
            end
            % We do a certain number of MC tests before comparing the integrals
            % for convergence
            for i = 1:innerTestCount
                % generate test point
                testX = a + boxWidth*rand(); % Generate uniformly distributed point on the interval a to b0
                testY = boxHeight*rand();
                % Generate point on curve
                trueY = fx(testX);
                pointGood = false;
                % Now test the point!
                if (intIsPositive) == true && (testY < trueY)
                    pointGood = true;
                elseif (intIsPositive == false) && (testY > trueY)
                    pointGood = true;
                end
                % Now we increment the good point inside if this test point
                % worked.
                if pointGood == true
                    pointsInside = pointsInside + 1;
                end
                % Keep track of total points tests
                totalPoints = totalPoints + 1;
            end
            totalIterations = totalIterations + innerTestCount;
            % So, the batch of tests is done, let's see if we converged
            newIntegral = boxWidth*boxHeight*pointsInside/totalPoints;
            disp( sprintf('The integral is>%d after %d iterations.',newIntegral,totalIterations) );
            if abs(newIntegral - oldIntegral) < accuracy
                goOn = false;
            end
        end
        % Update the integral, should be negative from negative boxHeight!
        integral = integral + newIntegral;
        % Update lower bound
        a = b0;
    end
    disp(sprintf('Finished!>The integral is>%d after %d iterations.',integral,totalIterations));
else
    disp('Bad Function Name, exiting...');
end

