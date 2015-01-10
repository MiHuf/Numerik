% Löse RWP mit EV
% Numerische Mathematik, WiSe 2014

n = 20;
[A, b] = RWP(n);
u = ev(A,b,1e-16);
U = reshape(u,[n,n]);

U_ex = zeros(n,n);
for i=1:n;
    for j=1:n;
        xi = (i-1)/n;
        yj = (j-1)/n;
        U_ex(j,i) = cos(2*pi*yj)*xi^2*(1-xi)^2;
    end
end
Delta = U - U_ex;

surf(Delta);
