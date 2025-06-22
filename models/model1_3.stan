data {
  int<lower=0> N;             // number of observations
  int<lower=0> K;             // number of predictors (features)
  matrix[N, K] X;             // predictor matrix
  vector[N] y;                // response vector (quality)
}

parameters {
  real alpha;
  vector[K] beta;
  real<lower=0> sigma;
}

model {
  // Priors (more flexible than in 1_2)
  alpha ~ normal(5.5, 1.5);
  beta ~ normal(0, 1);
  sigma ~ exponential(0.5);

  // Model
  y ~ normal(X * beta + alpha, sigma);
}