function a=acceleration(r,N,k,g)
a=[];
for i=1:N
    x=r(i,1);
    if x<3
        a(i,:)=[0,-9.81];
    end
    
    if x<=7 && x>=3 
        a(i,:)=[k*(r(i,2)-2)/50*(r(i,1)-5),-g+k*(1-r(i,2)^2/100)];
    end
    
    if x>7
        a(i,:)=[0,-9.81];
    end
    
end

end