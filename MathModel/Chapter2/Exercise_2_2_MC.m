% Exercise 2.2: Run MC Routine in page 23. Then write your own routine for
% the following cases.

% Routine 2.2
N = 10000; % Numer of trials
m = 0; % Mean failure time
m2 = 0; % The second moment
% We calculate standard deviation by using:
% (std dev)^2 = E[X^2] - E[X]
% Thus we simply average up the X^2 at each trial.
for i = 1:N
    % randn here generates normally distributed values with mean 0 and
    % std dev 1. Thus our mean times of device failures are 11, 12, 13
    % years with std dev of 1 2 and 3 years. Thus we are effectively
    % creating making our mean failure times normally distributed. 
    x = 11 + randn;
    y = 12 + 2*randn;
    z = 13 + 3*randn;
    w = min([x,y,z]); % Get the minimum failure time of the components.
    m = m + w/N; % Add trial to mean fail time, note true mean is: (t1 + t2 + t3 + ... tn)/N
    m2 = m2 + w*w/N; % Add trial to second moment
end;

disp('Mean and Standard Deviation for book code');
m
sd = sqrt(m2 - m*m)

% Case A: There are five devices T1, ...,T5 which have normal distributions
% with mean 11,12,13,15,16, and standard deviation 1,2,3,4,5, respectively.

% Solution: We reuse the approach above but use more devices and varying
% means and std dev.

N = 10000
m = 0;
m2 = 0;
for i = 1:N
    % Generate all the failure times.
    t1 = 11 + randn;
    t2 = 12 + 2*randn;
    t3 = 13 + 3*randn;
    t4 = 14 + 4*randn;
    t5 = 15 + 5*randn;
    % Determine which device caused us to fail
    w = min([t1,t2,t3,t4,t5]);
    % Alter the mean based on this failure time
    m = m + w/N;
    % Alter the Expected value of our failure times squared
    m2 = m2 + w*w/N;
end

disp('Mean and Standard Deviation for Case A');
m
sd = sqrt(m2 - m*m) % std dev = sqrt{E[X^2] - mean^2}
    
% Case B: Repeat (a) with uniform distribution instead. 
    
% Solution: We use rand which generates uniformly distributed random
% numbers on the interval 0 to 1. Thus their mean is: (0+1)/2 = 0.5. Their
% variance is (1-0)^2/12) = 1/12. Std dev is thus 1/sqrt{12} = 1/(2sqrt{3})
% We can transform this distribution into what we want by the following:
%
% (b-a)X + a ~ U(a,b) where a and b are the mean and std dev.

N = 10000;
m = 0;
m2 = 0;
for i = 1:N
    % Generate uniformly distributed failure times
    t1 = (1-11)*rand + 11;
    t2 = (2-12)*rand + 12;
    t3 = (3-13)*rand + 13;
    t4 = (4-14)*rand + 14;
    t5 = (5-15)*rand + 15;
    % Determine which device failued
    w = min([t1,t2,t3,t4,t5]);
    % Alter mean
    m = m + w/N;
    % Alter expected value of failuter times squared
    m2 = m2 + w*w/N;
end

disp('Mean and Standard Deviation for Case B');
m
sd = sqrt(m2 - m*m)