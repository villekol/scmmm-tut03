% create a database of others

males = {'Terry','Kristopher','Warren','Emmett','Ken',...
    'Jared','Delbert','Erik','Clifton','Benny'};
females = {'Julia','Andrea','Sabrina','Bertha','Shirley',...
    'Florence','Tabitha','Blanche','Maureen','Marta'};
names = [males females];

rng('default')

maletargets = datasample([0 1],10,'Weights',[0.1 0.9]);
femaletargets = datasample([0 1],10,'Weights',[0.1 0.9]);
targets = [maletargets femaletargets];

malestricts = datasample([false true],10,'Weights',[0.7 0.3]);
femalestricts = datasample([false true],10,'Weights',[0.7 0.3]);
stricts = [malestricts femalestricts];

malevalues = randi(5,[10 10]);
maleweights = floor(10*rand(10));
maleweights(maleweights == 0) = Inf;
maleweights(abs(maleweights - 2) <= 1) = 1;
maleweights(abs(maleweights - 5) <= 1) = 2;
maleweights(abs(maleweights - 8) <= 1) = 3;

femalevalues = randi(5,[10 10]);
femaleweights = floor(10*rand(10));
femaleweights(femaleweights == 0) = Inf;
femaleweights(abs(femaleweights - 2) <= 1) = 1;
femaleweights(abs(femaleweights - 5) <= 1) = 2;
femaleweights(abs(femaleweights - 8) <= 1) = 3;

values = [malevalues;femalevalues];
weights = [maleweights;femaleweights];

others = struct;

for i = 1:20
    others(i).name = names{i};
    
    if i <= 10
        others(i).gender = 0;  % male is 0
    else
        others(i).gender = 1;  % female is 1
    end
    
    if targets(i)
        others(i).target = ~others(i).gender;
    else
        others(i).target = others(i).gender;
    end
    
    others(i).strict = stricts(i);
    others(i).data = [values(i,:);weights(i,:)];
end

save('test.mat','others')