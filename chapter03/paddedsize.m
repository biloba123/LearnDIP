function PQ = paddedsize(AB, CD, PARAM)
%���ر����۵�����ż�����ߴ�

if nargin == 1
    PQ= 2 * AB;
elseif nargin == 2
    if ~ischar(CD)
        PQ = AB + CD -1;
        PQ = 2 * ceil(PQ / 2);
    else
        m = max(AB);
        P = 2 ^ nextpow2(2 * m);
        PQ = [P, P];
    end
elseif (nargin == 3) && strcmpi(PARAM, 'pwr2')
    m = max([AB CD]);
    P = 2 ^ nextpow2(2 * m);
    PQ = [P, P];
else
    error('������������');
end