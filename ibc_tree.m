function node=ibc_tree(node,tra_acc_threhold,seg_acc_threhold,root_segs)
%input: node=('chose_seg',node.chose_seg+1,'length',node.length+1,'acc',node.acc,'neg',[],'left',[],'right',[])
%       root_segs: 某一轨迹所有segment组成的集合，node中的chose_seg是从该root_segs集合中选取的
%output: 以node为根节点的树
%struct: chose_seg: 选取的用来和其他轨迹的分段计算距离的分段，用以划分acc和neg
%        length: 该节点在树中的深度
%        acc: 经过本次划分后，被划分为和chose_seg分段所在的轨迹T为同一类别的所有轨迹的集合
%        neg: 经过本次划分后，被划分为和chose_seg分段所在的轨迹T为不同类别的所有轨迹的集合
%        left: 指向对neg集合再次进行划分的节点
%        right: 指向对acc集合再次进行划分的节点


trajs=node.acc;
[ts_h,ts_w]=size(trajs);
[ss_h,~]=size(root_segs);

%当初始类（或上次分类产生的类）已经为空，则无法进行分类
%当要求的接受轨迹为1类的长度满足要求，则不再进行分类
%当初始类（或上次分类产生的类）只有少于或等于1条轨迹时，则不再进行分类
%当某一轨迹的segment已经全部被检测过，则不再进行分类
%还可以再增加一个条件：当acc集合多次划分都不再改变时，则不再进行分类。该条件还未加上
if isempty(trajs) ||node.length>tra_acc_threhold ||ts_h<=1 || node.chose_seg>ss_h
    return;
end
if isempty(node.acc)
    acc_ids=[];
else
    acc_ids=node.acc(:,1);
end

for i=1:2:ts_h-1
    dis=min_st_distance(root_segs(node.chose_seg,:),trajs(i:i+1,2:ts_w));
    traj=trajs(i:i+1,:);
    if dis<seg_acc_threhold 
        if ismember(traj(1,1),acc_ids)~=1
            node.acc=[node.acc;trajs(i:i+1,:)];
        end
    else
        if ismember(traj(1,1),acc_ids)
            node.acc(i:i+1,:)=zeros(2,ts_w);
        end
        node.neg=[node.neg;trajs(i:i+1,:)];
    end
end

%经过本次分类后，如果愿node.acc集合中有轨迹被分到了node.neg中，需要将该轨迹从node.acc中删除掉
[acc_h,~]=size(node.acc);
acc_tmp=[];
for i=1:acc_h
    if node.acc(i,1)~=0
        acc_tmp=[acc_tmp;node.acc(i,:)];
    end
end
node.acc=acc_tmp;


acc_node=struct('chose_seg',node.chose_seg+1,'length',node.length+1,'acc',node.acc,'neg',[],'left',[],'right',[]);
acc_node=ibc_tree(acc_node,tra_acc_threhold,seg_acc_threhold,root_segs);

if isempty(node.neg)~=1
    new_segs=m_segment(node.neg(1,2:ts_w),node.neg(2,2:ts_w));
    neg_node=struct('chose_seg',1,'length',0,'acc',node.neg,'neg',[],'left',[],'right',[]);
    neg_node=ibc_tree(neg_node,tra_acc_threhold,seg_acc_threhold,new_segs);
    node.left=neg_node;
    node.right=acc_node;
else
    node.left=[];
    node.right=acc_node;
end
end