function distance=min_st_distance(seg,traj)
%���ڸ�����segment seg���ҳ�trajectory trai�о���seg�����seg'�ľ��루mbr distance��
%input: seg=[xs,ys,xd,yd] traj=[x1,x2,x3...;y1,y2,y3...]

segs=m_segment(traj(1,:),traj(2,:));
[h,~]=size(segs);
num_segs=h;

distances=zeros(num_segs,1);
for i=1:num_segs
    distances(i,1)=mbr_distance(seg,segs(i,:));
end

distance=min(distances);