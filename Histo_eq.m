function [image_eq,location] = Histo_eq(image) 
[n,location] = imhist(image);
pixel = sum(n);
image_eq = image;

for k = 1:length(n)
    if k ~=1
        s(k) = n(k)/pixel+s(k-1);
    else s(k) = n(k)/pixel;
    end
    
    new_value = round(s(k)*255);
    if new_value>256
        new_value = 256;
    else if new_value<0
            new_value = 0;
        end
    end
    
    image_eq(image==location(k)) = new_value;
end
    
figure; 
subplot(1,2,1); imshow(image,[]); title('Original image'); 
subplot(1,2,2); imshow(image_eq,[]); title('Image after histogram equalization');

figure; 
subplot(1,2,1); imhist(image); title('Histogram of image'); 
subplot(1,2,2); imhist(image_eq); title('Histogram equalization of image');
end
