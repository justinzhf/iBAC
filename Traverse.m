function clusters=Traverse(root_node,clusters,pre_clusters)
%�������
%input: root_node ���ڵ㣬��ʼ��clusters=struct('clus_num',0,'clus',struct('id',0,'cla',[]));
%output: clusters�� clusters.num��������
%clusters.cla���з��࣬clusters.cla(i)Ϊstruct('id',clusters.clus_num+1,'cla',root_node.cla)����һ������
if isempty(root_node.right)~=1
    clusters=Traverse(root_node.right,clusters,pre_clusters);
end
cla=[];

if isempty(root_node.left)~=1
    clusters=Traverse(root_node.left,clusters,pre_clusters);
end

if isempty(root_node.left)&&isempty(root_node.right)
    clusters.clus_num=clusters.clus_num+1;
    
    [tra_h,~]=size(root_node.cla);
    if isempty(pre_clusters)
        for i=1:tra_h
            root_node.cla(i).clus_id=clusters.clus_num;
        end
        cla=root_node.cla;
    else
        for i=1:tra_h
            pre_clus=pre_clusters.clus(root_node.cla(i).clus_id).cla;
            cla=[cla;pre_clus];
        end
        [total_traj_h,~]=size(cla);
        for i=1:total_traj_h
            cla(i).clus_id=clusters.clus_num;
        end
    end
    
    cluster=struct('id',clusters.clus_num,'cla',cla);

    clusters.clus(clusters.clus_num)=cluster;
end
end