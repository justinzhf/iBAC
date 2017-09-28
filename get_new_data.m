function T_data=get_new_data(clusters)
    [~,clus_w]=size(clusters.clus);

    for i=1:clus_w
        [~,traj_w]=size(clusters.clus(i));
        chose_traj=unidrnd(traj_w);
        T_data(i)=clusters.clus(i).cla(chose_traj);
    end
   
end