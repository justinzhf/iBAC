function ibc(T,seg_acc_threhold,tra_acc_threhold)
%T.t11=[x1,x2,x3;y1,y2,y3]
trajectories=[T.t11;T.t12;T.t13;T.t21;T.t22;T.t23;T.t31;T.t32;T.t33];
[ts_h,ts_w]=size(trajectories);
root_traj=trajectories(1,:);
root_segs=m_segment(root_traj);
[rs_h,rs_w]=size(root_segs);

%todo



