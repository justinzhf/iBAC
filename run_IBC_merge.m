function new_clusters=run_IBC_merge(T,seg_acc,tra_acc)
    new_tree=ibc_merge(T,seg_acc,tra_acc);
    new_clusters=struct('clus_num',0,'clus',struct('id',0,'cla',[]));
    new_clusters=Traverse(new_tree,new_clusters,T);
end