function H = ConditionalEntropy(Y,X)

H = Entropy(Y) - MutualInformation(X,Y);
end