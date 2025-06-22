data {
    int<lower=0> N;                  // number of observations
    int<lower=0> K;                  // number of predictors (features)
    matrix[N, K] X;                  // predictor matrix
    vector[N] y;                     // response vector (quality)
}

parameters {
    real alpha;                      // intercept
    vector[K] beta;                  // regression coefficients
    real<lower=0> sigma;             // standard deviation of the error
}

model {
    // Priors
    alpha ~ normal(0, 1);            // intercept
    beta ~ normal(0, 1);             // regression coefficients
    sigma ~ exponential(1);          // sigma > 0

    // Regression model
    y ~ normal(X * beta + alpha, sigma);
}