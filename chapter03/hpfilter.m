function H = hpfilter(type, M, N, D0, n)
%����Ƶ�����ͨ�˲���
%   typeȡֵ���£�
%   'ideal' �����˲�����n����Ҫ�ṩ
%   'btw' ������˹�˲�����nΪ�������Ĭ��Ϊ0
%   'gaussian' ��˹��ͨ�˲���

H = 1 - lpfilter(type, M, N, D0, n);