% test algorithm for larger data sets

clear variables
close all

N = 64;
seeds = 1:10000;
adjs = struct;

waittext = ['Calculating 1/' int2str(length(seeds))];
h = waitbar(0,waittext);

for k = 1:length(seeds)
    
    others = generateothers(N,seeds(k));
    A = zeros(N);
    F = zeros(1,N);

    for i = 1:length(others)
        [sgntothers,fits] = allcompare(others(i),others);
        
        if ~isempty(sgntothers)
            F(i) = max(fits);
            for j = 1:length(sgntothers)
                for l = 1:length(others)
                    if isequal(sgntothers(j),others(l))
                        A(i,l) = 1;
                        break
                    end
                end
            end
        end
    end
    
    adjs(k).A = A;
    adjs(k).maxfits = F;
    adjs(k).numfits = sum(A,2);
    
    waittext = ['Calculating ' int2str(k+1) '/' int2str(length(seeds))];
    waitbar(k/length(seeds),h,waittext)
    
end

delete(h)

maxfits = arrayfun(@(x) max(x.maxfits),adjs);
maxnums = arrayfun(@(x) max(x.numfits),adjs);
