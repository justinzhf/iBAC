function [clusters,cla_num]=run_IBC_rec(T,seg_acc,tra_acc,iter_times,s_map)

tree=IBC(T,seg_acc,tra_acc,s_map);
clusters=struct('clus_num',0,'clus',struct('id',0,'cla',[]));
clusters=Traverse(tree,clusters,[]);

for i=2:iter_times
    T=get_new_data(clusters);
    tree=IBC(T,seg_acc,tra_acc,s_map);
    clusters1=struct('clus_num',0,'clus',struct('id',0,'cla',[]));
    clusters1=Traverse(tree,clusters1,clusters);    
    clusters=clusters1;
end


[~,cla_w]=size(clusters.clus);
cla_num=zeros(cla_w,1);
for i=1:cla_w
    [cla_num(i,1),~]=size(clusters.clus(i).cla);
end
cla_num=sort(cla_num,'descend');

end