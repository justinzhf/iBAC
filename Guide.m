%% ʹ�÷���˵��
% 

%% IBCʹ��˵��
% Description of IBC
T=load('./test data/struct_traj.mat');
tree=IBC(T.T_data,25,5);
clusters=struct('clus_num',0,'clus',struct('id',0,'cla',[]));
clusters=Traverse(tree,clusters,[]);
%% Section 2 Title
% Description of second code block

