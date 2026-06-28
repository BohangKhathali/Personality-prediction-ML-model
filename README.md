# Personality-Based Therapy Allocation System

## The Problem
Therapists in under-resourced clinics often waste time placing Introverts in overwhelming group sessions and Extroverts in isolating solo therapy. This leads to dropouts and slow recovery. In South Africa, there is fewer than one psychiatrist per 100,000 people in the public sector (SADAG, 2023).

## The Solution
A machine learning model that predicts a patient's personality (Introvert/Extrovert) from their written intake responses, which type of therapy session would better suit them.

## Key Results
- **Model Accuracy:** 74.93%
- **Introvert Recall:** 79% (safely catches those who need 1-on-1 care)
- **Extrovert Recall:** 61% (catches socially-oriented patients)
- **Confidence Output:** The model provides a percentage score for every prediction

## Tech Stack
Python (Pandas, Scikit-learn, TF-IDF) | MySQL | Power BI

## Dashboard Preview

**Page 1: Model Performance & Trust**  
![Model Metrics](Dashboard%20images/Page_4_Metrics.png)

**Page 2: Personality Distribution**  
![Distribution](Dashboard%20images/Page_1_Distribution.png)

**Page 3: Linguistic Complexity**  
![Linguistics](Dashboard%20images/Page_2_Linguistics.png)

**Page 4: Behavioral Risk Markers (Buzzwords)**  
![Risk Markers](Dashboard%20images/Page_3_Risk.png)

## Live Demo (Try It Yourself!)
1. Open the `ML model.ipynb` notebook.
2. Scroll to the very last cell.
3. Run it and answer: *"After a long week, how do you prefer to spend your Saturday evening?"*
4. The model will tell you if you're an Introvert or Extrovert with a confidence score.

## Project Structure
- `ML model.ipynb` - Full data cleaning, training, and evaluation.
- `EDA.ipynb` - Visualisations and feature engineering.
- `mySQL part.sql` - Database schema and analytical queries.
- `Project report.pdf` - In-detail academic write-up explaing every aspect of the project.
- `Dashboard images/` - Power BI dashboard screenshots.

## Dataset
[MBTI Personality Dataset on Kaggle](https://www.kaggle.com/datasets/datasnaek/mbti-type)

## Author
[Bohang Khathali](https://github.com/BohangKhathali)

## NB for Data Files:

The CSV files are too large to upload to GitHub 

**Download the dataset and csv files here:** https://drive.google.com/drive/folders/1Fa94Ao8QV72qpntz1Y9irdPurfZE1wwS?usp=sharing
