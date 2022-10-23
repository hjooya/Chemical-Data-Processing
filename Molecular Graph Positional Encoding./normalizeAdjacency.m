
function [ANorm] = normalizeAdjacency(A)

% Normalize Adjacency Function
% The normalizeAdjacency function takes as input the adjacency matrix A and returns the normalized adjacency matrix D^-1/2.A.D^-1/2,
% where A=A+I_N is the adjacency matrix of a graph with added self-connections,
% I_N is the identity matrix, and D is the degree matrix of A.

% Add self connections to adjacency matrix.
A = A + speye(size(A));

% Compute inverse square root of degree.
degree = sum(A, 2);
degreeInvSqrt = sparse(sqrt(1./degree));

% Normalize adjacency matrix.
ANorm = diag(degreeInvSqrt) * A * diag(degreeInvSqrt);

end