function root_node=IBC_ASTS(T,seg_acc_threhold,tra_acc_threhold)
%T=loa
trajectories=T'; %注意，要转置一下
root_traj=trajectories(1);
root_segs=m_segment(root_traj.cord(1,:),root_traj.cord(2,:));

%todo
[rs_h,~]=size(root_segs);
chose_seg=unidrnd(rs_h);
root_segs(chose_seg,:)=[];
root_node=struct('chose_seg',chose_seg,'length',0,'cla',[],'left',[],'right',[]);
root_node.cla=trajectories;
root_node=ibc_tree(root_node,tra_acc_threhold,seg_acc_threhold,root_segs);
end



