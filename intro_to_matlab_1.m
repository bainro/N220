% unnecessary; clears previous output
clear all; close all; clc;

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

% 5 divided by 2 and throw out the remainder/decimal
ceil_div_ans = ceilDiv(5, 2);
disp("ceil: " + ceil_div_ans);
% same thing but round up to the next whole number
floor_div_ans = floorDiv(5, 2);
disp("floor: " + floor_div_ans);

%% IF / ELSE STATEMENTS

you_study = true;

if you_study
    your_grade = "good";
end

if not(you_study)
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
% '==' is checking if the two are equal, returning true of false
if they_choose == "✊"
    disp(":(") % you lose
elseif they_choose == "✋️"
    disp(":)") % you win
else
    disp(":/") % tied
end

%% FOR LOOPS

% another way to create an array
one_thru_ten = 1:1:10; 
% we'll use this variable to add up the array elements
running_sum = 0;

for individual_array_element = one_thru_ten
  running_sum = running_sum + individual_array_element;
end

disp("the sum of 1-10 is: " + running_sum)

%% MATRICES

% Anything in square brackets is a matrix
row_vector = [1 2 3 4 5 6]
col_vector = transpose(row_vector)
two_by_three_matrix = [1 2 3; 4 5 6]
% ' is the transpose operator, a shortcut for the transpose function
three_by_two_matrix = two_by_three_matrix'
% use indices inside parenthesis to get a specific value from a matrix:
disp("first row, second column of matrix: " + two_by_three_matrix(1, 2))
% use the colon operate obtain multiple values:
disp("first row of matrix: " + two_by_three_matrix(1, 1:3))
% colon by itself to implicitally grab 'all' values from the row
disp("second row of matrix: " + two_by_three_matrix(2, :)) 

% Be careful! Matrix operators often have two forms: 
% matrix algebra form (*, / and ^) and element-wise form (.*, ./ and .^)

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