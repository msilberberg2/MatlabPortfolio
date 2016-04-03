%Author: Martin Silberberg

%Applies median filtering to the inputted grayscale image, img, with mask size x:y.
function result = medianfilter(image, x,y)
    [row,col] = size(image);
    %Split x and y in half for use in generating masks later
    if mod(x,2) == 0 
        x1 = uint16(x/2)-1;
        x2 = uint16(x/2);
    else
        x1 = uint16(x/2)-1;
        x2 = uint16(x/2)-1;
    end
    
    if mod(y,2) == 0 
        y1 = uint16(y/2)-1;
        y2 = uint16(y/2);
    else
        y1 = uint16(y/2)-1;
        y2 = uint16(y/2)-1;
    end
    
    %The new image starts out with all zeroes, so the final image's border
    %will be zeroes
    newimg = zeros([row col]);
    for i = (1+x1):(row-x2)
        for j = (1+y1):(col-y2)
            mask = image((i-x1):(i+x2),(j-y1):(j+y2));
            %Find the median of the mask by finding the median of the mask
            %rearranged as a vector
            med = median(reshape(mask,[x*y,1]));
            newimg(i,j) = med;
        end
    end
    result = uint8(newimg);
end