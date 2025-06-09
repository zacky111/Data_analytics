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
  // Priory (bardziej elastyczne niż w model1_2)
  alpha ~ normal(5.5, 1.5);
  beta ~ normal(0, 1);
  sigma ~ exponential(0.5);

  // Model
  y ~ normal(X * beta + alpha, sigma);
}