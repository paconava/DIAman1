clear all; close all; clc;

%% B. Visualizing GLCM matrices.

M1 = imread('mosaic1.png');
M2 = imread('mosaic2.png');

M1I1 = M1(1:end/2,1:end/2);
M1I2 = M1(1:end/2,end/2:end);
M1I3 = M1(end/2:end,1:end/2);
M1I4 = M1(end/2:end,end/2:end);

M2I1 = M2(1:end/2,1:end/2);
M2I2 = M2(1:end/2,end/2:end);
M2I3 = M2(end/2:end,1:end/2);
M2I4 = M2(end/2:end,end/2:end);

% GLCM for textures in mosaic1.png
glcmM1I1 = my_glcm(M1I1, 8, 3, 90 );
glcmM1I1norm = my_glcm_norm( glcmM1I1, 256, 3, 90);
glcmM1I2 = my_glcm(M1I2, 8, 3, 150 );
glcmM1I2norm = my_glcm_norm( glcmM1I2, 256, 3, 150);
glcmM1I3 = my_glcm(M1I3, 8, 3, 0 );
glcmM1I3norm = my_glcm_norm( glcmM1I3, 256, 3, 0);
glcmM1I4 = my_glcm(M1I4, 8, 3, 90 );
glcmM1I4norm = my_glcm_norm( glcmM1I4, 256, 3, 90);

% GLCM for textures in mosaic2.png
glcmM2I1 = my_glcm(M2I1, 8, 3, 45 );
glcmM2I1norm = my_glcm_norm( glcmM2I1, 256, 3, 45);
glcmM2I2 = my_glcm(M2I2, 8, 3, 0 );
glcmM2I2norm = my_glcm_norm( glcmM2I2, 256, 3, 0);
glcmM2I3 = my_glcm(M2I3, 8, 3, 90 );
glcmM2I3norm = my_glcm_norm( glcmM2I3, 256, 3, 90);
glcmM2I4 = my_glcm(M2I4, 8, 3, 150 );
glcmM2I4norm = my_glcm_norm( glcmM2I4, 256, 3, 150);

figure, imshow(M1I1), title('M1I1');
figure, imshow(M1I2), title('M1I2');
figure, imshow(M1I3), title('M1I3');
figure, imshow(M1I4), title('M1I4');
figure, imshow(M1I1), title('M2I1');
figure, imshow(M1I2), title('M2I2');
figure, imshow(M1I3), title('M2I3');
figure, imshow(M1I4), title('M2I4');

%% C. Computing GLCM feature images in local windows
I = imread('mosaic2.png');
d = 3;
theta = 90;
windowSize = 31;
[ IDM, INR, SHD ] = my_features( I, windowSize, d, theta);
newIDM = my_scale(IDM);
newINR = my_scale(INR);
newSHD = my_scale(SHD);
figure, imshow(newIDM), title('newIDM');
figure, imshow(newINR), title('newINR');
figure, imshow(newSHD), title('newSHD');

%% D. Segment the GLCM feature images and describe how they separate the textures
currFeat = my_threshold(newSHD, 0.33);
imshow(currFeat);
newI = I1(floor(windowSize/2):end-ceil(windowSize/2),floor(windowSize/2):end-ceil(windowSize/2));
result = double(newI) .* currFeat;
imshow(result/256);