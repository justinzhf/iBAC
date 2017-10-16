function m_plot_all_segs(seg_data,row,col,index)
[s_h,~]=size(seg_data);
subplot(row,col,index);
for i=1:s_h
    m_plot_segment(seg_data(i,1).segs);
end
end