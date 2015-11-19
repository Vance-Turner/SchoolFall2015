function [ num ] = boxMullerTrans(  )
%boxMullerTrans Generates normally distributed values along the interval
%[0,1] using the Box-Muller transformation of two uniformly random numbers.

    % Generate to uniformly distributed random numbers
    u1 = rand;
    u2 = rand;
    % Transform to normaly distributed random numbers via Box-Muller
    z1 = sqrt(-2*log(u1))*cos(2*pi*u2);
    z2 = sqrt(-2*log(u1))*sin(2*pi*u2);
    num = z1;
end

