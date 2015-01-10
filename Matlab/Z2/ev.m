% Gauss–Seidel method (Einzelschrittverfahren) for solving
% the system of linear equations Ax=b up to a desired 
% accuracy norm(Ax-b,inf)<eps
%
% Input:
%   A:   square matrix, size(A) = [n,n]
%   b:   column vector, size(b) = [n,1]
%   eps: desired tolerance, eps>0
%
% Input (optional):
%   x0:    initial vector (default: zeros(size(b)))
%   maxit: maximum number of iterations (default: 1000)
%
function x = ev(A,b,eps,x0,maxit)

if nargin<5
    maxit=1000;
end

if nargin<4 ||  any(size(x0) -size(b))
    x0 = zeros(size(b));
end

%NOTE: no check of the sizes of A and b,
%      since the algorithm will fail anyway if 
%      the do not match



%A = L+D+R
D = diag(diag(A));
L = tril(A,-1);
R = triu(A,1);

% A = M-N 
% Ax=b -> Mx-Nx = b -> Mx = Nx+b
% -> x^{k+1} = M\(N*x^k+b) = M\(N*x^k)+M\b

N = -R;
M = (D+L);

c = M\b;

x=x0;

it=1;%iteration counter


while it<maxit && norm(A*x-b,'inf')>eps
    
    

    x = M\(N*x) + c;
    
  
    it = it+1;
end



end
