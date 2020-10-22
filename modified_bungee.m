function [dis_from_water_original_jump, dis_from_water_mod_jump, k, L, maxi_a] = modified_bungee(y, t)
%MODIFIED_BUNGEE Uses modified values of the spring constant and rope
%length to resolve the model such that the jumper just touches the water,
%while ensuring that an acceleration of 2g is not exceeded
% [dis_from_water_original_jump, dis_from_water_mod_jump, k, L, maxi_a] =
% modified_bungee(y, t) uses the original y and t to calculate and plot the
% minimum distance reached between the water and the jumper with the
% original parameters. Then, uses the new parameters for k and L to
% calculate how far the jumper now reaches into the water, along with the
% max acceleration reached

H = 74;                 % Height of jump point
jumper_height = 1.75;   % Assumed jumper height

% Distance from water with original parameters
dis_from_water_original_jump = H - max(y) - jumper_height;

% Creating displacment graph with the original parameters
figure, plot(t,y)
title('Displacement vs Time (original)')
xlabel('Time (seconds)')
ylabel('Displacement (m)')

% Guessing parameters...
%1st set:
%k = 900; L = 25;
%2nd set:
%k = 90; L = 250;
%3rd set:
%k = 90; L = 43;
%4th set: (the set that meets the requirements)
k = 80; L = 43;

% Now carrying out Fourth Order Runge-Kutta method again but this time with
% the two altered values

% Initialising all other variables needed
a = 0;
b = 60;
n = 600000;
m = 80;
g = 9.8;
c = 0.9;
C = c/m;
K = k/m;
alpha = 0;

f1 = @(v) v;
f2 = @(t,y,v) g - (C)*abs(v)*v - max(0,K*(y - L));

h = (b-a)/n;
t = a:h:b;

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

% Creating displacment graph with the modified parameters
figure, plot(t,y)
title('Displacement vs Time (80,43)')
xlabel('Time (seconds)')
ylabel('Displacement (m)')

% Setting a variable to hold maximum acceleration
maxi_a = 0;

% A loop to iterate through all the velocity and acceleration pairs to get max acceleration
for i = 1:length(v)     
        temp_v = v(i);  % Creating a temporary velocity value
        temp_y = y(i);  % Creating a temporary displacement value
        
        % Check to see if the the newest generated acceleration is greater then any previous
        if abs(maxi_a) < abs(g-C.*abs(temp_v).*temp_v-K.*(temp_y-L))
            % Setting the newest value to the greatest value if it was bigger
            maxi_a = abs(g-C.*abs(temp_v).*temp_v-K.*max(0,(temp_y-L)));
        end
end

% Distance from water with modified parameters
dis_from_water_mod_jump = 74-max(y)-1.75;

end
