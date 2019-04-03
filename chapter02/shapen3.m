f = imread('Fig0342(a)(contact_lens_original).tif');
figure, imshow(f), title('f')

wx = [-1, -2, -1; 0, 0, 0; 1, 2, 1]
gx = imfilter(f, wx, 'replicate');
figure, imshow(gx), title('gx')

wy = [-1, 0, 1; -2, 0, 2; -1, 0, 1]
gy = imfilter(f, wy, 'replicate');
figure, imshow(gy), title('gy')

g = gx + gy;
figure, imshow(g), title('g')