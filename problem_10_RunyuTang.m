addpath ./data
image5 = imread('image5.jpg');
image5 = double(image5);

image5_noise_sum = zeros(size(image5));
for K = 1:100
    image5_noise = image5+normrnd(0,40,size(image5));
    image5_noise_sum = image5_noise_sum+image5_noise;
    image5_average = image5_noise_sum/K;
    MSE = 1/(size(image5,1)*size(image5,2))*(norm(image5_average-image5,'fro'))^2;
    if MSE<100
        break;
    end
end

figure; 
subplot(1,3,1); imshow(image5,[]); title('Original image5'); 
subplot(1,3,2); imshow(image5_noise,[]); title('Noised version of image5');
subplot(1,3,3); imshow(image5_average,[]); title('Averaged image5, K = 17');