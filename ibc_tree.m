function node=ibc_tree(node,tra_acc_threhold,seg_acc_threhold,root_segs,s_map)
%input: node=('chose_seg',node.chose_seg+1,'length',node.length+1,'acc',node.acc,'neg',[],'left',[],'right',[])
%       root_segs: ĳһ�켣����segment��ɵļ��ϣ�node�е�chose_seg�ǴӸ�root_segs������ѡȡ��
%output: ��nodeΪ���ڵ����
%node�ֶ�: chose_seg: ѡȡ�������������켣�ķֶμ������ķֶΣ����Ի���acc��neg
%        length: �ýڵ������е����
%        cla: ���ڵ�����ֵĹ켣�ļ���,Ϊstruct('id',[],'cord',[]) N x 1�ľ���N�ǹ켣������
%        idΨһ��ʶ�������ַ������ͣ�cord��2 x 1�ľ���[x1,x2,x3...;y1,y2,y3...]
%        left: ָ��neg_node,neg_node.cla�������£���node.chose_seg�ֶ����ڵĹ켣ΪT��neg_node.cla�Ǿ������λ��ֺ󣬺͹켣TΪ��ͬ�������й켣�ļ���
%        right: ָ��acc_node,acc_node.cla�������£���node.chose_seg�ֶ����ڵĹ켣ΪT��acc_node.cla�Ǿ������λ��ֺ󣬺͹켣TΪͬһ�������й켣�ļ���


trajs=node.cla;
[ts_h,~]=size(trajs);
[ss_h,~]=size(root_segs);

%����ʼ�ࣨ���ϴη���������ࣩ�Ѿ�Ϊ�գ����޷����з���
%��Ҫ��Ľ��ܹ켣Ϊ1��ĳ�������Ҫ�����ٽ��з���
%����ʼ�ࣨ���ϴη���������ֻࣩ�����ڻ����1���켣ʱ�����ٽ��з���
%��ĳһ�켣��segment�Ѿ�ȫ�������������ٽ��з���
%������������һ����������cla���϶�λ��ֶ����ٸı�ʱ�����ٽ��з��ࡣ��������δ����
if isempty(trajs) ||node.length>tra_acc_threhold ||ts_h<=1 || isempty(root_segs)
    return;
end


chose_seg=unidrnd(ss_h);
acc_node=struct('chose_seg',chose_seg,'length',node.length+1,'cla',[],'left',[],'right',[]);

%neg_node�ĳ��֣���ζ��һ���µ����ĵ�����chose_segӦ���µĹ켣��segments��ѡȡ��lengthҲӦ������
neg_node=struct('chose_seg',[],'length',0,'cla',[],'left',[],'right',[]);

for i=1:ts_h
    dis=min_st_distance(root_segs(acc_node.chose_seg,:),trajs(i),'th',s_map);
    if dis<seg_acc_threhold 
        acc_node.cla=[acc_node.cla;trajs(i)];
    else
        neg_node.cla=[neg_node.cla;trajs(i)];
    end
end

root_segs(acc_node.chose_seg,:)=[];

if isempty(acc_node.cla)~=1
    acc_node=ibc_tree(acc_node,tra_acc_threhold,seg_acc_threhold,root_segs,s_map);    
    node.right=acc_node;
else
    node.right=[];
end


if isempty(neg_node.cla)~=1
    [tra_h,~]=size(neg_node.cla);
    chose_traj=unidrnd(tra_h);
    new_segs=s_map(char(node.cla(chose_traj).id));
    [nss_h,~]=size(new_segs);
    
    chose_seg=unidrnd(nss_h);
    neg_node.chose_seg=chose_seg;
    neg_node=ibc_tree(neg_node,tra_acc_threhold,seg_acc_threhold,new_segs,s_map);
    node.left=neg_node;
else
    node.left=[];
 
end
end