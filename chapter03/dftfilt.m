function g = dftfilt(f, H, classout)
%Ƶ�����˲���
%   classoutȡֵ���£�
%   'original' �����������ͬ���ͣ�Ĭ��
%   'fltpoint' ���Ϊsingle���ͣ�������뱾���Ǹ�������������Ͳ���
%
%   f�ᱻ�Զ����ɺ�Hͬ���Ĵ�С��f��H���붼��ʵ����H�����ǷǾ��е�

%ת��Ϊ�������ͣ��������������
[f, revertClass] = tofloat(f);
F = fft2(f, size(H, 1), size(H, 2));

g = ifft2(H .* F);

g = g(1:size(f, 1), 1:size(f, 2));

if nargin == 3
   if strcmp(classout, 'original')
       g = revertClass(g);
   elseif strcmp(classout, 'fltpoint')
       return
   else
       error('classoutָ������');
   end
end