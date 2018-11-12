function [ value ] = lines_intersect( aX,aY,bX,bY,cX,cY,dX,dY )
%LINES_INTERSECT Summary of this function goes here
%   Detailed explanation goes here
    denominator = ((bX - aX) * (dY - cY)) - ((bY - aY) * (dX - cX));
    numerator1 = ((aY - cY) * (dX - cX)) - ((aX - cX) * (dY - cY));
    numerator2 = ((aY - cY) * (bX - aX)) - ((aX - cX) * (bY - aY));

    % Detect coincident lines (has a problem, read below)
    if (denominator == 0)
         value = numerator1 == 0 && numerator2 == 0;
         return
    end
    r = numerator1 / denominator;
    s = numerator2 / denominator;

    value = (r >= 0 && r <= 1) && (s >= 0 && s <= 1);

end

