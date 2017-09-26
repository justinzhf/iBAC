function clusters=Traverse(root_node,clusters)
%后序遍历
%input: root_node 根节点，初始化clusters=struct('clus_num',0,'clus',struct('id',0,'cla',[]));
%output: clusters， clusters.num类别个数，
%clusters.cla所有分类，clusters.cla(i)为struct('id',clusters.clus_num+1,'cla',root_node.cla)，是一个分类
if isempty(root_node.right)~=1
    clusters=Traverse(root_node.right,clusters);
end

if isempty(root_node.left)~=1
    clusters=Traverse(root_node.left,clusters);
end

if isempty(root_node.left)&&isempty(root_node.right)
    clusters.clus_num=clusters.clus_num+1;
    cluster=struct('id',clusters.clus_num,'cla',root_node.cla);
    clusters.clus(clusters.clus_num)=cluster;
end
end