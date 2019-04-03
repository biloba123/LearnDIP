function imshowFourier(f)
F = fft2(f);
S = fftshift(log(1 + abs(F)));
imshow(S, [])