%P = [0.1 0.3 0.4 0.2];
X = [1 7 5 15];
X_sum = sum(X);

X_prob = [];

for i=1:length(X)
  X_prob = [X_prob,X(i)/X_sum];
endfor

%f = X(find(rand<cumsum(P),1,'first'))
