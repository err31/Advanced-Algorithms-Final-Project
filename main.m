% The dimensions of the matrix
n = 5;

% The maximum number of systems of equations to solve
maxIter = 5;

%Creates the n by n matrix A
A = randn(n,n);

% Creates maxIter number of n by 1 vectors
b = randn(n,maxIter);

% Start solving the systems, using tic/toc to record the runtime
% tic starts the timer, toc stops the timer and outputs the time

%Solve the system using the LU factorization
tic;
[L,U,P] = lu(A);
for i = 1:maxIter
    X1 = forSub(L,P*b(:,i));
    X1 = backSub(U,X1);
end
toc;

% Solv the system using the SVD
tic;
[U2,D,V] = svd(A);
Dinv = diag(1./diag(D));
for i = 1:maxIter
    X2 = V*(Dinv*(U2'*b(:,i)));
end
toc;

% Solve the system using the QR factorization
tic;
[Q,R] = qr(A);
for i = 1:maxIter
    X3 = backSub(R,Q'*b(:,i));
end
toc;

% Commands to recreate the matrix A from the different factorizations
% Z1 = inv(P)*L*U;
% Z2 = U2*D*V';
% Z3 = Q*R;

% Matlab backslash command to solve a system
% x_exact = A\b;