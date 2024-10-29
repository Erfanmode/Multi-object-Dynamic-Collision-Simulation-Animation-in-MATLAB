function direc=direction(x)
if x<3
    direc=1/sqrt(2)*[1,1];
end
if x<=7 && x>=3
    direc=[0,1];
end
if x>7
    direc=1/sqrt(2)*[-1,1];
end

end