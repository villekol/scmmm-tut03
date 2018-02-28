function found = findperson(this,others)
% Check if person this is found in person list others.

cmp = @(x) (x.name == this.name && x.gender == this.gender && ...
    x.target == this.target && x.strict == this.strict && ...
    x.data == this.data);

comparisons = arrayfun(@(x) cmp(x),others);

if any(comparisons)
    found = true;
else
    found = false;
end

end