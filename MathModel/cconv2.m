function [ Z ] = cconv2( X,Y )
%UNTITLED2 Performs 2D convolution on the matrices X and Y
%   Detailed explanation goes here

Xrows = size(X,1);
Xcols = size(X,2);
Yrows = size(Y,1);
Ycols = size(Y,2);

Z = zeros(Xrows,Xcols);
for i = 0:Yrows
    for j = 0:Ycols
        sm = 0;
        % Note we use indexing by 0 instead of 1 by convention
        for p = 0:Yrows
            for q = 0:Ycols
                hx = mod(p,Yrows);
                hq = mod(q,Ycols);
                
                ximp = mod(i-p,Xrows);
                xjmq = mod(j-q,Xcols);
                
                % MatLab uses indexing by 1, thus transform.
                sm = sm + Y(hx+1,hq+1)*X(ximp+1,xjmq+1);
            end
        end
        Z(i+1,j+1) = sm;
    end
    i
end
end

