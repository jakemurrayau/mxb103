%RK4 Fourth Order Runge-Kutta method
% We decided to perform the fourth order Runge-Kutta method to solve the 
% two coupled ODE's y' = f1(t,y,v) and v' = f2(t,y,v) that form the
% numerical model that represents bungee jumping with the given set of
% parameters

a = 0;      % Initial time
b = 60;     % End time
n = 600000; % Number of steps

m = 80;     % Mass of jumper
g = 9.8;    % Gravitational acceleration
c = 0.9;    % Drag coefficient
C = c/m;        % simplification used in model
k = 90;     % Spring constant of bungee rope
K = k/m;        % simplification used in model
L = 25;     % Length of bungee rope

alpha = 0;  % Initial displacement (y) and velocity (v) of jumper

% y' = f1
f1 = @(v) v;

% v' = f2
f2 = @(t,y,v) g - (C)*abs(v)*v - max(0,K*(y - L));

h = (b-a)/n;  % Calculate h
t = a:h:b;    % Create t array

% Initialise w arrays
y = zeros(size(t));
y(1) = alpha;

v = zeros(size(t));
v(1) = alpha;

% Perform iterations for numerical method, solving ODE's
for j = 1:n
    % for dy/dt
    m1 = h * f1(v(j));
    m2 = h * f1(v(j) + m1*1/2);
    m3 = h * f1(v(j) + m2*1/2);
    m4 = h * f1(v(j) + m3);
    y(j+1) = y(j) + (1/6)*(m1 + 2*m2 + 2*m3 + m4);
    
    % for dv/dt
    k1 = h * f2(t(j), y(j), v(j));
    k2 = h * f2(t(j) + h/2, y(j) + k1*1/2, v(j) + k1*1/2);
    k3= h * f2(t(j) + h/2, y(j) + k2*1/2, v(j) + k2*1/2);
    k4= h * f2(t(j) + h, y(j) + k3, v(j) + k3);
    v(j+1) = v(j) + (1/6)*(k1 + 2*k2 + 2*k3 + k4);
end

% Call functions that run the Analysis Tasks

% Task 1
disp(['Task 1:'])
disp(' ')

% Task 2
disp(['Task 2:'])
disp(' ')

% Task 3
[accel_max, accel_max_t] = maxacceleration(v, t, h, n);
disp(['Task 3: The max acceleration is ' num2str(accel_max*-1) ' m/s^2 and occurs at ' num2str(accel_max_t) ' s after the jump'])
disp(' ')

% Task 4
distance = integration_simprule (v, h, n);
disp(['Task 4: The total distance travelled during the 60 second jump is ' num2str(distance) ' m'])
disp(' ')

% Task 5
camera_time = task5_camera(y, t);
disp(['Task 5: To take a photo of the jumper, the camera should be set to trigger at ' num2str(camera_time) ' s after the jump'])
disp(' ')

% Task 6
[dis_from_water_original_jump, dis_from_water_mod_jump, new_k, new_L, max_accel] = modified_bungee(y, t);
disp(['Task 6: Originally, at max displacement from the jump point the jumper misses the water by ' num2str(dis_from_water_original_jump) ' m.'])
disp(['But with the length of the rope modified to ' num2str(new_L) ' m, and its spring constant to ' num2str(new_k) ' N/m,'])
disp(['The jumper now touches the water, reaching ' num2str(dis_from_water_mod_jump*-1) ' m into it.'])
disp(['The max acceleration of the jumper also remains just under 2g, with it reaching up to ' num2str(max_accel) ' m/s^2'])

%%
%Other figures

%Figure 3.2: plot position of jumper over time 
figure, plot(t, y)
xlabel('Time (s)')
ylabel('Position/Displacement (m)')
title('Position of bungee jumper over time')

%Figure 4.4.1: plot figure of absolute value function velocity 
figure, plot(t, abs(v)),
xlabel('Time (s)')
ylabel('Velocity (m/s)')
title('Absolute value of velocity over time')
