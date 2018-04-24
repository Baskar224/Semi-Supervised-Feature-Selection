%initialization
clear; clear all;clc;
%================loading the dataset for 20% of unlabelled examples=====================
  %loading the dataset
  [X_train,Y_train,rand_ind]=featurelab('sattrn.txt',0.2);
  
   %loading testing data
    land_test=dlmread('sattst.txt');
    [m_test,n_test]= size(land_test);
    
   %separating into features and labels
     X_test= land_test(:,1:n_test-1);
     Y_test= land_test(:,n_test);
     
   % choosing labels based on a condition
  pos=find(Y_train==1);
  pos1=find(Y_train==2);
  pos2=find(Y_train==3);
  un=find(Y_train==0);
  y_bar=zeros(size(Y_train));
  y_bar(pos,1)=1;
  y_bar(pos1,1)=1;
  y_bar(pos2,1)=1;
  y_bar(un,1)=-1;
  
  
 %calculating switching thresold
   labe=switching(y_bar);
   
   Y_ind=find(Y_train==0);
   Y_train(Y_ind,:)=6;
   
   %finding accuracy without feature selection of semi Supervised data
    md=fitcknn(X_train,Y_train);
    [lab,sco,co]=predict(md,X_test);
    ac=mean(double(lab==Y_test))*100;
    fprintf('Without using any algorithm\n');
    fprintf('The testing accuracy:%f\n',ac);
    fprintf('The program has been paused. Press enter to continue \n');
    pause;
   
   %using MIM algorithm
    k=18;
    feature=X_train;
    [row,col]=size(feature);
    S=zeros(row,k);
    for i=1:col
     I(i,:)=MutualInformation(feature(:,i),labe);
     I_ind(i,:)=i;
     In=[I_ind I];
    end
    sor= sortrows(In,-2);
    sele_colum= int32(sor(1:k,1));
    S=feature(:,sele_colum);
    
   %taking only the selected features from testing data
     X_sel=X_test(:,sele_colum);
     
    % finding the accuracy for different values of k 
     md1=fitcknn(S,Y_train);
     [la,sc,c]=predict(md1,X_sel);
     acc(k-17)=mean(double(la==Y_test))*100;
    %end
    fprintf('\nMIM algorithm\n');
    fprintf('The testing accuracy using MIM:%f\n',acc);
    
   
     fprintf('The program has been paused. Press enter to continue \n');
     pause; 
     
    %JMI algorithm
      k1=18;
      [S_JMI,ind_val]=JMI(feature,labe,k1);
      
      %taking only the selected features from testing data
        X_sel_JMI=X_test(:,ind_val);
      ghhg
     % finding the accuracy for different values of k 
       md2=fitcknn(S_JMI,Y_train);
       [l,s,cost]=predict(md2,X_sel_JMI);
       accu(k1-17)=mean(double(l==Y_test))*100;
    end
    fprintf('\nJMI algorithm\n');
    fprintf('The testing accuracy using JMI:%f\n',accu);
    
   fprintf('The program has been paused. Press enter to continue \n');
   pause;
   
    %plotting the data
    K=[18:35];
    plotda(K,acc,accu);
    fprintf('The program has been paused. Press enter to continue \n');
    pause;
    
    