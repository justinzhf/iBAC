function m_plot(data)
%data=load('./test data/ASTS.mat')
[d_h,d_s]=size(data);
hold on;
for i=1:d_s
    plot(data(i).cord(1,:),-data(i).cord(2,:),'g');
end

end