%% 使用方法说明
% 

%% IBC使用说明
% Description of IBC
%T=load('./test data/trajectory.mat');
tree=IBC(T,5,5);
clusters=struct('clus_num',0,'clus',struct('id',0,'cla',[]));
clusters=Traverse(tree,clusters);
%% Section 2 Title
% Description of second code block

