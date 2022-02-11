function vert_seam = compute_optimal_vertical_seam(I)
%Compute the optimal vertical seam given an image

M = cumulative_minimum_energy_map(I,'Vertical');
[row_size, column_size] = size(M);
vert_seam = zeros(row_size,1);
[~, index] =  min(M(row_size,:));
vert_seam(row_size) = index;

for i = row_size-1:-1:2
    %left edge
    if (index == 1)
        [~,pos_min] = min([M(i-1,index), M(i-1, index+1)]);
        if (pos_min == 2)
            index = index + 1;
        end
    %right edge   
    elseif (index == column_size)
        [~,pos_min] = min([M(i-1,index), M(i-1, index-1)]);
        if (pos_min == 2)
            index = index - 1;
        end
    else
        [~,pos_min] = min([M(i-1,index-1),M(i-1,index), M(i-1, index+1)]);
        if (pos_min==1)
            index = index - 1;
        elseif (pos_min == 3)
            index = index + 1;
        end
    end
    vert_seam(i) = index;  
end

%first row
i = 1;
index = vert_seam(2);
if (index == column_size)
    [~,pos_min] = min([M(i,index), M(i, index-1)]);
    if (pos_min == 2)
        index = index - 1;
    end
elseif (index == 1)
    [~,pos_min] = min([M(i,index), M(i, index+1)]);
    if (pos_min == 2)
        index = index + 1;
    end
else
    [~,pos_min] = min([M(i,index-1),M(i,index), M(i, index+1)]);
    if (pos_min==2)
        index = index - 1;
    elseif (pos_min == 3)
        index = index + 1;
    end
end
vert_seam(1) = index;
end