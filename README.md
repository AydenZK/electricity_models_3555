# Electricity Models
A group assignment as part of the Monash 2022 Unit ETC3555, involving the development of deep learning and machine learning models to predict electricity demand.

# User Guide

## 0. Prerequisites
- Extract the raw dataset and save all xlsx files to `data/raw/`

![figure1](https://github.com/AydenZK/electricity_models_3555/blob/main/docs/images/fig1.png?raw=true)

## 1. Data Cleaning & Transformation
- Open Rstudio to use the terminal

![figure2](https://github.com/AydenZK/electricity_models_3555/blob/main/docs/images/fig2.png?raw=true)

- In the Rstudio terminal, cd to ~/electricity_models_3555/src

- Run `Rscript transform_raw.R`

## 2. Training Deep Neural Network Model & Hyperparamaeter Tuning
- Open and run `src/FinalProject.Rmd`

## 3. Benchmark Model Creation and Analysis
- Open and run `analysis/dhr_analysis.Rmd`

## 4. Model Evaluation & Comparison
- Open and run `analysis/model_eval.Rmd`
