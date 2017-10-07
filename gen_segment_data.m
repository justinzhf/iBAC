function s_data=gen_segment_data(data)
    [~,traj_w]=size(data);
    s_data=[];
    for i=1:traj_w
        S=m_segment(data(i).cord(1,:),data(i).cord(2,:));
        segment=struct('id',[],'segs',[]);
        segment.id=data(i).id;
        segment.segs=S;
        s_data=[s_data;segment];
    end
end