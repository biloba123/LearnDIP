f = imread('gray.jpg');
%w = [0, 1, 0; 1, -4, 1; 0, 1, 0];
w = [1, 1, 1; 1, -8, 1; 1, 1, 1];
w = w .* -1;
t = imfilter(f, w, 'replicate');
figure, imshow(t)
figure, imhist(t), xlim([0, 255])
g = f + t;
figure, imshowpair(f, g, 'montage')
