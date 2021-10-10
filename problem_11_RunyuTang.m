addpath ./data
image6 = imread('image6.jpg');

%% Histogram equalization
[image6_eq, location_eq] = Histo_eq(image6);
[image6_eq_2, location_eq_2] = Histo_eq(image6_eq);
MSE = 1/(size(image6,1)*size(image6,2))*norm(double(image6_eq)-double(image6_eq_2),'fro')^2
difference = location_eq_2 - location_eq;
difference_hist = find(difference~=0)