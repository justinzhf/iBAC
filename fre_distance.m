function distance=fre_distance(traj1,traj2)
cord1=traj1.cord;
cord2=traj2.cord;
[~,cord1_w]=size(cord1);
[~,cord2_w]=size(cord2);

distance=0;

for i=1:cord1_w
    for j=1:cord2_w
        dis=norm(cord1(:,i)-cord2(:,j));
        if dis>distance
            distance=dis;
        end
    end
end


end