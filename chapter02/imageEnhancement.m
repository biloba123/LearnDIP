f = im2single(imread('Fig0343(a)(skeleton_orig).tif'));
figure, imshow(f), title('原图')

%拉普拉斯增强锐度，增强效果好，但噪声多
wLaplacian = [1, 1, 1; 1, -8, 1; 1, 1, 1];
tLaplacian = imfilter(f, wLaplacian, 'replicate');
figure, imshow(tLaplacian), title('拉普拉斯')

%梯度变换(Sobel模版)，在灰度变换区域相应更强，对噪声和小细节相应弱
wxGradient = [-1, -2, -1; 0, 0, 0; 1, 2, 1];
wyGradient = [-1, 0, 1; -2, 0, 2; -1, 0, 1];
txGradient = imfilter(f, wxGradient, 'replicate');
tyGradient = imfilter(f, wyGradient, 'replicate');
tGradient = txGradient + txGradient;
figure, imshow(tGradient), title('梯度变换')

%对Sobel图像进行均值滤波平滑
wSmooth = fspecial('average', [5, 5]);
tSmooth = imfilter(tGradient, wSmooth, 'replicate');
figure, imshow(tSmooth), title('平滑后的梯度变换')

%用拉普拉斯与平滑后的Sobel图像相乘，减少噪声，增强骨骼
tLaplacian = im2single(tLaplacian);
t = tLaplacian .* tSmooth;
figure, imshow(t), title('最终增强模版')

%锐化后的图像
gSharpen = f + t;
figure, imshow(gSharpen), title('锐化后的图像')

%使用幂律变换拉伸动态范围
gStretch = imadjust(gSharpen, [], [], 0.5);
figure, imshow(gStretch), title('最终增强效果')
