data {
    int<lower=0> N;                  // liczba obserwacji
    int<lower=0> K;                  // liczba predyktorów (cech)
    matrix[N, K] X;                  // macierz predyktorów
    vector[N] y;                     // wektor odpowiedzi (quality)
}

parameters {
  real alpha;
  vector[K] beta;
  real<lower=0> sigma;
}
model {
  alpha ~ normal(5.5, 1.0);     // Środek typowej jakości
  beta ~ normal(0, 0.5);        // Współczynniki trzymane blisko 0
  sigma ~ normal(0, 1) T[0,];   // Lepsze niż exponential, ograniczone do >0

  y ~ normal(X * beta + alpha, sigma);
}