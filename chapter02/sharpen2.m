f = imread('gray.jpg');
w = fspecial('gaussian', [5, 5], 3);

gBlur = imfilter(f, w, 'replicate');
gMask = f - gBlur;
g1 = f + gMask;
g2 = f + 4.5 * gMask;

figure, imshow(f)
figure, imshow(gBlur)
figure, imshow(gMask)
figure, imshow(g1)
figure, imshow(g2)