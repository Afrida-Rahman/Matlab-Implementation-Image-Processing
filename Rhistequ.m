close all;
clear all;
clc;
filename='3.jpg';
a=importdata(filename);
X=rgb2gray(a);

numofpixels=size(X,1)*size(X,2);
 
figure(1)
subplot(3,2,1);
imshow(X);
title('Original Image');
subplot(3,2,2);
imhist(X);
title('Histogram equalization');
 
 
Y=uint8(zeros(size(X,1),size(X,2)));
cnts=zeros(256,1);
probf=zeros(256,1);
prbc=zeros(256,1);
cum=zeros(256,1);
fin_lc=zeros(256,1);
 
%each pixel count 
 
for i=1:size(X,1)
    for j=1:size(X,2)
        value=X(i,j);
        cnts(value+1)=cnts(value+1)+1;
        probf(value+1)=cnts(value+1)/numofpixels;
    end
end
 
sum=0;
n=255;
 
%cumulative distribution probability
 
for i=1:size(probf)
   sum=sum+cnts(i);
   cum(i)=sum;
   prbc(i)=cum(i)/numofpixels;
   fin_lc(i)=round(prbc(i)*n);
end
 
%final output image reconstruction
 
for i=1:size(X,1)
       for j=1:size(X,2)
           Y(i,j)=fin_lc(X(i,j)+1);
       end
end
 
subplot(3,2,3);
imshow(Y);
title('Without using tool');
subplot(3,2,4);
imhist(Y); % histogram of enhanced image

%toolbox
p= histeq(X);

subplot(3,2,5);
imshow(p);
title('Using tool');
subplot(3,2,6);
imhist(p);
