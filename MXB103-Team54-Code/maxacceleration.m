function [accel_max, accel_max_time] = maxacceleration(v, t, h, n)
%MAXACCELERATION Gets the max acceleration experienced by the jumper
% [abs_accel_max, accel_max_time] = maxacceleration(v, t, h, n) returns the
% absolute max acceleration experienced by the person during the bungee 
% jump and the time in seconds at which this occurs, found from numerical 
% differentiation of the velocity array (v)

accel = zeros(size(t));

dydt = @(t) v(t);

% Perform iterations for numerical differentiation
for j = 2:n
    accel(j) = (dydt(j + 1) - dydt(j - 1))/(2*h);
end

% Find the max acceleration and iteration at which this occurs
[~, accel_max_t] = max(abs(accel));
accel_max = accel(accel_max_t);

% Get the time in seconds for when the max acceleration occurs
accel_max_time = t(accel_max_t);

% Plot acceleration against time
figure
hold on
plot(t, accel,'DisplayName','Acceleration(t)')
xlabel('Time (s)')
ylabel('Jumper acceleration (m/s^2)')
title('Acceleration during jump & Maximum acceleration')
hold on
vertline = yline(accel(accel_max_t),'r--');
horiline = xline(accel_max_time,'r--');
plot(accel_max_time,accel(accel_max_t),'r*', 'MarkerSize', 10,'DisplayName',['Max: ' num2str(accel(accel_max_t)) ' m/s^2, ' num2str(accel_max_time) ' secs'])
vertline.Annotation.LegendInformation.IconDisplayStyle = 'off';
horiline.Annotation.LegendInformation.IconDisplayStyle = 'off';
legend;

end