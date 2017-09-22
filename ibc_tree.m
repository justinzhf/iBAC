function node=ibc_tree(node,tra_acc_threhold,seg_acc_threhold,root_segs)
%input: node=('chose_seg',node.chose_seg+1,'length',node.length+1,'acc',node.acc,'neg',[],'left',[],'right',[])
%       root_segs: 某一轨迹所有segment组成的集合，node中的chose_seg是从该root_segs集合中选取的
%output: 以node为根节点的树
%node字段: chose_seg: 选取的用来和其他轨迹的分段计算距离的分段，用以划分acc和neg
%        length: 该节点在树中的深度
%        cla: 本节点待划分的轨迹的集合,为struct('id',[],'cord',[]) N x 1的矩阵，N是轨迹数量，
%        id唯一标识符，是字符串类型，cord是2 x 1的矩阵，[x1,x2,x3...;y1,y2,y3...]
%        left: 指向neg_node,neg_node.cla定义如下：设node.chose_seg分段所在的轨迹为T，neg_node.cla是经过本次划分后，和轨迹T为不同类别的所有轨迹的集合
%        right: 指向acc_node,acc_node.cla定义如下：设node.chose_seg分段所在的轨迹为T，acc_node.cla是经过本次划分后，和轨迹T为同一类别的所有轨迹的集合


trajs=node.cla;
[ts_h,~]=size(trajs);
[ss_h,~]=size(root_segs);

%当初始类（或上次分类产生的类）已经为空，则无法进行分类
%当要求的接受轨迹为1类的长度满足要求，则不再进行分类
%当初始类（或上次分类产生的类）只有少于或等于1条轨迹时，则不再进行分类
%当某一轨迹的segment已经全部被检测过，则不再进行分类
%还可以再增加一个条件：当cla集合多次划分都不再改变时，则不再进行分类。该条件还未加上
if isempty(trajs) ||node.length>tra_acc_threhold ||ts_h<=1 || node.chose_seg>ss_h
    return;
end

acc_node=struct('chose_seg',node.chose_seg+1,'length',node.length+1,'cla',[],'left',[],'right',[]);

%neg_node的出现，意味着一个新的类别的诞生，chose_seg应从新的轨迹的segments中选取，length也应当重置
neg_node=struct('chose_seg',1,'length',0,'cla',[],'left',[],'right',[]);

for i=1:ts_h
    dis=min_st_distance(root_segs(acc_node.chose_seg,:),trajs(i).cord);
    if dis<seg_acc_threhold 
        acc_node.cla=[acc_node.cla;trajs(i)];
    else
        neg_node.cla=[neg_node.cla;trajs(i)];
    end
end

acc_node=ibc_tree(acc_node,tra_acc_threhold,seg_acc_threhold,root_segs);

if isempty(neg_node.cla)~=1
    new_segs=m_segment(neg_node.cla(1).cord(1,:),neg_node.cla(1).cord(2,:));
    neg_node=ibc_tree(neg_node,tra_acc_threhold,seg_acc_threhold,new_segs);
    node.left=neg_node;
    node.right=acc_node;
else
    node.left=[];
    node.right=acc_node;
end
end