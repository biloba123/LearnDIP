bar(imhist(f, 25));
title('f');
g = histeq(f, 256);
figure;
imshowpair(f, g, 'montage');
figure;
bar(imhist(g, 25));
title('g');