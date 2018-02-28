function answers = ask()
% Ask the user the questions in the beginning of the program.
% The return value is a struct containing user information
% and answers to claims along their weights in a 2-by-10 matrix.

username = input('\nPlease enter your name: ','s');

while isempty(username)
    username = input('The username cannot be empty: ','s');
end

gender = input('Please enter your gender (male/female): ','s');

while ~ismember(gender,{'male','female'})
    gender = input('Please specify either male or female: ','s');
end

switch gender
    case 'male'
        gender = 0;
    case 'female'
        gender = 1;
end

target = input('Please enter your target gender (male/female): ','s');

while ~ismember(target,{'male','female'})
    target = input('Please specify either male or female: ','s');
end

switch target
    case 'male'
        target = 0;
    case 'female'
        target = 1;
end

strict = input('Do you prefer strict comparison? (yes/no) ','s');

while ~ismember(strict,{'yes','no'})
    strict = input('Please specify either yes or no: ','s');
end

switch strict
    case 'yes'
        strict = true;
    case 'no'
        strict = false;
end

disp(' ')
disp('Give your answer to each of the following claims.')
disp('  1 = strongly disagree')
disp('  2 = disagree')
disp('  3 = neither agree nor disagree')
disp('  4 = agree')
disp('  5 = strongly agree')
disp(' ')
disp('Also state the weight you would like to place on the claim.')
disp('  1 = no weight (default)')
disp('  2 = moderate weight')
disp('  3 = strong weight')
disp('Inf = absolute weight')
disp(' ')
disp('For example:')
disp('  2. My partner needs to be intelligent. 4 2')
disp('  2. My partner needs to be intelligent. 1 Inf')
disp(' ')

claims = {
    'Looks are important to me.',...
    'My partner needs to be intelligent.',...
    'My partner should enjoy travelling.',...
    'I do not care about my partner''s education.',...
    'My partner should be physically active.',...
    'My partner needs to tolerate pets.',...
    'My partner should be open about their living area.',...
    'My partner should like children.',...
    'My partner must have a secure job.',...
    'I want to spend a lot of time together with my partner.'
    };

answers = struct;
answers.name = username;
answers.gender = gender;
answers.target = target;
answers.strict = strict;
answers.data = zeros(2,length(claims));

for i = 1:length(claims)
    
    prompt = [int2str(i) '. ' claims{i} ' '];
    
    while true
        answer = input(prompt,'s');
        
        if isempty(answer)
            continue
        end
        
        value = floor(str2double(answer(1)));
        
        if length(answer) <= 2
            weight = 1;
        else
            weight = str2double(answer(3:end));
        end
        
        if isnan(value) || isnan(weight)
            disp('Huh? Separate the two values by a space.')
        elseif ~ismember(value,[1 2 3 4 5]) ...
                || ~ismember(weight,[1 2 3 Inf])
            disp('Answers in range 1-5 and weights in 1-3, Inf.')
        else
            break
        end
        
    end
    
    answers.data(1,i) = value;
    answers.data(2,i) = weight;
    
end

disp(' ')

end