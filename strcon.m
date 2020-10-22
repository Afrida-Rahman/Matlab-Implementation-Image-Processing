clc;  
clear;  
close all; 

grayImage = imread('riceblurred.png');
subplot(1, 3, 1);
imshow(grayImage);
axis on;
title('Original Gray Scale image');
set(gcf, 'Units', 'Normalized', 'Outerposition', [0, 0.05, 1, 0.95]);
%drawnow;
[counts, grayLevels] = imhist(grayImage);


cdf = cumsum(counts);
cdf = cdf / numel(grayImage);

index1 = find(cdf > 0.05, 1, 'first');
gl1 = grayLevels(index1)

index2 = find(cdf > 0.95, 1, 'first');
gl2 = grayLevels(index2)

subplot(1,3,3);imhist(grayImage);
subplot(1,3,2);
imshow(grayImage, [gl1, gl2]);
axis on;
title('Stretched Gray Scale image', 'FontSize', fontSize);