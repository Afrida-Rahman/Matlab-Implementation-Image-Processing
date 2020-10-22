%Without using tool
k=imread('fabric.png');
k=rgb2gray(k);
sigma=2;
kernel=zeros(5,5);
w=0;
for i=1:5
    for j=1:5
        sq_dist=(i-3)^2+(j-3)^2;
        kernel(i,j)=exp(-1*(sq_dist)/(2*sigma*sigma));
        w=w+kernel(i,j);
    end
end
kernel=kernel/w;
[m,n]=size(k);
output=zeros(m,n);
Im=padarray(k,[2,2]);
for i=1:m
    for j=1:n
        temp=Im(i:i+4,j:j+4);
        temp=double(temp);
        conv=temp.*kernel;
        output(i,j)=sum(conv(:));
    end
end
subplot(2,3,1);imshow(k);title('Original image')
subplot(2,3,2);imshow(uint8(output));title('Without using tool');

%Using tool
Iblur1 = imgaussfilt(k,sigma);
subplot(2,3,3);imshow(Iblur1);title('Using tool');
subplot(2,3,4);imhist(k)
subplot(2,3,5);imhist(uint8(output))
subplot(2,3,6);imhist(Iblur1)
