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
% Task 2
% Task 3
[max_acceleration, max_acceleration_t] = acceleration2ndorder(v, t, h, n)

% Task 4
% Task 5
camera_time = task5_camera(y, t)

% Task 6



