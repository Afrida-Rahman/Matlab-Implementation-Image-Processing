clc; clear all; close all;
filename='images.jpg';
a=importdata(filename);

g=rgb2gray(a);
dv=im2double(g);

o3=7*log(1+dv);

subplot(1,2,1),imshow(g);title('original image');
subplot(1,2,2),imshow(o3);title('output scaling factor 7');

