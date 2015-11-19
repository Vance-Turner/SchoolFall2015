% MTH 6060
% Vance Turnewitsch
% Routine 3.1


fS = 1000;
T = 1/fS;
f= 0:fS;
o = 2*pi*f;
w = exp(-i*o*T);
N = (w-exp(120*pi*i/720))*(w-exp(-120*pi*i/720))
N = N/((w-0.9*exp(120*pi*i/720))*(w-0.9*exp(-120*pi*i/720))); % The top part of transfer function
D = 1; % Transfer function denominator
H = N./D; % The transfer function, ./ makes component wise.
r = abs(H);
phi = angle(H);
polar(phi,r);