function [S,ind]=JMI(feature,labe,k)    
    fea=feature;
    [row,col]=size(feature);
    S=zeros(row,k);
    ind=zeros(k,1);
    for i=1:col
     I(i,:)=MutualInformation(feature(:,i),labe);
    end
    [w,iw]=max(I);
    S=feature(:,iw);
    feature(:,iw)=[];
    ind(1)=iw;
    m=size(feature,2);
    n=size(S,2);
    
    while (n~=k-1)
       m=size(feature,2);
       n=size(S,2);
       mi_val=zeros(m,1);
      %for i=1:m
        %for j=1:n
         Joi_mi=MutualInformation(S,labe)+ConditionalEntropy(feature,labe)-ConditionalEntropy(feature,[labe S]);
        %end 
         %mi_val(i,1)=min(Joi_mi);
       %end 
       if n==1  
       [ma_val,val_ind]=max(Joi_mi);
       else
       [ma_val,val_ind]=max(min(Joi_mi'));
       end
       S=[S feature(:,val_ind)];
       ind_col=find(ismember(fea',feature(:,val_ind)','rows'),1);
       ind(size(S,2))=ind_col;
       feature(:,val_ind)=[];
       
    end
 end     