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
my_1st_array = ["✊", "✋️", "✌️"];

%% PRINTING VARIABLES
disp(my_1st_array)
disp("the 1st element of my array is: " + my_1st_array(1))

%% USING FUNCTIONS

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

Matlab is Case Sensitive. a=b  is not the same as a=B

Matrix elements have indices (row number, column number)as in W(i,j) is the value in row i, column j of W
Square brackets.  Anything in square brackets is a matrix (or vector, which is a 1D matrix
The colon operator. a:b means from a to b inclusive (or in steps). 
[1 2 3 4] is a row vector, but [1 2; 3 4] is a 2 by 2 matrix.
[1 2 3 4]’ is a column vector (the transpose of [1 2 3 4].

Matlab operators such as multiply, divide and raise to a power have two forms: matrix algebra form (*, / and ^) and element-wise form (.*, ./ and .^).  Be careful.
If x is a row vector, x' is the same numbers transposed to a column vector.  If x is a m-by-n matrix, then x' is its transpose, a n-by-m matrix in which the first row of x becomes the first column of x'.  In general, if y == x', then x(i,j)== y(j,i).

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