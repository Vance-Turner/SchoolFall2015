function [ Y ] = Routine4_3( X,B)
%UNTITLED3 

[m,n] = size(X);
%B = rand(m,n);
Xhat = fft2(X);
Bhat = fft2(B);
Yhat = Bhat.*Xhat;
Y = ifft2(Yhat);
Y = real(Y);
Y = round(Y);
end

