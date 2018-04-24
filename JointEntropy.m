function H = JointEntropy(X)
     X = sortrows(X);
    DeltaRow = (X(2:end,:) ~= X(1:end-1,:));
    Delta = [1; any(DeltaRow')'];
    VectorX = cumsum(Delta);
    H = Entropy(VectorX);
