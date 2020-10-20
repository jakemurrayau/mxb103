% The company wants to check the maximum speed that will be experienced by jumper to know the "Thrill
% factor". The graph below describes the velocity over the time of 60 seconds, starting from the point the
% jumper falls.
% The highest velocity is approximately 20m/s as indicated by the in the graph, and is also shown below for
% more understanding.

plot(t, v);
xlabel('seconds');
ylabel('velocity');
[maxV, num] = max(v); 
fprintf('Max velocity %.2fm/s at %.2f seconds\n', maxV, t(num));