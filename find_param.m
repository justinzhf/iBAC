result=cell(200,1);
for i=10:100
    row_cell=cell(10,1);
    i
    parfor j=1:10
        [clusters,cla_num]=run_IBC_rec(trk_data(1,1:200),i,50,60,trks_map);
        row_cell{j}=cla_num';
        j
    end
    result{i}=row_cell;
end