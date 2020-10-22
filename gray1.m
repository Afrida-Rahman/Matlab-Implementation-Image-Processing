
image = imread('peppers.png');

figure
subplot(1,3,1);
imshow(image);
title('Original Image');

subplot(1,3,2);
grayScaleImage = toGrayscale(image);
imshow(grayScaleImage);
title('Grayscale Image');

subplot(1,3,3);
imhist(grayScaleImage);
title('Histogram of Grayscale Image');