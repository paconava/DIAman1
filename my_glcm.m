function [r1, r2] = my_glcm( x, GL, d, theta )
% Initializing GLCM matrix
r1 = zeros(8,8);
auxI = x;
% Quantizing the image to 8 Gray Levels
if GL == 8
    r1 = zeros(8,8);
    for i = 1:numel(auxI)
        if (auxI(i)>=0)&&(auxI(i)<=31)
            auxI(i) = 1;
        elseif (auxI(i)>=32)&&(auxI(i)<=63)
            auxI(i) = 2;
        elseif (auxI(i)>=64)&&(auxI(i)<=95)
            auxI(i) = 3;
        elseif (auxI(i)>=96)&&(auxI(i)<=127)
            auxI(i) = 4;
        elseif (auxI(i)>=128)&&(auxI(i)<=159)
            auxI(i) = 5;
        elseif (auxI(i)>=160)&&(auxI(i)<=191)
            auxI(i) = 6;
        elseif (auxI(i)>=192)&&(auxI(i)<=223)
            auxI(i) = 7;
        elseif (auxI(i)>=224)&&(auxI(i)<=255)
            auxI(i) = 8;
        end
    end
elseif GL == 4
    r1 = zeros(4,4);
    for i = 1:numel(auxI)
        if auxI(i) == 0
            auxI(i) = 1;
        elseif auxI(i) == 1
            auxI(i) = 2;
        elseif auxI(i) == 2
            auxI(i) = 3;
        elseif auxI(i) == 3
            auxI(i) = 4;
        end
    end
end


r2 = auxI;
if theta == 0
    for row = 1:size(x,1)
        for col = 1:size(x,2)-d
            r1(auxI(row,col),auxI(row,col+d)) = r1(auxI(row,col),auxI(row,col+d)) + 1;
        end
    end
elseif theta == 45
    for row = d+1:size(x,1)
        for col = 1:size(x,2)-d
            r1(auxI(row,col),auxI(row-d,col+d)) = r1(auxI(row,col),auxI(row-d,col+d)) + 1;
        end
    end
elseif theta == 90
    for row = d+1:size(x,1)
        for col = 1:size(x,2)
            r1(auxI(row,col),auxI(row-d,col)) = r1(auxI(row,col),auxI(row-d,col)) + 1;
        end
    end
elseif theta == 135
    for row = d+1:size(x,1)
        for col = d+1:size(x,2)
            r1(auxI(row,col),auxI(row-d,col-d)) = r1(auxI(row,col),auxI(row-d,col-d)) + 1;
        end
    end
elseif theta == 150 % ISOMETRIC calculation
    for row = d+1:size(x,1)-d
        for col = d+1:size(x,2)-d
            % theta == 0
            r1(auxI(row,col),auxI(row,col+d)) = r1(auxI(row,col),auxI(row,col+d)) + 1;
            % theta == 45
            r1(auxI(row,col),auxI(row-d,col+d)) = r1(auxI(row,col),auxI(row-d,col+d)) + 1;
            % theta == 90
            r1(auxI(row,col),auxI(row-d,col)) = r1(auxI(row,col),auxI(row-d,col)) + 1;
            % theta == 135
            r1(auxI(row,col),auxI(row-d,col-d)) = r1(auxI(row,col),auxI(row-d,col-d)) + 1;
        end
    end
end
% Make symmetric
r1 = r1 + r1.';
% Return quantized image
r2 = double(r2);

end