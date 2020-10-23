% Performs the numerical solution of model ODEs, using RK4
[t,v,y,h,n] = RK4();


% Call functions that run the Analysis Tasks

% Task 1
[bounces] = task1(n, y);
fprintf('Task 1: %d bounces were completed within 60 seconds \n\n',bounces);

% Task 2
[maxV, timemaxV] = task2(t, v);
fprintf('Task 2: Max velocity %.2f m/s at %.2f seconds\n\n', maxV, timemaxV);

% Task 3
[accel_max, accel_max_t] = maxacceleration(v, t, h, n);
fprintf('Task 3: The max acceleration is %.2f m/s^2 and occurs at %.2f s after the jump\n\n', accel_max*-1, accel_max_t);

% Task 4
distance = integration_simprule (v, h, n);
fprintf('Task 4: The total distance travelled during the 60 second jump is %.2f m\n\n', distance);

% Task 5
camera_time = task5_camera(y, t);
fprintf('Task 5: To take a photo of the jumper, the camera should be set to trigger at %.2f s after the jump\n\n', camera_time)

% Task 6
[dis_from_water_original_jump, dis_from_water_mod_jump, new_k, new_L, max_accel] = modified_bungee(y, t);
fprintf('Task 6: Originally, at max displacement from the jump point the jumper misses the water by %.2f m.\n', dis_from_water_original_jump)
fprintf('But with the length of the rope modified to %d m, and its spring constant to %d N/m,\n', new_L, new_k)
fprintf('The jumper now touches the water, reaching %.2f m into it.\n', dis_from_water_mod_jump*-1)
fprintf('The max acceleration of the jumper also remains just under 2g, with it reaching up to %.2f m/s^2\n\n', max_accel)

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
