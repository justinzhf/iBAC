function clusters=m_kmeans(t_data,cla_num,s_map)
iter_times=500;
clusters=struct('clus_num',0,'clus',struct('id',0,'cla',[]));
[~,t_w]=size(t_data);
for i=1:cla_num
    clusters.clus(i).id=i;
    clusters.clus(i).cla=t_data(i);
    u(1,i)=t_data(i);
end
for i=1:iter_times
    for j=cla_num+1:t_w
        min_index=1;
        min_dis=0;
        for k=1:cla_num
            dis=fre_distance(t_data(1,k),u(1,k));
            if dis<min_dis
                min_dis=dis;
                min_index=k;
            end
        end
        clusters.clus(min_index).cla=[clusters.clus(min_index).cla;t_data(1,j)];
    end
    for j=1:cla_num
        [cla_h,~]=size(clusters.clus(i).cla);
        u(1,j)=struct('id',0,'clus_id',0,'cord',gen_rep_traj(0.5,cla_h/500,clusters.clus(i).cla,s_map));
    end
end
end

function u=cal_u(clus)
[cla_h,~]=size(clus.cla);
for i=1:cla_h
    
end
end

