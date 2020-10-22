clc;
clear all;
close all;
im1 = imread('cameraman.tif');
im2 = imread('board.tif');
M = zeros(256,1,'uint8'); 
hist1 = imhist(im1); 
hist2 = imhist(im2);
cdf1 = cumsum(hist1) / numel(im1); 
cdf2 = cumsum(hist2) / numel(im2);
 
for idx = 1 : 256
    diff = abs(cdf1(idx) - cdf2);
    [~,ind] = min(diff);
    M(idx) = ind-1;
end
 
 out = M(double(im1)+1);
 
subplot(2,3,1),imshow(im1);
title('cameraman');
subplot(2,3,2),imshow(im2);
title('circuit');
subplot(2,3,3),imshow(out);
title('Histogram matched cameraman');
subplot(2,3,4),imhist(im1);
title('Histogram of cameraman');
subplot(2,3,5),imhist(im2);
title('Histogram of circuit');
subplot(2,3,6),imhist(out);
title('Histogram of matched image');
