function g = dftfilt(f, H, classout)
%频率域滤波。
%   classout取值如下：
%   'original' 输出和输入是同类型，默认
%   'fltpoint' 输出为single类型，如果输入本身是浮点型则输出类型不变
%
%   f会被自动填充成和H同样的大小，f和H必须都是实数，H必须是非居中的

%转换为浮点类型，避免计算中舍入
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
       error('classout指定有误');
   end
end