image = imread('riceblurred.png');
stretched_Image = imadjust(image, stretchlim(image, [0.05, 0.95]),[]);
 
subplot(2,2,1), imshow(image), title('Original Image');
subplot(2,2,2), imshow(stretched_Image), title('Strethced Image');
subplot(2,2,3), imhist(image), title('Histogram of Original Image');
subplot(2,2,4), imhist(stretched_Image), title('Histogram of Stretched Image');

clc;  % Clear command window.
clear;  % Delete all variables.
close all;  % Close all figure windows except those created by imtool.
imtool close all;  % Close all figure windows created by imtool.
workspace;  % Make sure the workspace panel is showing.
fontSize = 25;
grayImage = imread('pout.tif');
subplot(2, 2, 1);
imshow(grayImage);
axis on;
title('Original Gray Scale image', 'FontSize', fontSize);
% Enlarge figure to full screen.
set(gcf, 'Units', 'Normalized', 'Outerposition', [0, 0.05, 1, 0.95]);
drawnow;
% Get histogram.
[counts, grayLevels] = imhist(grayImage);
% Get cdf.
cdf = cumsum(counts);
cdf = cdf / numel(grayImage);
% Find gray level of 5%.
index1 = find(cdf > 0.05, 1, 'first');
gl1 = grayLevels(index1)
% Find gray level of 95%.
index2 = find(cdf > 0.95, 1, 'first');
gl2 = grayLevels(index2)
% Plot histogram.
subplot(2, 2, 2);
bar(grayLevels, counts, 'barWidth', 1);
% grid on;
% hold on;
% line([gl1, gl1], ylim, 'Color', 'r', 'LineWidth', 2);
% line([gl2, gl2], ylim, 'Color', 'r', 'LineWidth', 2);
title('Histogram', 'FontSize', fontSize);
% Plot cdf
% subplot(2, 2, 3);
% area(grayLevels, cdf);
% xlim([0, 255]);
% grid on;
% hold on;
% line(xlim, [0.05, 0.05], 'Color', 'r', 'LineWidth', 2);
% line(xlim, [0.95, 0.95], 'Color', 'r', 'LineWidth', 2);
% line([gl1, gl1], ylim, 'Color', 'r', 'LineWidth', 2);
% line([gl2, gl2], ylim, 'Color', 'r', 'LineWidth', 2);
% title('CDF', 'FontSize', fontSize);
% Show with .05 mapped to 0 gray levels and 0.95 mapped to 255.
subplot(2, 2, 4);
imshow(grayImage, [gl1, gl2]);
axis on;
title('Stretched Gray Scale image', 'FontSize', fontSize);