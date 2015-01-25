

function M = spline_ref(xs,fs)

%xs holds the points x0,...xn -> n+1 points
% we have n intervals
n = length(xs)-1;

%make xs,fs row vectors for later use
xs = reshape(xs,1,n+1);
fs = reshape(fs,1,n+1);


hj = xs(2:end)-xs(1:end-1);

Kj = hj(1:end-1)+hj(2:end);


A =  spdiags(hj(:),-1,n-1,n-1)...
    +spdiags( 2*Kj(:),0,n-1,n-1)...
    + spdiags(hj(:),1,n-1,n-1);




b = 6./hj(2:end).*(fs(3:end)-fs(2:end-1)) ...
    - 6./hj(1:end-1).*(fs(2:end-1)-fs(1:end-2));



%moments
m = [0; A\b(:); 0];
m = reshape(m,1,n+1); %have a row vector

M = zeros(4,n);
M(1,1:n) = fs(1:n);
M(2,1:n) = (fs(2:n+1)-fs(1:n))./hj - (2*m(1:n)+m(2:n+1)).*hj/6 ;
M(3,1:n) = m(1:n)/2;
M(4,1:n) = (m(2:n+1)-m(1:n))./(6*hj);



end