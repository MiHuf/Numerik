
function y = splineval_ref(x,xs,fs)



M = spline_ref(xs,fs);


%find interval and eval there
% i is first node that is larger then x
% -> x \in [xs(i-1),xs(i))
i = find(xs-x>0,1,'first');


alpha = M(1,i-1);
beta  = M(2,i-1);
gamma = M(3,i-1);
delta = M(4,i-1);


xi = xs(i-1);
%Hoelder scheme
y = ((delta*(x-xi) + gamma)*(x-xi) + beta)*(x-xi) + alpha;



end