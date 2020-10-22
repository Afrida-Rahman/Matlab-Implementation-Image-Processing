a= imread('AT3_1m4_01.tif');
b= imread('AT3_1m4_09.tif');
c=imsubtract(a,b);
d=a-b;
subplot(3,2,1),imshow(a),title('pic1')
subplot(3,2,2),imshow(b),title('pic2')
subplot(3,2,3),imshow(c),title('Substruction using tool')
subplot(3,2,4),imhist(c)
subplot(3,2,5),imshow(d),title('Without using tool')
subplot(3,2,6),imhist(d)