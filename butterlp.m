function [out]=butterlp(im,d,n)

out=1-butterhp(im,d,n);
end

% a=imread('cameraman.tif');
% lp=butterlp(a,15,1);
% af=fftshift(fft2(a));
% aflp=af.*lp;
% aflpi=ifft2(aflp);
% fftshow(aflpi)