% Partner matching based on fuzzy/multivalued logic
% Soft Computing Methods of Mathematical Modelling, spring 2018
% Group TUT03, Ville Koljonen, 252962, ville.koljonen@student.tut.fi
% main program

close all
clear variables

disp('Welcome to Fuzzy ParMat program,')
disp('the ultimate partner matching program')
disp('that uses fuzzy logic to match you to')
disp('another user in our database!')

this = ask();
others = load('maindata.mat');
others = others.others;

[sgntothers,fits] = allcompare(this,others);

if isempty(sgntothers)
    disp('Unfortunately it seems that our')
    disp('database did not contain any fits for you.')
    disp('Please try again later, when')
    disp('we have more users to match you with!')
else
    disp('Your significant others')
    disp('in order of descending fit are:')

    for i = 1:length(sgntothers)
        disp(sgntothers(i).name)
    end
    
    disp(' ')
    disp('Congratulations!')
end