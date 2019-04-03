f = imread('gray.jpg');
[f, revertClass] = tofloat(f);

figure, imshow(f), title('ԭͼ')
figure, imshowFourier(f), title('����Ҷ��')

h = fspecial('sobel')
PQ = paddedsize(size(f));
H = freqz2(h, PQ(1), PQ(2));
H1 = ifftshift(H);

gs = imfilter(f, h);
gf = dftfilt(f, H1);
figure, imshow(abs(gs) > 0.2 * abs(max(gs(:)))), title('�����˲�')
figure, imshow(abs(gf) > 0.2 * abs(max(gf(:)))), title('Ƶ���˲�')
