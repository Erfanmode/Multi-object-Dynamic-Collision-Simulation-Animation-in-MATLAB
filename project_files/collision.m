function vf=collision(v,r,n,N)
vf=v;
% need correction and consider angle of collision
for i=1:N-1
    for j=i+1:N
        delta_r=r(i,:)-r(j,:);
        if norm(delta_r)<0.20001
            if dot(delta_r,v(i,:)-v(j,:))<0
                r_hat=delta_r/norm(delta_r);
                v1n=dot(v(i,:),r_hat); %scalar
                v2n=dot(v(j,:),r_hat); %scalar
                v1t=v(i,:)-v1n*r_hat;  %vector
                v2t=v(j,:)-v2n*r_hat;  %vector
                v1n_=0.5*(v1n*(1-n)+v2n*(1+n)); %scalar
                v2n_=0.5*(v1n*(1+n)+v2n*(1-n)); %scalar
                vf(i,:)=v1t+v1n_*r_hat;
                vf(j,:)=v2t+v2n_*r_hat;
                
            end
        end
    end
end
end