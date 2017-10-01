function clusters=run_IBC_rec(T,seg_acc,tra_acc,iter_times)

tree=IBC(T,seg_acc,tra_acc);
clusters=struct('clus_num',0,'clus',struct('id',0,'cla',[]));
clusters=Traverse(tree,clusters,[]);

for i=2:iter_times
    T=get_new_data(clusters);
    tree=IBC(T,seg_acc,tra_acc);
    clusters1=struct('clus_num',0,'clus',struct('id',0,'cla',[]));
    clusters1=Traverse(tree,clusters1,clusters);    
    clusters=clusters1;
end


end