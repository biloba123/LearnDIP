M = 500:500:20000;
t1 = zeros(1, numel(M));
t2 = t1;
t3 = t2;

for k = 1:numel(M)
    f1 = @() sinfun1(M(k));
    t1(k) = timeit(f1);
    
    f2 = @() sinfun2(M(k));
    t2(k) = timeit(f2);
    
    f3 = @() sinfun3(M(k));
    t3(k) = timeit(f3);
end

plot(M, t1)
hold on
plot(M, t2)
plot(M, t3)
legend('sinfun1', 'sinfun2', 'sinfun3')
hold off