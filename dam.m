clear; clc;
a=imread('cameraman.tif');
k =[1 0 -1;1 0 -1;1 0 -1];
H = convolve(a, k)
subplot(3,1,1),imshow(a);
title('original image');
subplot(3,1,2),imshow(uint8(H));
title('without using tool');
x1=a(1:256,1:256);
y1=conv2(x1,k);
subplot(3,1,3),imshow(uint8(y1));
title('using tool');
subplot(1,2,1),bar(uint8(H),.90,'black');
title('without using tool');
subplot(1,2,2),bar(uint8(H),.90,'black');
title('using tool');
