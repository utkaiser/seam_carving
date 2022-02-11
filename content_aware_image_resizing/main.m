function run()
I = imread('data/ut.jpg');
% I2 = imread('data/river.jpg');
% I3 = imread('data/mushroom.jpg');
% I4 = imread('data/eiffeltower.jpg');
% I5 = imread('data/symm.jpg');

%first question
% [output]=removeVertical(I,100);
% [output2]=removeHorizontal(I2,100);
% subplot(2,2,1), imshow(I), title("normal image");
% subplot(2,2,2), imshow(output), title("seam carved image vertical");
% subplot(2,2,3), imshow(I2), title("normal image");
% subplot(2,2,4), imshow(output2), title("seam carved image horizontal");

%second question
%a and b
% e_values=energy_function(I);
% cum_map_vert = cumulative_minimum_energy_map(I,'Vertical');
% cum_map_hor = cumulative_minimum_energy_map(I,'Horizontal');
% subplot(3,1,1), imshow(uint8(e_values)), title("energy function");
% subplot(3,1,2), imshow(uint8(cum_map_vert)), title("cumulative minimum energy map vertically");
% subplot(3,1,3), imshow(uint8(cum_map_hor)), title("cumulative minimum energy map horizontally");

%third question
%a and b
% im_with_seam_vert = display_selected_seam(I,compute_optimal_vertical_seam(I),'Vertical');
% im_with_seam_hor = display_selected_seam(I,compute_optimal_horizontal_seam(I),'Horizontal');
% 
% subplot(3,1,1), imshow(I), title("normal image");
% subplot(3,1,2), imshow(im_with_seam_vert), title("vertical seam");
% subplot(3,1,3), imshow(im_with_seam_hor), title("horizontal seam");

%fourth question
%a,b,c
% h = fspecial('motion', 50, 45);
% I_filtered = imfilter(I, h);
% H = fspecial('prewitt');
% I_filtered_h = imfilter(I,H,'replicate');
% I_filtered_v = imfilter(I,H','replicate');
% e_value = energy_function(I);
% e_value_var1 = energy_function(I_filtered_h);
% e_value_var2 = energy_function(I_filtered_v);
% subplot(3,2,1), imshow(I), title("normal image");
% subplot(3,2,3), imshow(I_filtered_h), title("filtered image with prewitt filter");
% subplot(3,2,5), imshow(I_filtered_v), title("filtered image with prewitt filter transposed");
% subplot(3,2,2), imshow(uint8(e_value)), title("normal energy function");
% subplot(3,2,4), imshow(uint8(e_value_var1)), title("prewitt energy function");
% subplot(3,2,6), imshow(uint8(e_value_var2)), title("prewitt filter transposed energy function");

%fifth question
%a,b,c
% I_without_tower = [I(1:end,1:200,1:end) I(1:end,400:end,1:end)];

% I3=I5;
% [row_size,column_size,~] = size(I3);
% numrows = 0;
% numcols = 150;
% [output]=removeVertical(I3,numcols);
% [output]=removeHorizontal(I3,numrows);
% 
% I_resized_simple = imresize(I3,[row_size-numrows column_size-numcols]);
% subplot(3,1,1), imshow(I3), title(strcat("normal image (size ",int2str(size(I3)),")"));
% subplot(3,1,2), imshow(output), title(strcat("seam carving resized (size ",int2str(size(output)),")"));
% subplot(3,1,3), imshow(I_resized_simple), title(strcat("reduced by ",int2str(numcols),...
%                                 " in xdim and ",int2str(numrows), " in ydim by imresize()"));
                    
end