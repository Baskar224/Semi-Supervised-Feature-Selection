function[lab]= switching(y_bar) 
   %finding the  number of postives and negatives and unlabelled examples
     p=length(find(y_bar==1));
     n=length(find(y_bar==0));
     m=length(find(y_bar==-1));
     
    %user class probability p(y==1)
      user_class_pro=0.24;
      
     % finding the thresold 
      a=sqrt(p*(p+m));
      b=sqrt(n*(n+m));
      fi=a/(a+b);
      
     %selecting the appropriate surrogate
      if user_class_pro<fi
       y= find(y_bar==-1);
       y_bar(y,1)=0;
      else
       y= find(y_bar==-1);
       y_bar(y,1)=1; 
      end
      lab=y_bar;
 end 