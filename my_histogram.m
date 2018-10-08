function h = my_histogram(x)
%HISTOGRAM Takes an image x, returns the
%value of histogram, and plots the histo-
%gram of said image
    h = zeros(1,255);
    for i = 1:numel(x)
        h(x(i) + 1) = h(x(i) + 1) + 1;
    end
    figure
    plot(h)
    title('Histogram of image using my function');
end

