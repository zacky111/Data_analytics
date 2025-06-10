data {
  int<lower=0> N;             // liczba obserwacji
  int<lower=0> K;             // liczba predyktorów (K = 3)
  matrix[N, K] X;             // macierz cech
  vector[N] y;                // jakość (target)
}

parameters {
  real alpha;                 // wyraz wolny
  vector[K] beta;             // współczynniki regresji
  real<lower=0> sigma;        // odchylenie standardowe błędu
}

model {
  // Priory
  alpha ~ normal(5.5, 1.0);
  beta ~ normal(0, 1.0);
  sigma ~ exponential(0.5);

  // Model
  y ~ normal(X * beta + alpha, sigma);
}

generated quantities {
  vector[N] log_lik;

  for (n in 1:N) {
    log_lik[n] = normal_lpdf(y[n] | dot_product(X[n], beta) + alpha, sigma);
  }
}
