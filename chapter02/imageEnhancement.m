f = im2single(imread('Fig0343(a)(skeleton_orig).tif'));
figure, imshow(f), title('ԭͼ')

%������˹��ǿ��ȣ���ǿЧ���ã���������
wLaplacian = [1, 1, 1; 1, -8, 1; 1, 1, 1];
tLaplacian = imfilter(f, wLaplacian, 'replicate');
figure, imshow(tLaplacian), title('������˹')

%�ݶȱ任(Sobelģ��)���ڻҶȱ任������Ӧ��ǿ����������Сϸ����Ӧ��
wxGradient = [-1, -2, -1; 0, 0, 0; 1, 2, 1];
wyGradient = [-1, 0, 1; -2, 0, 2; -1, 0, 1];
txGradient = imfilter(f, wxGradient, 'replicate');
tyGradient = imfilter(f, wyGradient, 'replicate');
tGradient = txGradient + txGradient;
figure, imshow(tGradient), title('�ݶȱ任')

%��Sobelͼ����о�ֵ�˲�ƽ��
wSmooth = fspecial('average', [5, 5]);
tSmooth = imfilter(tGradient, wSmooth, 'replicate');
figure, imshow(tSmooth), title('ƽ������ݶȱ任')

%��������˹��ƽ�����Sobelͼ����ˣ�������������ǿ����
tLaplacian = im2single(tLaplacian);
t = tLaplacian .* tSmooth;
figure, imshow(t), title('������ǿģ��')

%�񻯺��ͼ��
gSharpen = f + t;
figure, imshow(gSharpen), title('�񻯺��ͼ��')

%ʹ�����ɱ任���춯̬��Χ
gStretch = imadjust(gSharpen, [], [], 0.5);
figure, imshow(gStretch), title('������ǿЧ��')
