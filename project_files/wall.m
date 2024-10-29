% Wall Y(x)coordinates
function y=wall(x)
if x<3
    y=5-x;
end

if x>=3 && x<=7
    y=2;
end

if x>7
    y=-5+x;
end
end