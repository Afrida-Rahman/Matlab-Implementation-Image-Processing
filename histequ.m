clc;
clear;
 filename='3.jpg';
a=importdata(filename);

i=rgb2gray(a);

y = histeq(i);
subplot(2,2,1);
imshow(i);
subplot(2,2,2);
imhist(i);
subplot(2,2,3);
imshow(y);
subplot(2,2,4);
imhist(y);
