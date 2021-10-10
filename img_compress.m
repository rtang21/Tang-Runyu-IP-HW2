function [img_rec,Mean_Square_Error] = img_compress(origin,qmatrix)

origin = double(origin); 

origin_shift = origin-128; % shifted image block
origin_dct = dct2(origin_shift); % apply DCT to shifted block
dct_normal = origin_dct./qmatrix; % nomalize DCT values
img_rec = idct2(dct_normal); % compressed image block

img_rec = img_rec*(mean(origin_shift,'all')/mean(img_rec,'all'))+128; % denomalize compressed image block
img_rec = round(img_rec); % round gray level values

Mean_Square_Error = 1/(size(origin,1)*size(origin,2))*norm(origin - img_rec,'fro')^2

end