function H = hpfilter(type, M, N, D0, n)
%生成频率域高通滤波器
%   type取值如下：
%   'ideal' 理想滤波器，n不需要提供
%   'btw' 巴特沃斯滤波器，n为其阶数，默认为0
%   'gaussian' 高斯高通滤波器

H = 1 - lpfilter(type, M, N, D0, n);