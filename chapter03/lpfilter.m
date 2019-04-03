function H = lpfilter(type, M, N, D0, n)
%生成频率域低通滤波器
%   type取值如下：
%   'ideal' 理想滤波器，n不需要提供
%   'btw' 巴特沃斯滤波器，n为其阶数，默认为0
%   'gaussian' 高斯低通滤波器

[U, V] = dftuv(M, N);
D = hypot(U, V);

switch type
case 'ideal'
    H = single(D <= D0);
case 'btw'
    if nargin == 4
        n = 1;
    end
    H = 1 ./ (1 + (D./D0).^(2*n));
case 'gaussian'
    H = exp(-(D.^2) ./ (2*(D0^2)));
otherwise
    error('不支持该type');
end