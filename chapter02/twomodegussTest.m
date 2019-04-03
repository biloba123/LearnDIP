p = manualhist;
g = histeq(f, p);
figure, imhist(f), xlim([0, 255])
figure, imhist(g), xlim([0, 255])
figure, imshowpair(f, g, 'montage')