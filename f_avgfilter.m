I = imread('coins.png');
h = ones(5,5) / 25;
I2 = imfilter(I,h);
subplot(1,2,1),imshow(I);
title('Original Image');
subplot(1,2,2),imshow(I2);
title('Filtered Image');