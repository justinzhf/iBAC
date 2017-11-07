function [RI]=rand_index(clusters)
[~,clus_w]=size(clusters.clus);
a=0;
b=0;
c=0;
d=0;
m=0;
data=[];
for i=1:clus_w
    cla=clusters.clus(i).cla;
    [cla_h,~]=size(cla);
    if cla_h>=5
        data=[data;cla];
    end
end
[data_h,~]=size(data);
m=data_h;
 for j=1:data_h
    id1=str2double(data(j,1).id{1}(1,1));
    clus_id1=data(j,1).clus_id;
    for k=j+1:data_h
        id2=str2double(data(k,1).id{1}(1,1));
        clus_id2=data(k,1).clus_id;
        if id1==id2&&clus_id1==clus_id2
            a=a+1;
        end
        if id1==id2&&clus_id1~=clus_id2
            b=b+1;
        end
        if id1~=id2&&clus_id1==clus_id2
            c=c+1;
        end
        if id1~=id2&&clus_id1~=clus_id2
            d=d+1;
        end
    end
 end
 RI=2*(a+d)/(m*(m-1));
end