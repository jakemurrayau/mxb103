function [maxV,timemaxV] = task2(t,v)
% The company wants to check the maximum speed that will be experienced by jumper to know the "Thrill
% factor". The graph below describes the velocity over the time of 60 seconds, starting from the point the
% jumper falls.

[maxV, num] = max(v); 
timemaxV = t(num);
figure, plot(t,v,'DisplayName','Velocity(t)')
hold on
plot(t(num), maxV, 'r*','MarkerSize',10,'DisplayName',['Max: ' num2str(maxV) ' m/s, ' num2str(timemaxV) ' secs'])
xlabel('seconds');
ylabel('velocity');
title('Velocity vs Time')
legend
end
