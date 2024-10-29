function vf=wall_collision(v,r,n,N)
vf=v;
   for i=1:N
       dir=direction(r(i,1));
       if norm([r(i,1),wall(r(i,1))]-r(i,:))<0.1 && dot(v(i,:),dir)<0
           vL=v(i,:)-dir*dot(v(i,:),dir);
           vf(i,:)=vL-n*dir*dot(v(i,:),dir);
       end
       
       if r(i,1)<0.1 && v(i,1)<0
           vf(i,1)=-n*v(i,1);
       end
       
       if r(i,1)>9.9 && v(i,1)>0
           vf(i,1)=-n*v(i,1);
       end
       
       if r(i,2)>9.9 && v(i,2)>0
           vf(i,2)=-n*v(i,2);
       end
       
   end
end
