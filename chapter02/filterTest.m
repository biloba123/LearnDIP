f = Fig0335_a__ckt_board_saltpep_prob_pt05_;
m = 3;
n = 3;

%均值滤波
w = fspecial('disk', min([m, n]) / 2);
g1 = imfilter(f, w, 'replicate');
figure, imshowpair(f, g1, 'montage')

%中值滤波
fd = padarray(f, [m n], 'replicate');
g2 = colfilt(fd, [m n], 'sliding', @median);
[M, N] = size(f);
g2 = g2((1:M) + m, (1:N) + n);
figure, imshowpair(f, g2, 'montage')