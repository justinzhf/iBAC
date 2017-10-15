function diff=find_diff(tmp)
[h,~]=size(tmp);
s=zeros(473,1);
for i=1:h
    s(tmp(i,1))=tmp(i,1);
end

count=0;
for i=1:473
    if s(i,1)==0
       count=count+1;
       diff(count,1)=i;
    end
end


end