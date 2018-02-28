function filtered = filterothers(this,others,flag)
% Filter others by their gender or target to match
% user's (this) gender and target.

switch flag
    case 'gender'
        idx = arrayfun(@(x) x.gender == this.target,others);
    case 'target'
        idx = arrayfun(@(x) x.target == this.gender,others);
end

filtered = others(idx);

end