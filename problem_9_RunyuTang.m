addpath ./data
image2 = imread('image2.jpg');
image2 = double(image2);

%% Problem 9: a) Image Negative
image2_neg = -image2+max(image2,[],'all');
figure; 
subplot(1,2,1); imshow(image2,[]); title('Original image2'); 
subplot(1,2,2); imshow(image2_neg,[]); title('Negative image2');

%% Problem 9: b) Contrast streching
r1 = 20; r2 = 100; s1 = 20; s2 = 180;
img2_strech = image2;
img2_strech(image2<=r1) = s1/r1*img2_strech(image2<=r1);
img2_strech(image2>r1 & image2<r2) = ((s2-s1)/(r2-r1))*(img2_strech(image2<r2 & image2>r1)-r1)+s1;
img2_strech(image2>=r2) = ((s2-s1)/(max(image2,[],'all')-r2))*(img2_strech(image2>=r2)-r2)+s2;
figure; 
subplot(1,2,1); imshow(image2,[]); title('Original image2'); 
subplot(1,2,2); imshow(img2_strech,[]); title('Contrast streched image2');

%% Problem 9: c) Threshold
img2_T = image2;
img2_T(image2<128) = 0;
img2_T(image2>=128) = 255;
figure; 
subplot(1,2,1); imshow(image2,[]); title('Original image2'); 
subplot(1,2,2); imshow(img2_T,[]); title('Image2 with threshold=128');

%% Problem 9: d)
img2_slice = image2;
img2_slice(img2_slice<148 & img2_slice>108) = 255;
img2_slice(image2>=148) = 0;
img2_slice(image2<=108) = 0;
figure; 
subplot(1,2,1); imshow(image2,[]); title('Original image2'); 
subplot(1,2,2); imshow(img2_slice,[]); title('Gray-level slicing without background');

%% Problem 9: e)
img2_slice_bg = image2;
img2_slice_bg(image2<=148 & image2>=108) = 255;
figure; 
subplot(1,2,1); imshow(image2,[]); title('Original image2'); 
subplot(1,2,2); imshow(img2_slice_bg,[]); title('Gray-level slicing without background');

