function root_node=ibc_merge(clusters,seg_acc_threhold,tra_acc_threhold)
[~,clus_w]=size(clusters.clus);

for i=1:clus_w
    [~,traj_w]=size(clusters.clus(i));
    chose_traj=unidrnd(traj_w);
    T_data(i)=clusters.clus(i).cla(chose_traj);
end


trajectories=T_data'; %注意，要转置一下
[traj_h,~]=size(trajectories);
chose_traj=unidrnd(traj_h);
root_traj=trajectories(chose_traj);
root_segs=m_segment(root_traj.cord(1,:),root_traj.cord(2,:));

[rs_h,~]=size(root_segs);
chose_seg=unidrnd(rs_h);
root_segs(chose_seg,:)=[];
root_node=struct('chose_seg',chose_seg,'length',0,'cla',[],'left',[],'right',[]);
root_node.cla=trajectories;
root_node=ibc_tree(root_node,tra_acc_threhold,seg_acc_threhold,root_segs);
end