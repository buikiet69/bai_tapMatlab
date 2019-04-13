function y=g(c,f,th,t)

y=zeros(size(t));
for n=1:length(f):
    y=y+c(n)*cos(2*pi*f(n.*t+th(n)));
end;