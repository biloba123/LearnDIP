function p = twomodegauss(m1, sig1, m2, sig2, A1, A2, k)
%twomodegauss生成两模态高斯函数
%   m: 均值
%   sig: 标准差
%   A: 振幅
%   p: 256元素归一化的向量

z = linspace(0, 1, 256);
p = k + gauss(m1, sig1, A1, z) + gauss(m2, sig2, A2, z);
p = p ./ sum(p(:));

function p = gauss(m, sig, A, x)
c = A * (1 / ((2 * pi) ^ 0.5) * sig);
k = 2 * (sig ^ 2);
p = c * exp(-(x - m) .^2 ./ k);