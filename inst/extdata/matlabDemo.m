function y = f(x)
% This is a quick demonstration of MATLAB syntax. Its output is uninteresting.
z = pi;
if (z == 0)
  z = 10;
else
  disp('OK');
end
for i = 1:10
  z2 = i - z;
end
y = z + x - (1 * 3 / 9) ^ 2 + z2;
