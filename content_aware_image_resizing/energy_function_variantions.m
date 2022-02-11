function e_values = energy_function_variantions(I)
%Compute the energy function at each pixel using the magnitude of 
%the x and y gradients (equation 1 in the paper)

h = fspecial('motion', 50, 45);
I_filtered = imfilter(I, h);
I = I_filtered;
I_grey = rgb2gray(I);
[der_x,der_y] = imgradientxy(I_grey);
e_values = abs(der_x)+abs(der_y);
%e_values = sqrt(der_x.^2+der_y.^2);

end