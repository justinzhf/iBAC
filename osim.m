function o_value=osim(clusters,s_map)
[~,clus_w]=size(clusters.clus);
total_elem=0;
o_value=0;
for i=1:clus_w
    [cla_h,~]=size(clusters.clus(i).cla);
    total_elem=total_elem+cla_h;
end
for i=1:clus_w
    [cla_h,~]=size(clusters.clus(i).cla);
    oi=osim_i(clusters.clus(i),s_map);
    o_value=o_value+oi*cla_h/total_elem;
end
end

function oi=osim_i(clus,s_map)
[cla_h,~]=size(clus.cla);
oi=0;
u=struct('id',0,'clus_id',0,'cord',gen_rep_traj(0.5,cla_h/50,clus.cla,s_map));
for i=1:cla_h
    oi=oi+fre_distance(u,clus.cla(i,1));
end
oi=oi/cla_h;
end