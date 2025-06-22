data {
    int<lower=0> N;                  // num of observations
    int<lower=0> K;                  // num of predictors (features)
    matrix[N, K] X;                  // matrix of predictors
    vector[N] y;                     // vector of response (matrix)
}

parameters {
  real alpha;
  vector[K] beta;
  real<lower=0> sigma;
}
model {
  alpha ~ normal(5.5, 1.0);     //
  beta ~ normal(0, 0.5);        // 
  sigma ~ normal(0, 1) T[0,];   //

  y ~ normal(X * beta + alpha, sigma);
}