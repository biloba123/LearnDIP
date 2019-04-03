function p = manualhist
repeats = true;
quitnow = 'x';

p = twomodegauss(0.4, 0.05, 0.8, 0.05, 0.01, 1, 0.002);

while repeats
    s = input('Enter m1, sig1, m2, sig2, A1, A2, k OR x to quit:',...
        's');
    
    if strcmp(s, quitnow)
        break
    end
    
    v =  str2num(s);
    if numel(v) ~= 7
        disp('Incorrect number of inputs.')
    end
    
    p = twomodegauss(v(1), v(2), v(3), v(4), v(5), v(6), v(7));
    figure, plot(p)
    xlim([0, 255])
end