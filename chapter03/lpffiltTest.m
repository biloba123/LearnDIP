f = imread('Fig0441(a)(characters_test_pattern).tif');
figure, imshow(f), title('ԭͼ')

[f, revertClass] = tofloat(f);
PQ = paddedsize(size(f));
D0 = PQ(2) * 0.05;

types = {'ideal', 'btw', 'gaussian'};
for i = 1:size(types, 2)
    type = types{i};
    H = hpfilter(type, PQ(1), PQ(2), D0, 2);
    g = dftfilt(f, H);
    figure, imshow(fftshift(H), [])
    figure, imshow(g), title(type)
end