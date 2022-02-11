function reduced_image = reduce_image_size(I,direction)
%Reduce the image size by a specified amount in one dimension (width or height decrease)

if strcmp(direction, 'Vertical')
    vert_seam = compute_optimal_vertical_seam(I);
    display_selected_seam(I,vert_seam,direction);
    M = cumulative_minimum_energy_map(I,direction);
    [row_size,column_size] = size(M);
    reduced_image = zeros(row_size, column_size-1, 3);%nxmx3 because color image
    for i = 1:row_size
        reduced_image(i,:,:) = I(i, [1:vert_seam(i)-1,vert_seam(i)+1:column_size],:);
    end

elseif strcmp(direction, 'Horizontal')
    hor_seam = compute_optimal_horizontal_seam(I);
    display_selected_seam(I,hor_seam,direction);
    M = cumulative_minimum_energy_map(I,direction);
    [row_size,column_size] = size(M);
    reduced_image = zeros(row_size-1, column_size, 3); %nxmx3 because color image
    for i = 1:column_size
        reduced_image(:,i,:) = I([1:hor_seam(i)-1,hor_seam(i)+1:row_size],i,:);
    end
    
else
    ME = MException('wrong direction in reduced_image_size');
    throw(ME);
end
reduced_image = uint8(reduced_image);
end