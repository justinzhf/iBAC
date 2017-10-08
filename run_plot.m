function clusters=run_plot(T,seg_acc,tra_acc,iter_times,s_map)
 clusters=run_IBC_rec(T,seg_acc,tra_acc,iter_times,s_map);
 
 m_plot_rep_traj(T,clusters,15,s_map);
 view(90,90)
end