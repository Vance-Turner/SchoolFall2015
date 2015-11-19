% Exercise 2.3: Write a MC routine to compute (see Routine 2.1 in page 25)
% E[X] and sigma^2[X] with given CDF of X. Then test it using exponential
% distribution with various lambda. Run also Routine 2.1 in page 25.
% Compare the difference in results.

% Solution: We assume our given CDF is strictly increasing whenever it is
% nonzero and less than one. Then given the mean of this CDF we can find
% distributed values for it by the following:
%
% X = -aln(1-Y) where a is the mean and Y is a uniformly distributed
% variable on the interval: [0,1]
%
% We note that the exponential distribution is strictly increasing whenever
% it is nonzero and less than one. Thus, we can use our transformation if
% given the mean of the distribution.

N = 1E6;
meanCalc = 0;
moment = 0;
maxLambda = 1;
for lambda = 0.1:0.1:maxLambda
    mean = 1/lambda;
    meanCalc = 0;
    moment = 0;
    for i = 1:N
        % Get uniformly distributed value
        y = rand;
        % Transform this uniformly distributed value into another form
        x = -mean*log(1-y);
        % Determine mean
        meanCalc = meanCalc + x/N;
        % Determine moment used for calculating variance
        moment = moment + x*x/N;
    end
    variance = moment - meanCalc*meanCalc;
    txt = sprintf('For lambda: %d, calculated mean and variance are: %d, %d while error is: %d, %d',lambda,meanCalc,variance,abs(meanCalc-mean),abs(variance-1/lambda^2));
    disp(txt);
end