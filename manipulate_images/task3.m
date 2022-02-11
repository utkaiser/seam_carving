function manipulate_image()
    %main function, calls every image manipulation function and plots image
    %in subplot
    image_name='cat.jpg';
    normal_image = imread(image_name);
    gray_image = grayscale_image(normal_image);
    neg_image = negative_image(gray_image);
    lr_image = flip_image(normal_image);
    swapped_channels = swap_channels_reduce_intensity(normal_image);
    changed_image = change_pixel_values(gray_image);
    pixel_intensitiy = find_pixel_intensity(gray_image);
    subplot(7,1,1), imshow(normal_image), title("normal image");
    subplot(7,1,2), imshow(gray_image), title("grayscale image");
    subplot(7,1,3), imshow(neg_image), title("negative image");
    subplot(7,1,4), imshow(lr_image), title("flipped image");
    subplot(7,1,5), imshow(swapped_channels), title("swapped channels");
    subplot(7,1,6), imshow(changed_image), title("changed pixel values");
    subplot(7,1,7), imshow(pixel_intensitiy), title("pixel intensity = 128");
end

function gray_image = grayscale_image(image)
    %map a color image into a grayscale image
    gray_image = im2gray(image);
end

function neg_image = negative_image(image)
    %map the resulting grayscale image to its ”negative image”, in which 
    %the lightest values appear dark and vice versa
    neg_image = (2^8-1)-image;
end

function lr_image = flip_image(image)
    %map the image to its ”mirror image”, i.e., flipping it left to right
    lr_image = flip(image,2);
end

function swapped_channels = swap_channels_reduce_intensity(image)
    %Swap the red and green channels of the input color image and reduce 
    %the intensity of the red channel by half
    red_channel = image(:,:,2);
    green_channel = image(:,:,1)*0.5;
    blue_channel = image(:,:,3);
    swapped_channels = cat(3,red_channel,green_channel,blue_channel);
end

function changed_image = change_pixel_values(image)
    %add or subtract a random value between [0,255] to every pixel in the 
    %grayscale image, then clip the resulting image to have a minimum 
    %value of 0 and a maximum value of 255
    changed_image = abs(image - uint8(randi([-255,255], size(image))));
end

function pixel_intensity = find_pixel_intensity(grey_image)
    %In the grayscale image, find all the pixels whose intensities equal 
    %to 128. Plot these pixels
    pixel_intensity = zeros(size(grey_image,1),size(grey_image,2));
    pixel_intensity(find(grey_image == 128))=128;
    %mask = false(size(grey_image,1), size(grey_image,2));
    %mask(a,b) = true;
    %image(grey_image, "AlphaData", mask);
end

