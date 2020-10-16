function t = task5_camera(Y, T)
%TASK5_CAMERA Gets the time after jump for when the camera on the bridge 
%deck should take a photo to capture an image of the jumper
% t = task5_camera(Y, T) returns the value for t such that y(t) = H - D,
% using an interpolated polynomial p(t) evaluated from the nearest four
% points that lie either side of y = H - D. This interpolated polynomial
% p(t) is then utilised in a root-finding method to determine t.
% Author: Luke Stockham

H = 74;
D = 31;
dist_to_cam = H - D;

% find i such that yi,yi+1 < H - D and yi+2,yi+3 > H - D
i = 1;
while Y(i + 2) < dist_to_cam
   i = i + 1; 
end

near_y = [Y(i), Y(i+1), Y(i+2), Y(i+3)];
near_t = [T(i), T(i+1), T(i+2), T(i+3)];

% as T is evenly spaced, we can use Newton's forward difference form
% for the interpreting polynomial. Creating forward difference table...
FDT = forward_differences(near_y);

% forward_eval returns y = P(t), so this function will be incorporated into
% the root-finding method, which here is the Secant method
tol = 1e-4;

t = 3.5;  % initial guesses
t_old = 3;

while abs(t - t_old) > tol
    t_old2 = t_old;     % tn-1
    t_old = t;          % tn
    
    % evaluate f(tn) and f(tn-1)
    % Root finding methods solve f(x) = 0, but we want to solve p(x) = c
    % So rearranging, p(x) - c = 0 --> f(x) = p(x) - c, now we have
    % f(x) = 0 and can use the secant method to solve for p(x) = c
    ft_old = forward_eval(near_t,FDT,t_old) - dist_to_cam;
    ft_old2 = forward_eval(near_t,FDT,t_old2) - dist_to_cam;
    
    % use secant method to estimate the next iterate tn+1 in the sequence
    t = t_old - ft_old * (t_old - t_old2) / (ft_old - ft_old2);
end


% plot a figure to visualise and confirm this value
figure;
plot(T,Y);
xlim([0,6]);
hold on
xlabel('Time since jump (s)');
ylabel('Distance from starting position (m)');
title('Camera Trigger');
xline(t, 'r--');
yline(dist_to_cam, 'k--');
legend('Y(t)', ['t = ' num2str(t) 's'], ['Camera Position = ' num2str(dist_to_cam) 'm']);

end


