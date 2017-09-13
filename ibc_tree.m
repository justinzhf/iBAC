function node=ibc_tree(node,tra_acc_threhold,seg_acc_threhold,root_segs)
%input: node=('chose_seg',node.chose_seg+1,'length',node.length+1,'acc',node.acc,'neg',[],'left',[],'right',[])
%       root_segs: ĳһ�켣����segment��ɵļ��ϣ�node�е�chose_seg�ǴӸ�root_segs������ѡȡ��
%output: ��nodeΪ���ڵ����
%struct: chose_seg: ѡȡ�������������켣�ķֶμ������ķֶΣ����Ի���acc��neg
%        length: �ýڵ������е����
%        cla: ���ڵ�����ֵĹ켣�ļ��� 
%        left: ָ��neg_node,neg_node.cla�������£���node.chose_seg�ֶ����ڵĹ켣ΪT��neg_node.cla�Ǿ������λ��ֺ󣬺͹켣TΪ��ͬ�������й켣�ļ���
%        right: ָ��acc_node,acc_node.cla�������£���node.chose_seg�ֶ����ڵĹ켣ΪT��acc_node.cla�Ǿ������λ��ֺ󣬺͹켣TΪͬһ�������й켣�ļ���


trajs=node.cla;
[ts_h,ts_w]=size(trajs);
[ss_h,~]=size(root_segs);

%����ʼ�ࣨ���ϴη���������ࣩ�Ѿ�Ϊ�գ����޷����з���
%��Ҫ��Ľ��ܹ켣Ϊ1��ĳ�������Ҫ�����ٽ��з���
%����ʼ�ࣨ���ϴη���������ֻࣩ�����ڻ����1���켣ʱ�����ٽ��з���
%��ĳһ�켣��segment�Ѿ�ȫ�������������ٽ��з���
%������������һ����������acc���϶�λ��ֶ����ٸı�ʱ�����ٽ��з��ࡣ��������δ����
if isempty(trajs) ||node.length>tra_acc_threhold ||ts_h<=1 || node.chose_seg>ss_h
    return;
end

acc_node=struct('chose_seg',node.chose_seg+1,'length',node.length+1,'cla',[],'left',[],'right',[]);

%neg_node�ĳ��֣���ζ��һ���µ����ĵ�����chose_segӦ���µĹ켣��segments��ѡȡ��lengthҲӦ������
neg_node=struct('chose_seg',1,'length',0,'cla',[],'left',[],'right',[]);

for i=1:2:ts_h-1
    dis=min_st_distance(root_segs(acc_node.chose_seg,:),trajs(i:i+1,2:ts_w));
    if dis<seg_acc_threhold 
        acc_node.cla=[acc_node.cla;trajs(i:i+1,:)];
    else
        neg_node.cla=[neg_node.cla;trajs(i:i+1,:)];
    end
end

acc_node=ibc_tree(acc_node,tra_acc_threhold,seg_acc_threhold,root_segs);

if isempty(neg_node.cla)~=1
    new_segs=m_segment(neg_node.cla(1,2:ts_w),neg_node.cla(2,2:ts_w));
    neg_node=ibc_tree(neg_node,tra_acc_threhold,seg_acc_threhold,new_segs);
    node.left=neg_node;
    node.right=acc_node;
else
    node.left=[];
    node.right=acc_node;
end
end