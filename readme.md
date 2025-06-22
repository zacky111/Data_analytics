# Red Wine Quality Prediction

This project is a Bayesian analysis of the **Vinho Verde red wine dataset**, aiming to predict wine quality based on its physicochemical properties. It is built using Python and Stan (via `cmdstanpy`), and structured for reproducible analysis inside a Dockerized environment.

The notebook walks through:
- problem formulation and causal structure (DAG),
- preprocessing and feature selection,
- model specification in Stan (multiple versions),
- prior/posterior predictive checks,
- model comparison using WAIC and PSIS-LOO.

---

## Project Structure

```
projekt/
├── main.ipynb                 # Main notebook with full analysis
├── data/
│   └── winequality-red.csv    # Dataset (required)
├── models/
│   ├── model1_1.stan
│   ├── model1_2.stan
│   └── ...                    # All Stan models used
├── requirements.txt           # Python dependencies
└── README.md                  # You're here
```

---

## Running inside cmdstanpy Docker container

To run the notebook inside a container with `cmdstanpy` installed:

1. **Clone this repository** inside the container’s working directory (`/projekt`):

```bash
mkdir -p /projekt
cd /projekt
git clone <your-repo-url> .
```

2. **Make sure the dataset is in place**:
Place the CSV file here:  
`/projekt/data/winequality-red.csv`

> If not present, you can download it from:  
> [https://www.kaggle.com/datasets/uciml/red-wine-quality-cortez-et-al-2009](https://www.kaggle.com/datasets/uciml/red-wine-quality-cortez-et-al-2009)

3. **Install Python dependencies** using the `requirements.txt` file:

```bash
pip install -r requirements.txt
```

4. **Run the notebook**:
You can use Jupyter, JupyterLab, or VS Code with a remote kernel linked to the container.

---

## Dependencies

All required libraries are listed in `requirements.txt`. Key packages include:

- `cmdstanpy`
- `pandas`, `numpy`, `matplotlib`, `seaborn`
- `scikit-learn`
- `arviz`
- `networkx`

To install them manually:

```bash
pip install cmdstanpy pandas numpy matplotlib seaborn scikit-learn arviz networkx
```

---

