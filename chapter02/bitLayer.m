getGrayImg;
f = im2uint8(mat2gray(f));
imshow(f)

for bit = 1:8
    figure; imshow(logical(bitget(f, bit)))
end
    