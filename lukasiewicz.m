function y = lukasiewicz(X)
% Find the Lukasiewicz product of elements of vector X.

if length(X) == 2
    y = max([0 X(1)+X(2)-1]);
else
    y = max([0 X(1)+lukasiewicz(X(2:end))-1]);
end

end