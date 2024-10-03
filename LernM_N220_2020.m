%script LernM_N220_2020 (McNaughton 2019.04.02: update 2020.10.03) 

% any text preceeded by a % is just a comment, not part of the code.  You
% should comment your code well enough that at least YOU can understand it
% when you come back to it a year later.  You will be surprised at how hard it is 
% to understand your own code without the comments ;)

%Simulation of the heteroassociative (or autoassociative) learning matrix
% based on a binary system with a N by N synaptic matrix W, 'hebbian' weights
% {0,1}, and binary {0,1} inputs and outputs

% all called functions are native MatLab functions. Use help 'FunctionName'
% to get info on proper usage.  e.g., "help zeros" will give you an
% explanation of the zeros function

% Model is set up for heteroassociation.  You can make it autoassociative
% by swapping the comment in the two lines highlighted by %**********************.

%   for loop:  You can introduce a global for loop here to run simulations
%   in which multiple values of a variable are assessed 
%
%
%   the simulation can be run nTrials times, in which case it computes
%   average results for degree of Saturation and Error rate

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%initialize the parameters of the model
N = 24;             %   N is the size of each input vector, i.e., the W matrix will be N by N 
M = 8;              %   M is the number of active inputs
R = 8;            %   R is the number of input patterns (or pattern pairs if heteroassociative)
nTrials = 1;%   The number of times to run the simulation in order to get a better approximation of the average results 
figure(1); figure(2); disp('position figs side by side, then hit any key to continue');  %pause;    
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
a=M./N;                           %  sparsity of the input and output vectors (proportion of 1s in the input)
mmax = log(0.5)/log(1-(M/N).^2)  %  Just FYI mmax is the 50% saturation level

s=zeros(1,N);s(1:M)=1;      % s is a row vector of length N with ones in the first M places.  
                            % The ones will be scrambled below to create each input random vector
Inhib= sum(s);              % This will be the output divisor (inhibition level)

% Initializs the accumulators to zero  
total_error_rate = 0;       % We will calculate the error and success rates for each simulation and then average this over trials.  
total_succs_rate = 0;       % Error = 1 if there are any errors regardless of how many.  
                            % In this kind of model, the only errors are when too many ones appear at the output
avgSaturationLevel = 0;     % Success = 1 if the pattern was recalled perfectly
                                                    
                          
for c=1:nTrials;            % main computation for loop 
    
    W = zeros(N,N);         % initialize the weight matrix to zero.  This matrix is binary {0,1}
    Wr=zeros(N,N);          % to accumulate the actual sum of the outer products.  This allows visualization of the number of times a connection has been used
    xlist=zeros(N,R);       % storage for the R column vectors (x)   
    ylist=zeros(R,N);       % storage for the R row vectors    (y)
        for k=1:R           % create the R pattern pairs and 'train' the network
            x= s(randperm(N))';     % scramble the elements of s to create a COLUMN vector x of length N with M ones distributed randomly 
            
            %***************************************************************************
            % comment out one of the following two lines.  Allows you to switch between hetero and autoassociative
            y = x';                 % AUTO:  For autoassociation, its the
                                        %same pattern  so we just transpose it. x' means x_transpose
           % y= s(randperm(N));       % Hetero:  For heteroassociation use y= s(randperm(n)); a new random vector
            %**************************************************************************

            delW = x*y;         % computes the matrix of synaptic weight increments ('deltaWij') using the outer product function
            Wr = Wr + delW;     % this just takes the sum of the delW so you can see how the overlap builds up
            W= or(W,delW);      % perform the inclusive OR with the weight matrix.  Output is 1 if synapse has ever been modified
                                % This gives the binary {0,1} weight matrix
             
        %save the x and y patterns for later recall test
            xlist(:,k)=x;       % In Matlab array indexing, x(5,9) means the 5th element down of the 9th column
            ylist(k,:)=y;        %  the operator : means all, so x(:,9) means all elements of the 9th column, which is a 9 x 1 column vector          
%###################################################################################
% optional plot. Skip it if you are running a big simulation
           if c==nTrials  % for the last trial, watch the W matrix develop
             figure(1); imagesc(W);axis square; colormap(gray); shg ;
             figure(2); imagesc(Wr);axis square; colorbar; shg ;
             pause(.5) % display the W as colors and pause briefly so you can see it build up. 
                        % You can vary the time (in sec) or just say pause, and then hit any key to continue
           end
     
        end                     


SaturationLevel = nnz(W)./N.^2;   %compute the proportion of nonzero elements in the W 
avgSaturationLevel = avgSaturationLevel + SaturationLevel;
                                    
% Now submit each of the R x inputs and compute the corresponding y output.  Check if
% it is a match and count the errors
% In this model, the outputs will contain all the correct bits, errors will
% be the inclusion of one or more extra bits that were zero in the original pattern

    nerr=0;
    nsuc=0;
    err=zeros(1,R);
        for k=1:R
            Out= xlist(:,k)'*W;  ;  %  be careful to get the matrix multiplication in the correct form
            Out = floor(Out./Inhib);   %floor rounds down to the nearest integer
            %disp((Out)-ylist(k,:)) %debug 
            err(k) = sum((Out-ylist(k,:)).^2); % calculate the sum of squared error terms
            if (err(k)>0);nerr = nerr + 1;      % if there was any error increase nerr
            else nsuc = nsuc + 1;end            % otherwise increase the number of successes
        end
    errRate = nerr./R;                    % the error rate is the number of incorrect patterns divided by the number of patterns (R)
    sucRate = nsuc./R;
    total_error_rate = total_error_rate + errRate;  %Accumulate error rate over trials
    total_succs_rate = total_succs_rate + sucRate;
end

% Ok, we're done with all the trials so compute the average error rate
avgSaturationLevel = avgSaturationLevel./nTrials;
avg_error_rate=total_error_rate./nTrials;
avg_succs_rate=total_succs_rate./nTrials;
                                              

figure(1);  title('Binary Weight Matrix')  %put a title on the figure - the single quotes are used to define a character array
figure(2);  title('Real valued Weight Matrix')  %put a title on the figure

%   end global for loop
%prepare formatted output table and display 
format shortg;
Params={'N';'R';'a';'saturation';'error rate';'success rate)'};  % this is called a cell array (https://www.mathworks.com/help/matlab/cell-arrays.html)
Values = {N;R;a; avgSaturationLevel; avg_error_rate ; avg_succs_rate }; %another cell array - defined by using { }
t=table(Params, Values);                                        %help table
disp(t)


