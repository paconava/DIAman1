function [ mx, my ] = my_means( GLCM )
%UNTITLED Summary of this function goes here
%   Detailed explanation goes here

mx = 0;
my = 0;
px = 0;
py = 0;
for i = 1:size(GLCM,2)
    for j = 1:size(GLCM,1)
        px = px + GLCM(i,j);
        py = py + (j * GLCM(i,j));
    end
    mx = mx + (i * px);
    my = my + py;
    px = 0;
    py = 0;
end
end

