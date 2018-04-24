function H = Entropy(X)
[n m] = size(X);
H = zeros(1,m);

for Column = 1:m,
    Alp = unique(X(:,Column));
    Frequency = zeros(size(Alp));
    for sy = 1:length(Alp)
        Frequency(sy) = sum(X(:,Column) == Alp(sy));
    end
    P = Frequency / sum(Frequency);
    H(Column) = -sum(P .* log2(P));
end

