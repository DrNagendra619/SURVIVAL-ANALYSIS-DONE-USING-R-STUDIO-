# SURVIVAL-ANALYSIS-DONE-USING-R-STUDIO-
SURVIVAL ANALYSIS
# 📉 Lung Cancer Survival Analysis (Kaplan-Meier & Cox Proportional Hazards)

## 📝 Overview

This repository contains an R script that performs a comprehensive **Survival Analysis** on the built-in `lung` dataset, which contains data from the North Central Cancer Treatment Group (NCCTG) on advanced lung cancer patients.

The analysis covers two primary statistical methods: the **Kaplan-Meier (KM) survival curve** to estimate survival probability, and the **Cox Proportional Hazards (PH) model** to examine the effect of covariates on survival time.

## 🚀 Analysis Steps

The R script executes the following key steps:

### 1. Setup and Data Preparation

* **Package Installation**: Installs and loads the core `survival` and supplementary `survminer` packages.
* **Data Loading**: Uses the built-in `lung` dataset.
* **Data Inspection**: Performs preliminary data inspection using `head()`, `dim()`, `class()`, and `as_tibble()`.
* **Survival Object**: Creates a `Surv` object, defining the **time-to-event** (`time`) and **event status** (`status`), where `status=2` typically denotes the event (death).

---

### 2. Kaplan-Meier (KM) Analysis

* **Estimate Overall Survival**: Calculates and plots the **Kaplan-Meier survival function** for the entire cohort.
    ```r
    survfit(Surv(time, status) ~ 1, data = lung)
    ```
* **Survival Probability Summary**: Displays a detailed summary of the survival probabilities at various time points (e.g., every 100 days).
* **Survival by Covariate**: Calculates and plots the KM curve stratified by the **`sex`** covariate (`Surv(time, status) ~ sex`).
* **Enhanced Visualization**: Uses the `ggsurvplot()` function from the `survminer` package to generate a high-quality KM plot, including:
    * **Confidence Intervals (`conf.int=TRUE`)**
    * **Log-rank Test p-value (`pval=TRUE`)**
    * **Risk Table (`risk.table=TRUE`)**
    * **Custom Labels** (Male/Female) and **Colors**.

---

### 3. Cox Proportional Hazards (PH) Regression

* **Fit Cox Model**: Fits a **Cox Proportional Hazards model** to examine the relationship between all available covariates (`.`) and the survival outcome.
    ```r
    coxph(Surv(lung$time, lung$status == 2) ~ ., data = lung)
    ```
* **Model Summary**: Generates a detailed summary (`summary(Cox_mod)`) showing the **Hazard Ratios**, confidence intervals, and p-values for all predictors.
* **Survival Plot from Cox Model**: Fits the baseline survival function from the Cox model and visualizes the results.

## 💾 Data

* **Dataset**: `lung` (built-in R dataset)
* **Source**: North Central Cancer Treatment Group (NCCTG)
* **Key Variables Used**:
    * **`time`**: Survival time in days.
    * **`status`**: Censoring status (1 = censored, 2 = dead/event).
    * **`sex`**: Patient sex (covariate for stratified KM analysis).

## 🛠️ R Packages

The following packages are required to run the analysis:

* **`survival`**: The core package for survival analysis, providing the `Surv()`, `survfit()`, and `coxph()` functions.
* **`survminer`**: Used for producing enhanced Kaplan-Meier plots (`ggsurvplot`).
* **`dplyr`** / **`tidyverse`**: Used for general data manipulation (e.g., converting to a tibble).
