function clusters3=run_IBC(T,seg_acc,tra_acc)
%input: T 1 x N struct array, struct('id','xxxx','clus_id',123,'cord',[])
    tree=IBC(T,seg_acc,tra_acc);
    clusters=struct('clus_num',0,'clus',struct('id',0,'cla',[]));
    clusters=Traverse(tree,clusters,[]);
    
    T1=get_new_data(clusters);
    tree1=IBC(T1,seg_acc,tra_acc);
    clusters1=struct('clus_num',0,'clus',struct('id',0,'cla',[]));
    clusters1=Traverse(tree1,clusters1,clusters);
    
    T2=get_new_data(clusters1);
    tree2=IBC(T2,seg_acc,tra_acc);
    clusters2=struct('clus_num',0,'clus',struct('id',0,'cla',[]));
    clusters2=Traverse(tree2,clusters2,clusters1);
    
    
    T3=get_new_data(clusters2);
    tree3=IBC(T3,seg_acc,tra_acc);
    clusters3=struct('clus_num',0,'clus',struct('id',0,'cla',[]));
    clusters3=Traverse(tree3,clusters3,clusters2);
    
    
    T4=get_new_data(clusters3);
    tree4=IBC(T4,seg_acc,tra_acc);
    clusters4=struct('clus_num',0,'clus',struct('id',0,'cla',[]));
    clusters4=Traverse(tree4,clusters4,clusters3);
    
    T5=get_new_data(clusters4);
    tree5=IBC(T5,seg_acc,tra_acc);
    clusters5=struct('clus_num',0,'clus',struct('id',0,'cla',[]));
    clusters5=Traverse(tree5,clusters5,clusters4);
    
    
    T6=get_new_data(clusters5);
    tree6=IBC(T6,seg_acc,tra_acc);
    clusters6=struct('clus_num',0,'clus',struct('id',0,'cla',[]));
    clusters6=Traverse(tree6,clusters6,clusters5);
    
    T7=get_new_data(clusters6);
    tree7=IBC(T7,seg_acc,tra_acc);
    clusters7=struct('clus_num',0,'clus',struct('id',0,'cla',[]));
    clusters7=Traverse(tree7,clusters7,clusters6);
end