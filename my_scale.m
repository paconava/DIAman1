function [ newX ] = my_scale( x )
%UNTITLED2 Summary of this function goes here
%   Detailed explanation goes here
maxValx = max(x(:));
minValx = min(x(:));
for i = 1:numel(x)
    x(i) = (x(i) - minValx) / (maxValx - minValx);
end
newX = x;
end

