% unnecessary for small scripts; clears previous output and windows
clear all; close all; clc;   % clear vars, close figs, clear command window

%% Free, official matlab demos:
% Just type "demos" into the Command Window.

%% COMMENTS
% <-- comments in matlab start with this symbol
% everything after '%' on this line is ignored. 

%{
This is a multi-line comment.
So this line is ignored by matlab too.
And this! Etc...
COMMENT YOUR CODE! Especially the hard parts.
Your future self and anyone else who reads 
your code will thank you! *cough* Bruce *cough*
%}

%% BASIC SYNTAX (think grammar for nerds)
5
5 + 2
5 * 2
5 / 2
% 4 raised to the power of 3,000,000,000 (9 zeros)
4 ^ 3e9
% use a semi-colon to suppress output:
4 ^ 3;

%% STRINGS (represent text rather than numbers)
% ⚠️ IMPORTANT: double quotes " " create modern string objects.
% Single quotes ' ' create character arrays, which behave differently.
"hello world";
"mom get the camera, I'm coding!";
"👁️❤️️🎃☕";

%% ASSIGNING RESULTS TO VARIABLES
% we can save our calculations into variables:
my_1st_var = "✊✋️✌️";
% other languages call this a matrix, list, row_vector, etc.
my_1st_array = ["✊", "✋️", "✌️"];

%% PRINTING VARIABLES
disp(my_1st_array)
disp("the 1st element of my array is: " + my_1st_array(1))

%% USING BUILT-IN MATLAB FUNCTIONS
% Functions take inputs inside parentheses and return outputs
ceil_div_ans = ceil(5/2);   % round 5/2 up
disp("ceil: " + ceil_div_ans);
floor_div_ans = floor(5/2); % round 5/2 down
disp("floor: " + floor_div_ans);

%% IF / ELSE STATEMENTS
you_study = true;
if you_study
    your_grade = "good";
end
if not(you_study)   % 'not' can also be written as '~'
    your_grade = "not so good";
end
disp("your grade is " + your_grade)

you_study = false;
if you_study
    your_grade = "good";
else
    your_grade = "not so good";
end
disp("your grade is " + your_grade)

% rock, paper, scissors example of "elseif"
choices = ["✊", "✋️", "✌️"];
% what's our choice?
our_choice = choices(3);
number_of_choices = length(choices);
random_element_id = randi(number_of_choices);
they_choose = choices(random_element_id);
% outcome based on your opponent's random choice
% '==' checks equality. Works with string objects " ".
% For character arrays ' ' you would instead use strcmp().
if they_choose == "✊"
    disp(":(") % you lose
elseif they_choose == "✋️"
    disp(":)") % you win
else
    disp(":/") % tied
end

%% FOR LOOPS
% another way to create an array of numbers
one_thru_four = 1:1:4;
% we'll use this variable to add up the array elements
running_sum = 0;
% note all the repitition!
running_sum = running_sum + one_thru_four(1);
running_sum = running_sum + one_thru_four(2);
running_sum = running_sum + one_thru_four(3);
running_sum = running_sum + one_thru_four(4);

% for loops are great to avoid repitition
running_sum = 0;
for individual_array_element = one_thru_four
  running_sum = running_sum + individual_array_element;
end
disp("the sum of 1-4 is: " + running_sum)

%% MATRICES
% Anything in square brackets is a matrix
row_vector = [1 2 3 4 5 6]
col_vector = transpose(row_vector)
two_by_three_matrix = [1 2 3; 4 5 6]
% ' is the transpose operator, a shortcut for the transpose function
three_by_two_matrix = two_by_three_matrix'
% MATLAB indexing is row, column (like math notation):
disp("first row, second column of matrix: " + two_by_three_matrix(1, 2))
% use the colon operator to obtain multiple values:
two_by_three_matrix(1, 1:3)
% colon by itself to grab 'all' values along that dimension:
two_by_three_matrix(2, :)
% Be careful! Matrix operators often have two forms: 
% matrix algebra form (*, / and ^) and element-wise form (.*, ./ and .^)
[1 2 3] .* [4 5 6]   % element-wise multiply
[1 2 3] * [4; 5; 6]  % matrix multiply

%% WRITING FUNCTIONS (must be at the end of the file)
disp("sum of 49, 50, and 51: " + sum_array(49, 51))
% SYNTAX: function returned_value = fx_name([var1, var2, ...])
function running_sum = sum_array(start_n, end_n)
    % sums whole numbers between function argument 1 and 2
    fx_array = start_n:1:end_n;
    running_sum = 0;
    for individual_array_element = fx_array
      running_sum = running_sum + individual_array_element;
    end
end
