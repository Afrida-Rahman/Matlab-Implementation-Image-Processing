%Import my original picture file
 
I = imread('peppers.png');
%Convert image to grayscale (intensity) values for simplicity (for now)
 
I = rgb2gray(I);
 
%Determine the dimensions of the source image
 
%Note that we will have three values - width, height, and the number
 
%of color vectors, 3
 
[j k] = size(I)
 
%Specify the new image dimensions we want for our smaller output image
 
%In this case we will downsample the image by a fixed ratio
 
%Since the ratios are different, the image will appear distored
 
%We can also set x_new and y_new to arbitrary values, but it will not work
 
%if they are larger than j and k. That would be upsampling/interpolation,
 
%and will be covered in a future tutorial.
 
x_new = j./8;
y_new = k./4;
 
%Determine the ratio of the old dimensions compared to the new dimensions
 
x_scale = j./x_new;
y_scale = k./y_new;
 
%Declare and initialize an output image buffer
 
M = zeros(x_new,y_new)
 
%Generate the output image
 
for count1 = 1:x_new
 for count2 = 1:y_new
 M(count1,count2) = I(count1.*x_scale,count2.*y_scale);
 end
end
 
%Display the two images side-by-side for a few seconds, then close
 
subplot(1,2,1); imagesc(I);colormap gray; axis tight;
subplot(1,2,2); imagesc(M);colormap gray; axis tight;
pause(4);
close all;