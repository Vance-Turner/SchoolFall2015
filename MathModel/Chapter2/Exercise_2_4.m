% Exercise 2.4: Write a Matlab routine to generate N(0,1) (e.g., find mean
% and variance) using "rand", and then compare your results with "randn".
% Test also your results in 2(a).

% Solution: Our usual solution of using the inverse transformation isn't
% going to work simply because we have here a rather nasty cumulative
% distribution function for the normal distribution.
%
% We thus proceed to use the Box-Muller transformation:
% Given two uniformly distributed random variables: u1, u2 we can find to
% normaly distributed random variables:
%
% z1 = sqrt{-2*ln(u1)}*cos(2*pi*u2)
% z2 = sqrt{-2*ln(u1)}*sin(2*pi*u2)

N = 1E7;
mean = 0;
moment = 0;

% The calculated mean and moments using randn function
meanRN = 0;
momentRN = 0;

for i = 1:N
    % Generate to uniformly distributed random numbers
    u1 = rand;
    u2 = rand;
    % Transform to normaly distributed random numbers via Box-Muller
    z1 = sqrt(-2*log(u1))*cos(2*pi*u2);
    z2 = sqrt(-2*log(u1))*sin(2*pi*u2);
    % Alter mean
    mean = mean + z1/N;
    % Alter moment
    moment = moment + z1*z1/N;
    
    % Now do it again using the randn function
    x = randn;
    meanRN = meanRN + x/N;
    momentRN = momentRN + x*x/N;
end

variance = moment - mean*mean;
varianceRN = momentRN - meanRN*meanRN;

txt = sprintf('Calculated mean, variance vs randn mean variance:(%d,%d) vs (%d,%d)',mean,variance,meanRN,varianceRN);
txt2 = sprintf('Error using transformation: (%d,%d)',abs(mean-meanRN),abs(variance-varianceRN));

disp(txt);
disp(txt2);

% Now we test our results from 2A. We simply transform the results. :)
% We copy over the code from 2A but now use our code from above (slightly
% alterted) generate the normal numbers.
N = 1E4;
m = 0;
m2 = 0;

mRN = 0;
m2RN = 0;
for i = 1:N
    % Generate all the failure times.
    t1 = 11 + boxMullerTrans;
    t2 = 12 + 2*boxMullerTrans;
    t3 = 13 + 3*boxMullerTrans;
    t4 = 14 + 4*boxMullerTrans;
    t5 = 15 + 5*boxMullerTrans;
    % Determine which device caused us to fail
    w = min([t1,t2,t3,t4,t5]);
    % Alter the mean based on this failure time
    m = m + w/N;
    % Alter the Expected value of our failure times squared
    m2 = m2 + w*w/N;
    
    % Now we do it again using randn this time for comparison
    % Generate all the failure times.
    t1 = 11 + randn;
    t2 = 12 + 2*randn;
    t3 = 13 + 3*randn;
    t4 = 14 + 4*randn;
    t5 = 15 + 5*randn;
    % Determine which device caused us to fail
    w = min([t1,t2,t3,t4,t5]);
    % Alter the mean based on this failure time
    mRN = mRN + w/N;
    % Alter the Expected value of our failure times squared
    m2RN = m2RN + w*w/N;    
end

disp('Mean failure time results>');
m;
sd = sqrt(m2 - m*m); % std dev = sqrt{E[X^2] - mean^2}

sdRN = sqrt(m2RN - mRN*mRN);

txt = sprintf('Mean failure time and std vs randn versions:(%d,%d) vs (%d,%d)',m,sd,mRN,sdRN);
txt2 = sprintf('Error in failure time and std:(%d,%d)',abs(m-mRN),abs(sd-sdRN));

disp(txt);
disp(txt2);