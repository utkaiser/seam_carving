
function [output] = removeVertical(im, numPixels)
%Take an input image im, and a parameter specifying how many seams to carve, 
%from the width or height,respectively. 

output = im;
for i=1:numPixels
    output = reduce_image_size(output,'Vertical');
end
end