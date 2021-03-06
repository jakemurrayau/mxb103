function T = forward_differences(Y)
% FORWARD_DIFFERENCES Constructs Newton's forward difference table
% T = forward_differences(Y) returns Newton's forward difference table for
% the function values Y = [y0,y1,...,yn].
% Note that the forward difference table T is stored as:
% y0
% y1  Delta y0
% y2  Delta y1  Delta^2 y0
% y3  Delta y2  Delta^2 y1  Delta^3 y0
% The rest of the array T is zero.

n = length(Y);
T = zeros(n,n);     % Create empty FDT
T(:,1) = Y;         % Fill first column

for j = 2:n
    for i = j:n
        T(i,j) = T(i,j-1) - T(i-1,j-1); % Fill remaiing coloumns
    end
end


