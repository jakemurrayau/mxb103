function task2 (t,v)
% The company wants to check the maximum speed that will be experienced by jumper to know the "Thrill
% factor". The graph below describes the velocity over the time of 60 seconds, starting from the point the
% jumper falls.

xlabel('seconds');
ylabel('velocity');
[maxV, num] = max(v); 
fprintf('Task 2:\nMax velocity %.2fm/s at %.2f seconds\n', maxV, t(num));
plot(t,v)
hold on
plot(t(num), maxV, 'r*')
end