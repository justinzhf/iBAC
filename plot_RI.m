function plot_RI(times,T,seg_acc,tra_acc,iter_times,s_map)
 RIS=zeros(times,1);
 for i=1:times
     i
     [clus,cn,ri]=run_IBC_rec(T,seg_acc,tra_acc,iter_times,s_map);
     RIS(i,1)=ri;
 end
 X=1:times;
 X=X';

 plot(X,RIS);
axis([0 times+1 0 1.5]) 
 
end