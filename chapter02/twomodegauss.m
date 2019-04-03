function p = twomodegauss(m1, sig1, m2, sig2, A1, A2, k)
%twomodegauss������ģ̬��˹����
%   m: ��ֵ
%   sig: ��׼��
%   A: ���
%   p: 256Ԫ�ع�һ��������

z = linspace(0, 1, 256);
p = k + gauss(m1, sig1, A1, z) + gauss(m2, sig2, A2, z);
p = p ./ sum(p(:));

function p = gauss(m, sig, A, x)
c = A * (1 / ((2 * pi) ^ 0.5) * sig);
k = 2 * (sig ^ 2);
p = c * exp(-(x - m) .^2 ./ k);