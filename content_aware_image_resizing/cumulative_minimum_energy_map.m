function cum_min_energy_map = cumulative_minimum_energy_map(I, direction)
%computes cumulative_minimum_energy_map vertically or horizontally

e_values = energy_function(I);
%e_values = energy_function_variantions()
[row_size, column_size] = size(e_values);
M = e_values;
if strcmp(direction, 'Vertical')
    %computes cumulative minimum energy M vertically 
    for i=2:row_size
        for j=1:column_size
            if (j == column_size)
                M(i,j) = e_values(i,j) + min([M(i-1,j), M(i-1,j-1)]);
            elseif (j == 1)
                M(i,j) = e_values(i,j) + min([M(i-1,j), M(i-1,j+1)]);
            else
                M(i,j) = e_values(i,j) + min([M(i-1,j-1), M(i-1,j), M(i-1,j+1)]);
            end
        end
    end
    
elseif strcmp(direction, 'Horizontal')
    %computes cumulative minimum energy M horizontally
    for j=2:column_size
        for i=1:row_size
            if (i == row_size)
                M(i,j) = e_values(i,j) + min([M(i,j-1), M(i-1,j-1)]);
            elseif (i == 1)
                M(i,j) = e_values(i,j) + min([M(i,j-1), M(i+1,j-1)]);
            else
                M(i,j) = e_values(i,j) + min([M(i-1,j-1), M(i,j-1), M(i+1,j-1)]);
            end
        end
    end
    
else
    ME = MException("wrong direction for cumulative minimum energy map");
    throw(ME);
end
cum_min_energy_map = M;
end
