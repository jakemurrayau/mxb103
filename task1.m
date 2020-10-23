function task1(j,y)

bounces = 0; %Create counter for every bounce within 60 seconds

for i = 2:j
    if(y(i) > y(i+1) && y(i) > y(i-1)) %If statement that counts every bounce
        bounces = bounces + 1;
    end
end
    fprintf('Task 1:\n%d bounces were completed within 60 seconds \n',bounces);
end
