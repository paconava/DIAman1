function y = my_threshold( x, th )
%UNTITLED Summary of this function goes here
%   Detailed explanation goes here
y = x;
for i = 1:numel(x)
    if x(i) > th
        y(i) = 1;
    else
        y(i) = 0;
    end
end

end

