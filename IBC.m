function root_node=IBC(T,seg_acc_threhold,tra_acc_threhold)
%input: T 1 x N struct array, struct('id','xxxx','clus_id',123,'cord',[])
%



trajectories=T'; %注意，要转置一下
[traj_h,~]=size(trajectories);
chose_traj=unidrnd(traj_h);
root_traj=trajectories(chose_traj);
root_segs=m_segment(root_traj.cord(1,:),root_traj.cord(2,:));

%todo
[rs_h,~]=size(root_segs);
chose_seg=unidrnd(rs_h);
root_segs(chose_seg,:)=[];
root_node=struct('chose_seg',chose_seg,'length',0,'cla',[],'left',[],'right',[]);
root_node.cla=trajectories;
root_node=ibc_tree(root_node,tra_acc_threhold,seg_acc_threhold,root_segs);
end



