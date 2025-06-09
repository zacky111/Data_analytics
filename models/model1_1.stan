data {
    int<lower=0> N;                  // liczba obserwacji
    int<lower=0> K;                  // liczba predyktorów (cech)
    matrix[N, K] X;                  // macierz predyktorów
    vector[N] y;                     // wektor odpowiedzi (quality)
}

parameters {
    real alpha;                      // wyraz wolny (intercept)
    vector[K] beta;                  // współczynniki regresji
    real<lower=0> sigma;             // odchylenie standardowe błędu
}

model {
    // Priory
    alpha ~ normal(0, 1);            // wyraz wolny
    beta ~ normal(0, 1);             // współczynniki regresji
    sigma ~ exponential(1);          // sigma > 0

    // Model regresji
    y ~ normal(X * beta + alpha, sigma);
}
