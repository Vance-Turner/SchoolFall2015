% A market has 60 customers per hour on average. What is the probability
% that more thant 20 people will wish to check out within a given
% quarter-hour period.

% Routine 1.3

q=0;
m=20;
lT = 15;
p = 1;
for k=1:m
    p = p*lT/k;
    q = q+p;
end;
q = q*exp(-lT);
1-q