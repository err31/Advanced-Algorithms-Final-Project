% The maximum dimension of the matrix
nMax = 1000;

% The maximum number of systems of equations to solve
maxIter = 100;

% ammount of dimensions to skip per matrix size iteration
dimSkip = 100;

geTime = zeros(nMax/dimSkip,maxIter);
luTime = zeros(nMax/dimSkip,maxIter);
svdTime = zeros(nMax/dimSkip,maxIter);
qrTime = zeros(nMax/dimSkip,maxIter);

for n = 1:(nMax/dimSkip)
    %Creates the n by n matrix A
    A = randn(n*dimSkip,n*dimSkip);

    % Creates maxIter number of n by 1 vectors
    b = randn(n*dimSkip,maxIter);
    
    for iter = 1:maxIter
        % Start solving the systems, using tic/toc to record the runtime
        % tic starts the timer, toc stops the timer and returns the time

        %Solve the system using the Gaussian Elimination
        tic;
        for i = 1:iter
            X1 = GaussElimination(A,b(:,i));
        end
        geTime(n,iter) = toc;
        
        %Solve the system using the LU factorization
        tic;
        [L,U,P] = lu(A);
        for i = 1:iter
            X2 = forSub(L,P*b(:,i));
            X2 = backSub(U,X2);
        end
        luTime(n,iter) = toc;

        % Solve the system using the SVD
        tic;
        [U2,D,V] = svd(A);
        Dinv = diag(1./diag(D));
        for i = 1:iter
            X3 = V*(Dinv*(U2'*b(:,i)));
        end
        svdTime(n,iter) = toc;

        % Solve the system using the QR factorization
        tic;
        [Q,R] = qr(A);
        for i = 1:iter
            X4 = backSub(R,Q'*b(:,i));
        end
        qrTime(n,iter) = toc;
    end
end

% Commands to recreate the matrix A from the different factorizations
% Z1 = inv(P)*L*U;
% Z2 = U2*D*V';
% Z3 = Q*R;

% Matlab backslash command to solve a system
% x_exact = A\b;
