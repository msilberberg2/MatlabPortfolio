%Author: Martin Silberberg

%Apply salt and pepper noise to x% of the pixels in the given image
function result = noise(image, x)
    [row,col] = size(image);
    %Change x% pixels to white or black
    pixcount = row * col * (x/100);
    for i = 1:pixcount
        newpixel = round(rand);
        if newpixel == 1
            newpixel = 255;
        end
        newX = round(rand*(row-1))+1;
        newY = round(rand*(col-1))+1;
        image(newX,newY) = newpixel;
    end
    
    %Return the new image
    result = image;
end