% This script test cconv2 against Routine 4_3
figure;
h = [];
h(1) = subplot(2,2,1);
h(2) = subplot(2,2,2);
h(3) = subplot(2,2,3);
h(4) = subplot(2,2,4);
X = imread('Chapter4\Koala_micro.jpg');
X = double(X);
Y = X(:,:,1) + X(:,:,2);
Y = (Y(:,:)+X(:,:,3))/3;
X = Y/3;
X = round(X);
[m,n] = size(X);
image(X,'Parent',h(1));
title(h(1),'Original Image');
image(X,'Parent',h(3));
title(h(3),'Original Image');
axis off
colormap gray
% Now do tests
B = rand(m,n);
tic;
Y = cconv2(B,X);
% Now rescale the image
Z = Y/(m*n);
a = min(min(Z));
Z = Z-a;
b = max(max(Z));
Z = 65*Z/b;
t2 = toc;
image(Z,'Parent',h(4));
title(h(4),strcat('2D Convolution:',num2str(t2),'s'));
axis off
colormap gray
% Run routine 4.3
tic;
Y = Routine4_3(X,B);
% Now rescale the image
Z = Y/(m*n);
a = min(min(Z));
Z = Z-a;
b = max(max(Z));
Z = 65*Z/b;
t2 = toc;
image(Z,'Parent',h(2));
title(h(2),strcat('DFT: ',num2str(t2),'s'));
axis off
colormap gray