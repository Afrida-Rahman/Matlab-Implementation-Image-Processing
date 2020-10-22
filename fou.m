f=zeros(200,200);
f(44:130,83:110)=1;
F1=0
subplot(2,2,1),imshow(f)
title('original image')
[m,n]=size(f)
for u=0:1:m-1
    for v=0:1:n-1
        for x=0:1:m-1
            for y=0:1:n-1
                F= f(x+1,y+1) * exp(-1i*2*pi*(u*x/m + v*y/n));
                F1=F1+F;
            end
            
        end
        
        im(u+1,v+1)=F1;
        F1=0;
        
    end
end
subplot(2,2,2),imshow(uint8(im))
title('image after DFT')

F=fftshift(im)
subplot(2,2,3),imshow(F)
title('image after shifting DFT')

subplot(2,2,4),imshow(uint8(log(1+abs(F))),[])
title('enhanced  shifted DFT using log transformation')

