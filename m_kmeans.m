function clusters=m_kmeans(t_data,cla_num,s_map)
iter_times=500;
clusters=struct('clus_num',0,'clus',struct('id',0,'cla',[]));
[~,t_w]=size(t_data);

ts=zeros(1,cla_num);

for i=1:cla_num
    clusters.clus(i).id=i;
    clusters.clus(i).cla=t_data(i);
    
    choose_t=unidrnd(t_w);
    is_exist=find(ts==choose_t,1);
    while ~isempty(is_exist)
        choose_t=unidrnd(1,t_w);
    end
    ts(1,i)=choose_t;
    u(1,i)=t_data(choose_t);
end

for i=1:iter_times
    i
    for j=1:t_w
        min_index=1;
        min_dis=inf;
        for k=1:cla_num
            dis=fre_distance(t_data(1,j),u(1,k));
            if dis<min_dis
                min_dis=dis;
                min_index=k;
            end
        end
        clusters.clus(min_index).cla=[clusters.clus(min_index).cla;t_data(1,j)];
    end
    if i==iter_times
        break;
    end
    for j=1:cla_num
        [cla_h,~]=size(clusters.clus(j).cla);
        if ~isempty(clusters.clus(j).cla)
            u(1,j)=struct('id',0,'clus_id',0,'cord',gen_rep_traj(0.5,cla_h/500,clusters.clus(j).cla,s_map));
        end
        clusters.clus(j).cla=[];
    end
end
end

