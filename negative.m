r= imread('peppers.png');
p=rgb2gray(r);
for i=1:size(p,1)
    for j=1:size(p,2)
        b(i,j)=255-p(i,j);
    end
end

figure
subplot(1,2,1);
imshow(p);
title('Original Image');

subplot(1,2,2);
neg_image =(b);
imshow(neg_image);
title('negative Image');
