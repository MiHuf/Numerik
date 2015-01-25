
clear all
close all


a = 0;
b = 2*pi;

m = 5;

f = @(x)(sin(x));

xs = a:(b-a)/m:b;
fs = f(xs);

xs=xs(:);
fs=fs(:);


M_ref = spline_ref(xs,fs);
M = spline(xs,fs);

try
    nM = norm(M-M_ref,'inf');
    disp(['||M-M_ref|| = ',num2str(nM)])
catch err
    nM = -1;
    disp('call to spline was not successfull!')
    disp(getReport(err))
end




x = a:0.01:b;
y_ref = zeros(size(x));

for i=1:length(x)
    y_ref(i) = splineval_ref(x(i),xs,fs);
end

try
    y = zeros(size(x));
    for i=1:length(x) 
        y(i) = splineval(x(i),xs,fs);
    end
    
    ny = norm(y-y_ref);
disp(['||y-y_ref|| = ',num2str(ny)])
catch err
    ny = -1;
    disp('call to splineval not successfull');
      disp(getReport(err))
end






plot(x,f(x));
hold on

plot(xs,fs,'*')

plot(x,y_ref,'r')