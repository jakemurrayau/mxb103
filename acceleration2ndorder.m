% variables required: v (velocity) vector and h (step size), time vector
% (t) for plotting

accel_2ndorder = zeros(size(t));
fyft=@(t) v(t);
for j = 2:n
    accel_2ndorder(j) = (fyft(j+1)-fyft(j-1))/(2*h);
end

[abs_accel_max,accel_max_t] = max(abs(accel_2ndorder));

figure
hold on
plot(t, accel_2ndorder,'DisplayName','Acceleration(t)')
xlabel('Time (s)')
ylabel('Jumper acceleration (m/s^2)')
title('Acceleration during jump & Maximum acceleration')
hold on
vertline = yline(accel_2ndorder(accel_max_t),'r--');%,'DisplayName',append('accel = ',num2str(accel_2ndorder(accel_max_t)),' m/s^2'))
horiline = xline(t(accel_max_t),'r--');%,'DisplayName',append('t = ',num2str(t(accel_max_t)), ' secs'))
plot(t(accel_max_t),accel_2ndorder(accel_max_t),'r*', 'MarkerSize', 10,'DisplayName',append('Max: ',num2str(accel_2ndorder(accel_max_t)),' m/s^2, ',num2str(t(accel_max_t)), ' secs'))
vertline.Annotation.LegendInformation.IconDisplayStyle = 'off';
horiline.Annotation.LegendInformation.IconDisplayStyle = 'off';
legend;