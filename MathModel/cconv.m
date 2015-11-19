function [ z ] = cconv( x,y )
%cconv Performs circular convolution on x and y
%   Detailed explanation goes here

% Get the number of entries in x, which will determine how large z is.
n = size(x,2);
ySize = size(y,2);
z = zeros(1,n);

% Outer loop fills entries in z
for k = 0:n-1
    sm = 0;
    % Inner loop builds entries in z
    yUsed = zeros(1,ySize);
    for j = 0:n-1
        % Determine what the y-index should be, book instructions are
        % incorrect for this step.
        yIndex = mod(k-j,ySize);
        xIndex = mod(j,n);
        sm = sm + x(1,xIndex+1)*y(1,yIndex+1);
        yUsed(1,j+1) = y(1,yIndex+1);
    end
    z(k+1) = sm;
end
end

