data {
  int<lower=0> N;
  int<lower=0> K;
  matrix[N, K] X;
  vector[N] y;
}

parameters {
  real alpha;
  vector[K] beta;
  real<lower=0> sigma;
}

model {
  alpha ~ normal(5.5, 1.5);
  beta ~ normal(0, 1);
  sigma ~ exponential(0.5);

  y ~ normal(X * beta + alpha, sigma);
}
