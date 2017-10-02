function S=m_segment(X,Y)
%�Թ켣���зֶ�
%input:  X:1XN��x����  Y:1XN��y����
%output: S 4X(N-1)�ľ�������:[x1,y1��x2,y2;x3,y3,x4,y4]
%(x1,y1)(x2,y2)�ǵ�һ��segment�������յ�
cord=[X;Y];
[x_h,x_w]=size(X);
[y_h,y_w]=size(Y)

Graph=zeros(x_w);
for i=1:x_w
    for j=1:x_w
        if i==j
            Graph(i,j)=0;
            Graph(j,i)=0;
        else
            Graph(i,j)=cal_LH(cord,[i,j]);
            Graph(j,i)=cal_LH(cord,[i,j]);
        end
    end
end


;
S=zeros(x_w-1,4);
for i=1:x_w-1
    S(i,:)=[cord(:,i)',cord(:,i+1)'];
end



