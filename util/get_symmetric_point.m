function sym_point = get_symmetric_point(input_point,A,B,C)
%
% Function get_symmetric_point
%
% Return the symmetric point data with given point and three points on the
% plane.
%
% Inputs:
%           input_point:    Position 1x3 double
%           A,B,C:          Position of three points on the plane
%
% Outputs:
%           sym_point:      Position of symmetric point
normf = cross( B-A, B-C );
normf = normf / norm(normf);
a = normf(1);
b = normf(2);
c = normf(3);
d = -a*A(1) - b*A(2) - c*A(3);
k = (a * input_point(1)+ b * input_point(2) +c * input_point(3) +d)/(a*a+b*b+c*c);
symX = input_point(1) - 2*k*a;
symY = input_point(2) - 2*k*b;
symZ = input_point(3) - 2*k*c;
sym_point = [symX symY symZ];