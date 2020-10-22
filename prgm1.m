clear all;
Img = imread('peppers.png');

Img1 = rgb2gray(Img);
f = mod(Img,128);
mask = Img>127;
for i = 1: 3
for j = 1: 3
if mask(i,j) == 1
f(i,j) = f(i,j) + 128;
end
end
end
subplot(1,3,1), imshow(Img);
subplot(1,3,2), imshow(Img1);
subplot(1,3,3), imhist(Img1);
