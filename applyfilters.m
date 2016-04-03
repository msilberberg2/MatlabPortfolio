%Author: Martin Silberberg

%Apply median filter and average filter, and display the result, of an
%image, with the given parameters
function result = applyfilters(image, x, y, percent)
    fprintf('\nFiltering %d percent corrupted image with mask size %d:%d\n',percent,x,y)
    %Apply median filtering with two mask sizes to all four cases
    disp('Applying median filter...')
    medimg = medianfilter(image,x,y);
    disp('Applying average filter...')
    avgimg = avgfilter(image,x,y);
    disp('Done!')

    disp('Fig 1: Corrupted Image')
    disp('Fig 2: Median Filtered Image')
    disp('Fig 3: Average Filtered Image')

    imshow(image);
    figure;
    imshow(medimg);
    figure;
    imshow(avgimg);
    
    result = 1;
end