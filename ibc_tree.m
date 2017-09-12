function node=ibc_tree(node,trajs,tra_acc_threhold,seg_acc_threhold,root_segs)

[ts_h,ts_w]=size(trajs);
if isempty(trajs) ||node.length>tra_acc_threhold
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


[acc_h,~]=size(node.acc);
acc_tmp=[];
for i=1:acc_h
    if node.acc(i,1)~=0
        acc_tmp=[acc_tmp;node.acc(i,:)];
    end
end
node.acc=acc_tmp;


acc_node=struct('chose_seg',node.chose_seg+1,'length',node.length+1,'acc',node.acc,'neg',[],'left',[],'right',[]);
acc_node=ibc_tree(acc_node,acc_node.acc,tra_acc_threhold,seg_acc_threhold,root_segs);

if isempty(node.neg)~=1
    new_segs=m_segment(node.neg(1,2:ts_w),node.neg(2,2:ts_w));
    neg_node=struct('chose_seg',1,'length',0,'acc',node.neg,'neg',[],'left',[],'right',[]);
    neg_node=ibc_tree(neg_node,neg_node.acc,tra_acc_threhold,seg_acc_threhold,new_segs);
    node.left=neg_node;
    node.right=acc_node;
else
    node.left=[];
    node.right=acc_node;
end
end