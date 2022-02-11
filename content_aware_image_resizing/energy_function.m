function e_values = energy_function(I)
%Compute the energy function at each pixel using the magnitude of 
%the x and y gradients (equation 1 in the paper)
I = imread('data/mushroom.jpg');
I_grey = rgb2gray(I);
[der_x,der_y] = imgradientxy(I_grey);
e_values = abs(der_x)+abs(der_y);
end
