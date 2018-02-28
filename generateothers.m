function others = generateothers(N,varargin)

if isempty(varargin) || varargin{1} < 0
    rng('default')
else
    rng(varargin{1})
end

genders = datasample([0 1],N,'Weights',[0.5 0.5]);
targets = datasample([0 1],N,'Weights',[0.1 0.9]);
stricts = datasample([0 1],N,'Weights',[0.7 0.3]);

values = randi(5,[N 10]);

weights = floor(10*rand(N,10));
weights(weights == 0) = Inf;
weights(abs(weights - 2) <= 1) = 1;
weights(abs(weights - 5) <= 1) = 2;
weights(abs(weights - 8) <= 1) = 3;

others = struct;

for i = 1:N
    
    others(i).name = int2str(i);
    others(i).gender = genders(i);  % male is 0, female 1
    
    if targets(i)
        others(i).target = ~others(i).gender;
    else
        others(i).target = others(i).gender;
    end
    
    others(i).strict = stricts(i);
    others(i).data = [values(i,:);weights(i,:)];
end

% save('testdata.mat','others')

end