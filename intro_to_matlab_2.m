%% calculate and plot input length vs recall for autoassociate LernMatrix
% unnecessary; clears previous output
clear all; close all; clc;

M = 4; % number of active neurons in a given pattern
R = 4; % total number of pattern sequences to encode
L = 8; % length of an individual pattern sequence

input_lengths = 12:1:72;
recalls = [];
for N = input_lengths % N is the number of input neurons
    recalls(end+1) = modified_Lern(N, M, R, L);
end

f = figure(); % plot results
plot(input_lengths, recalls)
xlabel("input length");
ylabel("correct recall (%)");
title("Input Length Vs Recall Accuracy");

function success_rate = modified_Lern(N, M, R, L)            
    % TRAINING
    s = zeros(1,N); % list of N 0s
    s(1:M) = 1;     % Replace first M 0s with 1s
    W = zeros(N,N);         
    xlist = zeros(N,R,L); % storage for the R column vectors (x)   
    ylist = zeros(R,N);   % storage for the R row vectors    (y)
    for k = 1:R           % train loop
        y = 0;
        for l = 1:L
            x = s(randperm(N))';  % shuffled COLUMN vector of length N with M ones   
            xlist(:,k,l) = x;     % save for later testing
            if y == 0 % first loop, so wait for second input
                y = x';  % The ' character is a transpose. It rotates a matrix.
                continue % exit the most inner for loop early. Just set up.
            end
            % computes the synaptic weight changes using the outer product
            delW = x * y;
            W = or(W, delW); % the OR operator combines new and old synapses
            y = x'; % detonator input will be the recurrent input next time
            % success will be recalling the final output of the sequence
            if l == L
                ylist(k,:) = y;        
            end
        end
    end                

    % TESTING
    nsuc = 0; % number of successes
    for k = 1:R
        Out = 0;
        for l = 1:L-1
            if l == 1 % Get the original input from training
                x = xlist(:,k,l);
            else
                x = Out'; % use previous loop's output as input
            end
            Out = x' * W';
            inhib = sum(x);
            Out = floor(Out ./ inhib);
        end
        err = Out - ylist(k,:);
        err = sum(err .^ 2); % sum of squared errors
        if err == 0
            nsuc = nsuc + 1; % correct inference!
        end
    end
    success_rate = nsuc ./ R;
end