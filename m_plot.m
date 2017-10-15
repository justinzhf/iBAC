function m_plot(data,color,row,col,index)
%data=load('./test data/ASTS.mat')
[~,d_s]=size(data);
subplot(row,col,index);
hold on;

for i=1:d_s
    plot(data(i).cord(1,:),data(i).cord(2,:),color);
end

end