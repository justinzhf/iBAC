function root_node=IBC(T,seg_acc_threhold,tra_acc_threhold)
%T=load('trajectory.mat');

%
% T.t11=[11,T.X;11,T.Y1_1];
% T.t12=[12,T.X;12,T.Y1_2];
% T.t13=[13,T.X;13,T.Y1_3];
% T.t14=[14,T.X;14,T.Y1_4];
% T.t15=[15,T.X;15,T.Y1_5];
% 
% T.t21=[21,T.X;21,T.Y2_1];
% T.t22=[22,T.X;22,T.Y2_2];
% T.t23=[23,T.X;23,T.Y2_3];
% T.t24=[24,T.X;24,T.Y2_4];
% T.t25=[25,T.X;25,T.Y2_5];
% 
% 
% T.t31=[31,T.X;31,T.Y3_1];
% T.t32=[32,T.X;32,T.Y3_2];
% T.t33=[33,T.X;33,T.Y3_3];
% T.t34=[34,T.X;34,T.Y3_4];
% T.t35=[35,T.X;35,T.Y3_5];
%
T_data(1).id='11';
T_data(1).cord=[T.X;T.Y1_1];
T_data(2).id='12';
T_data(2).cord=[T.X;T.Y1_2];
T_data(3).id='13';
T_data(3).cord=[T.X;T.Y1_3];
T_data(4).id='14';
T_data(4).cord=[T.X;T.Y1_4];
T_data(5).id='15';
T_data(5).cord=[T.X;T.Y1_5];


T_data(6).id='21';
T_data(6).cord=[T.X;T.Y2_1];
T_data(7).id='22';
T_data(7).cord=[T.X;T.Y2_2];
T_data(8).id='23';
T_data(8).cord=[T.X;T.Y2_3];
T_data(9).id='24';
T_data(9).cord=[T.X;T.Y2_4];
T_data(10).id='25';
T_data(10).cord=[T.X;T.Y2_5];

T_data(11).id='31';
T_data(11).cord=[T.X;T.Y3_1];
T_data(12).id='32';
T_data(12).cord=[T.X;T.Y3_2];
T_data(13).id='33';
T_data(13).cord=[T.X;T.Y3_3];
T_data(14).id='34';
T_data(14).cord=[T.X;T.Y3_4];
T_data(15).id='35';
T_data(15).cord=[T.X;T.Y3_5];


trajectories=T_data'; 
root_traj=trajectories(1);
root_segs=m_segment(root_traj.cord(1,:),root_traj.cord(2,:));

%todo
root_node=struct('chose_seg',1,'length',0,'cla',[],'left',[],'right',[]);
root_node.cla=trajectories;
root_node=ibc_tree(root_node,tra_acc_threhold,seg_acc_threhold,root_segs);
end



