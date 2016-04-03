
%Author: Martin Silberberg

%Performs histogram equalization on an inputted grayscale image
function result = makehisteq(img)
    %Create an array where the first element is a pixel and the second is
    %the probability of that pixel color appearing in the histogram
    [row col] = size(img);
    %A vector with gray level as index and the value at i as its number of
    %occurences
    grays = zeros(1,256);
    for i = 1:row
        for j = 1:col
            grays(img(i,j)+1) = grays(img(i,j)+1) + 1;
        end
    end
    
    %The probability of each gray value in the image
    grayprobs = grays / row*col;
    
    %Find the min and the max of the cdf
    mini = 0;
    for i = 1:256
        if grayprobs(i) ~= 0
            mini = i;
            break;
        end
    end
    
    maxi = 0;
    for i = 256:1
        if grayprobs(i) ~= 0
            maxi = i;
            break;
        end
    end
    
    %Results of cumulative distribution function corresponding to grayprobs as a vector
    cdf = zeros(1,256);
    cdf(1) = grayprobs(1);
    for i = 2:256
        cdf(i) = grayprobs(i) + cdf(i-1);
    end
    %Normalize the cdf to [0,255]
    h = zeros(1,256);
    for i = 1:256
       h(i) = uint8((cdf(i) - mini) / (row*col - mini) * 255);
    end
    h = uint8(h);
    %Apply the new histogram to the old picture, replacing all the old gray
    %values with their corresponding new ones
    newimg = zeros(row, col);
    for i = 1:row
        for j = 1:col
            ogpixval = img(i,j);
            newimg(i,j) = h(ogpixval+1);
        end
    end
    result = uint8(newimg);
end