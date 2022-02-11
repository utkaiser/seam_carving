function hor_seam = compute_optimal_horizontal_seam(I)
%Compute the optimal horizontal seam given an image.

M = cumulative_minimum_energy_map(I,'Horizontal');
[row_size, column_size] = size(M);
hor_seam = zeros(1,column_size);
[~, index] =  min(M(:,column_size));
hor_seam(column_size) = index;

for i=column_size-1:-1:2
    %right edge
    if (index == row_size)
        [~, pos_min] = min([M(index,i-1), M(index-1,i-1)]);
        if (pos_min == 2)
            index = index - 1;
        end
    %left edge
    elseif (index == 1)
        [~, pos_min] = min([M(index,i-1), M(index+1,i-1)]);
        if (pos_min == 2)
            index = index + 1;
        end
    else
        [~, pos_min] = min([M(index,i-1), M(index-1,i-1), M(index+1,i-1)]);
        if (pos_min == 2)
            index = index - 1;
        elseif (pos_min == 3)
            index = index + 1;
        end
    end
    hor_seam(i) = index;
end

%first column
i = 1;
index = hor_seam(2);
if (index == row_size)
    [~, pos_min] = min([M(index,i), M(index-1,i)]);
    if (pos_min == 2)
        index = index - 1;
    end
elseif (index == 1)
    [~, pos_min] = min([M(index,i), M(index+1,i)]);
    if (pos_min == 2)
        index = index + 1;
    end
else
    [~, pos_min] = min([M(index,i), M(index-1,i), M(index+1,i)]);
    if (pos_min == 3)
        index = index + 1;
    elseif (pos_min == 2)
        index = index - 1;
    end
end
hor_seam(1) = index;
end