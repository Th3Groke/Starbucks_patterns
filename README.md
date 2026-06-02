# Starbucks Customer Ordering Patterns Analysis

## 📌 Overview
This repository contains a comprehensive statistical analysis of Starbucks customer ordering behaviors, demographic trends, and operational efficiency. The project investigates fulfillment times, loyalty program engagement, and product customization using robust non-parametric hypothesis testing and visual analytics. 

The final output is a formal academic/business report compiled in LaTeX, supported by data processed and analyzed in R.

## 🛠️ Tech Stack
* **Language:** R (Base R, `readr`, `stats`)
* **Documentation & Reporting:** LaTeX (`booktabs`, `makecell`, `graphicx`)
* **Visualization:** Base R Graphics (Boxplots, Scatter Plots, Q-Q Plots, Histograms)

## 📊 Dataset Highlights
The analysis is built on [`starbucks_customer_ordering_patterns.csv`](https://www.kaggle.com/datasets/likithagedipudi/starbucks-customer-ordering-patterns) found on Kaggle, focusing on key variables:
* `fulfillment_time_min`: Order completion time (discrete numerical).
* `total_spend`: Transaction value in USD (continuous numerical).
* `num_customizations`: Number of modifications per order (discrete numerical).
* `customer_age_group`: Categorical age demographics.
* `is_reward_member`: Loyalty program enrollment status.

## 🔬 Methodology & Statistical Tests
Because much of the operational data does not follow a standard Gaussian distribution, this project applies advanced statistical techniques to ensure reliable conclusions:
1. **Normality Testing:** Kolmogorov-Smirnov (K-S) tests and Q-Q plots (with and without outliers).
2. **Hypothesis Testing:** Mann-Whitney U Test, Kruskal-Wallis Test, and Pairwise Wilcoxon Tests (Bonferroni correction).
3. **Correlation & Regression:** Spearman's Rank Correlation and linear regression diagnostics controlling for product complexity.

## 📂 Project Architecture
The repository is highly organized into scripts, generated resources, and the final LaTeX report.

```text
.
├── changelog.md
├── clean.sh
├── Report/
│   ├── report.pdf
│   ├── report.synctex.gz
│   └── report.tex
├── Resources/
│   ├── Charts/
│   │   ├── box-plots/                 # Distribution & Outlier comparisons
│   │   ├── Normality_testing/         # Q-Q plots for distributions
│   │   └── ... (Histograms, Bar & Pie charts)
│   ├── Hypothesis_testing/            # Exported visual proofs for tests
│   └── politechnika_sl_logo_bw_pion_pl.pdf
├── Scripts/
│   ├── descriptive/                   # Initial data exploration scripts
│   ├── Normality_testing/             # K-S tests & Skewness/Kurtosis evaluation
│   ├── Charts/                        # Visualization generation scripts
│   ├── Hypothesis_testing/            # Core statistical tests (Mann-Whitney, etc.)
│   └── outliers_percentage_calculation.r
└── starbucks_customer_ordering_patterns.csv
