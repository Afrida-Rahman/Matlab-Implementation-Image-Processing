function [out]=butterhp(im,d,n)
h=size(im,1);
w=size(im,2);
[x,y]=meshgrid(-floor(w/2):floor(w-1)/2: -floor(h/2):floor(h-1)/2);
out=1./(1.+(d./(x.^2+y.^2).^0.5).^(2*n));
end

% a=imread('cameraman.tif');
% hb=butterhp(a,15,1);
% af=fftshift(fft2(a));
% fftshow(af)
% afhb=af.*hb;
% fftshow(afhb)
% afhbi=ifft2(afhb);
% fftshow(afhbi)