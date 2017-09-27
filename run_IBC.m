function clusters=run_IBC(T,seg_acc,tra_acc)
    tree=IBC(T,seg_acc,tra_acc);
    clusters=struct('clus_num',0,'clus',struct('id',0,'cla',[]));
    clusters=Traverse(tree,clusters);
end