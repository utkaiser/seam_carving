function image = display_selected_seam(I, seam, direction)
% Display the selected seam on top of an image.

[row_size, column_size, ~] = size(I);
if strcmp(direction, 'Vertical')
  for i = 1:row_size
      I(i,seam(i),1) = 255;
      I(i,seam(i),2) = 0;
      I(i,seam(i),3) = 0;
  end
  
elseif strcmp(direction, 'Horizontal')
  for i = 1:column_size
      I(seam(i), i,1) = 255;
      I(seam(i), i,2) = 0;
      I(seam(i), i,3) = 0;
  end
  
else 
    ME = MException('wrong direction in display selected seam');
    throw(ME);
end
imshow(I);
image = I;
end