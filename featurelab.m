function [X_train,Y_train,ran_train_ind]= featurelab(filename1,percent)
   %loading the training dataset
    land_train=dlmread(filename1);
    [m_train,n_train]= size(land_train);
    
   %separating into features and labels
     X_train= land_train(:,1:n_train-1);
     Y_train= land_train(:,n_train);
     
   %randomly changing into some unlabelled examples
      ran_train_ind= randperm(m_train,ceil(length(Y_train)*percent));
      ran_train_ind=ran_train_ind';
      Y_train(ran_train_ind,1)=0;
 end