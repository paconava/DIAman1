function [ IDM, INR, SHD ] = my_features( x, sow, d, theta )

sowC = ceil(sow/2);
sowF = floor(sow/2);
% Initializing feature matrices
IDM = zeros(size(x(sowC:end-sowF, sowC:end-sowF)));
INR = zeros(size(x(sowC:end-sowF, sowC:end-sowF)));
SHD = zeros(size(x(sowC:end-sowF, sowC:end-sowF)));
auxIDM = 0;
auxINR = 0;
auxSHD = 0;

for row = 1:size(IDM,1)
    for col = 1:size(IDM,2)
        newGL = my_glcm(x(row:row+(sow-1),col:col+(sow-1)), 8, d, theta);
        GLnorm = my_glcm_norm(newGL, sow, d, theta);
        [mx, my] = my_means(GLnorm);
        for i = 1:size(GLnorm,2)
            for j = 1:size(GLnorm,1)
                auxIDM = auxIDM + (GLnorm(i,j) / (1 + (i-j)^2));
                auxINR = auxINR + ((i-j)^2 * GLnorm(i,j)); % Contrast
                auxSHD = auxSHD + ((i + j - mx - my)^3 * GLnorm(i,j));
            end
        end
        IDM(row,col) = auxIDM;
        INR(row,col) = auxINR;
        SHD(row,col) = auxSHD;
        auxIDM = 0;
        auxINR = 0;
        auxSHD = 0;
    end
end

end

