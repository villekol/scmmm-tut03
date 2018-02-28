function fit = paircompare(first,second)
% Find the fit of the second to the first as described in the report.

similarity = zeros(1,size(first.data,2));
sim = @(x) (4 - abs(x(1,1) - x(1,2))) / (4 * x(2,1));

for i = 1:size(first.data,2)
    if first.data(1,i) == second.data(1,i)
        similarity(i) = 1;
    else
        similarity(i) = sim([first.data(:,i) second.data(:,i)]);
    end
end

if first.strict
    fit = lukasiewicz(similarity);
else
    fit = min(similarity);
end

end