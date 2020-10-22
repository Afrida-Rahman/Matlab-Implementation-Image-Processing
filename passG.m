f=imread('cameraman.tif')
fd=double(f)
F=fftshift(fft2(fd))
[P,Q]=size(F)
  D0=input('Enter D0:') 
  w=input('enter w:')
    for u=0:P-1
        for v=0:Q-1
            D(u+1,v+1)=(((u-(P/2)).^2)+((v-(Q/2)).^2)).^0.5;
            H(u+1,v+1)=exp(-((D(u+1,v+1).^2-D0.^2)/(D(u+1,v+1)*w)).^2);
            Hr(u+1,v+1)=1-H(u+1,v+1);
            Hp(u+1,v+1)=1-Hr(u+1,v+1);
        end
    end
subplot(1,3,2),imshow(Hp)
title('bandpass filter')
result=F.*Hp
r=ifft2(result);
subplot(1,3,3),fftshow(r);
title('image after filtering');
subplot(1,3,1),imshow(f)
title('original image')