function root_node=IBC(T,seg_acc_threhold,tra_acc_threhold)
%T.t11=[x1,x2,x3;y1,y2,y3]
%T=load('trajectory.mat');
T.t11=[11,T.X;11,T.Y1_1];
T.t12=[12,T.X;12,T.Y1_2];
T.t13=[13,T.X;13,T.Y1_3];
T.t14=[14,T.X;14,T.Y1_4];
T.t15=[15,T.X;15,T.Y1_5];

T.t21=[21,T.X;21,T.Y2_1];
T.t22=[22,T.X;22,T.Y2_2];
T.t23=[23,T.X;23,T.Y2_3];
T.t24=[24,T.X;24,T.Y2_4];
T.t25=[25,T.X;25,T.Y2_5];


T.t31=[31,T.X;31,T.Y3_1];
T.t32=[32,T.X;32,T.Y3_2];
T.t33=[33,T.X;33,T.Y3_3];
T.t34=[34,T.X;34,T.Y3_4];
T.t35=[35,T.X;35,T.Y3_5];

trajectories=[T.t11;T.t12;T.t13;T.t14;T.t15;
    T.t21;T.t22;T.t23;T.t24;T.t25;
    T.t31;T.t32;T.t33;T.t34;T.t35];
[~,t_w]=size(trajectories);
root_traj=trajectories(1:2,2:t_w);
root_segs=m_segment(root_traj(1,:),root_traj(2,:));

%todo
root_node=struct('chose_seg',1,'length',0,'acc',[],'neg',[],'left',[],'right',[]);
root_node.acc=trajectories;
root_node=ibc_tree(root_node,tra_acc_threhold,seg_acc_threhold,root_segs);
end



