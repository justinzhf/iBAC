function m_plot_rep_traj(data,clusters,acc_clus_threhold,s_map)
    m_plot(data,'g');
    hold on;
    [~,clus_w]=size(clusters.clus);
    for i=1:clus_w
        cla=clusters.clus(i).cla;
        [traj_h,~]=size(cla);
        if traj_h>=acc_clus_threhold
            rep_traj=gen_rep_traj(1,7,cla,s_map);
            if isempty(rep_traj)~=1
                plot(rep_traj(1,:),rep_traj(2,:),'r');
            end
            
        end
    end
end