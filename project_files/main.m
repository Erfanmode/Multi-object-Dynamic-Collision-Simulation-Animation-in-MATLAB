% N balls are released from their initial positions in 10m x 10m cage
% They are under acceleration of gravity(exerted in all places) and the force of propeller that
% comes from under the red line(ay=k*(1-y^2/100),ax=k*(y-2)*(x-5)/50 and is
% exerted in blue region
% They collide with each other and the walls surrounding them and bounce
% back with restitution coefficient of n1 and n2
% walls have no friction


clear
clc

%radius of balls is 0.1 m (can't be changed)
% N=13 Balls
% You can set the initial position of each of the balls
r0=[5.01,7.4 ;5.3,7.4 ;5.6,7.4 ;5.9,7.4 ;6.2,7.4 ;6.5,7.4 ;...
    5.4,7.8 ;5.7,7.8 ;6,7.8 ;6.3,7.8 ;...
    5.7,8.1 ; 6,8.1 ;6.3,8.1 ;];
sz=size(r0);
N=sz(1);
count=0;
v0=zeros(N,2); % You can set the initial speed for each of the balls
total_time=20; % in seconds
e=0.001; % time span in second
g=9.81; % gravity
n1=0.8; % restitution coefficient between balls
n2=0.5; % restitution coefficient between wall and balls for normal direction
        % acceleration caused by fan ay=k*(1-y^2/100),ax=k*(y-2)*(x-5)/50
k=15;
v=v0;
r=r0;
video=VideoWriter('balls and propeller');
open(video);
for t=0:e:total_time
    v=collision(v,r,n1,N);
    count=count+1;
    v=wall_collision(v,r,n2,N);
    v= v+ acceleration(r,N,k,g)*e;
    r= r+ v*e;
    if mod(count-1,32)==0
        c= linspace(0,3*pi,N);
        h1=area([3,7],[11,11]);
        h1.FaceColor=[0,0.9,1];
        hold on
        h2=area([0,3,7,10],[5,2,2,5]);
        h2.FaceColor=[0.5,0.5,0];
        hold on
        scatter(r(:,1),r(:,2),37,c,'filled');
        hold on
        plot([0,3,7,10],[5,2,2,5],'green','LineWidth',2);
        hold on
        plot([3,7],[2,2],'red','LineWidth',5);
        xlim([0,10])
        ylim([0,10])
        frame=getframe(gca);
        hold off
        writeVideo(video,frame);
    end
    
end
close(video);
