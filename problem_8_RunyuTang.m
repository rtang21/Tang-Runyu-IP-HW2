%% Problem 8: a)
image1D = [10 25 40 55 70 85 100 115];
img1D_dft = fft(image1D);
img1D_dct = dct(image1D);
img1D_dft(5:8) = 0;
img1D_dct(5:8) = 0;
img1D_dft_rec = ifft(img1D_dft)
img1D_dct_rec = idct(img1D_dct)

%% Problem 8: b)
addpath ./data
load qmatrix.txt
image4 = imread('image4.jpg'); 
image4_block = image4(151:158,151:158); % image block
[block_rec,error_block] = img_compress(image4_block,qmatrix);

%% Problem 8: c)
qmatrix_new = imresize(qmatrix,64);
[image4_rec,error_image4] = img_compress(image4,qmatrix_new);
max_value = max(image4_rec,[],'all')
min_value = min(image4_rec,[],'all')

figure; subplot(1,2,1); imshow(image4,[]); title('Original image4'); 
subplot(1,2,2); imshow(image4_rec,[]); title('Compressed image4');

%% Problem 8: d)
qmatrix_ones = ones(512,512);
[image4_rec_2,error_image4_2] = img_compress(image4,qmatrix_ones);

figure; subplot(1,2,1); imshow(image4,[]); title('Original image4'); 
subplot(1,2,2); imshow(image4_rec_2,[]); title('Non-normalized DCT: reconstructed image4');
