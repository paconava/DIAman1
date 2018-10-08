function [ newGL ] = my_glcm_norm( GLCM, sow, d, theta )
%   Normalization of GLCM matrix
newGL = GLCM;
if theta == 0 || theta == 90
    for i = 1:numel(GLCM)
        if GLCM(i) ~= 0
            newGL(i) = GLCM(i)/(2*(sow*(sow-d)));
        end
    end
elseif theta == 45 || theta == 135
    for i = 1:numel(GLCM)
        if GLCM(i) ~= 0
            newGL(i) = GLCM(i)/(2*((sow-d)*(sow-d)));
        end
    end
else
    for i = 1:numel(GLCM)
        if GLCM(i) ~= 0
            newGL(i) = GLCM(i)/(8*((sow-d*2)*(sow-d*2)));
        end
    end
end

end

