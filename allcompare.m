function [sgntothers,fits] = allcompare(this,others)
% Compare this against the database others and return potential partners.

candidates = filterothers(this,others,'gender');
candidates = filterothers(this,candidates,'target');

firstfits = zeros(size(candidates));
secondfits = zeros(size(candidates));

for i = 1:length(candidates)
    firstfits(i) = paircompare(this,candidates(i));
    
    if ~isequal(firstfits(i),0) && ~isequal(this,candidates(i))
        secondfits(i) = paircompare(candidates(i),this);
    end
end

ispair = (firstfits > 0) & (secondfits > 0);

sgntothers = candidates(ispair);

fits = [firstfits(ispair);secondfits(ispair)];
fits = min(fits);

[fits,idx] = sort(fits,'descend');
sgntothers = sgntothers(idx);

end