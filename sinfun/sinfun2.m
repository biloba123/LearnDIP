function y = sinfun2(M)
y = zeros(1, M);
for i = 1:M
    y(i) = sin((i - 1) / (100 * pi));
end
