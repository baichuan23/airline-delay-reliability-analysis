# Day 5 - Pre-Flight Delay Prediction: Key Findings

## 1. Modeling Objective

The prediction target is whether a normally operated flight arrives at least 15 minutes late:

ArrDel15 = 1

Only information available before scheduled departure was used.

Post-departure variables such as departure delay, arrival delay, taxi time, and delay-cause variables were excluded to prevent data leakage.

## 2. Temporal Validation Design

The dataset was split chronologically rather than randomly.

- Training: January-September 2025
- Validation: October-November 2025
- Out-of-time Test: December 2025

Modeling sample:
4,430,248 completed, non-diverted flights.

Delay rates:

- Train: 22.04%
- Validation: 19.51%
- Test: 26.42%

December therefore represents a more difficult high-delay operating environment.

## 3. Logistic Regression Baseline

Validation performance:

- ROC-AUC: 0.6369
- PR-AUC: 0.2922

The default 0.50 threshold produced very low recall.

A business threshold of 0.30 was selected for comparison:

- Precision: 28.21%
- Recall: 50.27%
- F1: 0.3614
- Flights flagged high risk: 34.77%
- Risk lift vs validation baseline: 1.45x

## 4. Random Forest

Validation performance:

- ROC-AUC: 0.6306
- PR-AUC: 0.2871

At a threshold of 0.26:

- Precision: 28.07%
- Recall: 47.80%
- F1: 0.3537
- Flights flagged high risk: 33.24%

Random Forest did not outperform Logistic Regression.

## 5. XGBoost

Validation performance:

- ROC-AUC: 0.6434
- PR-AUC: 0.2982

XGBoost provided a modest but consistent improvement over Logistic Regression and Random Forest.

A business threshold of 0.24 was selected.

Validation performance at threshold 0.24:

- Precision: 28.80%
- Recall: 49.48%
- F1: 0.3641
- Flights flagged high risk: 33.53%

The highest validation F1 was 0.3723 at threshold 0.20, but the 0.24 threshold was selected to maintain a more manageable operational alert volume.

## 6. Final Out-of-Time Test

The final model and threshold were evaluated once on December 2025.

Results:

- Baseline delay rate: 26.42%
- ROC-AUC: 0.6084
- PR-AUC: 0.3459
- Precision: 34.80%
- Recall: 42.71%
- F1: 0.3835
- Flights flagged high risk: 32.43%
- Risk lift vs baseline: 1.32x

The decline in ROC-AUC from validation to December suggests temporal and seasonal distribution shift during a more difficult operating period.

The test results were not used to retune the model or decision threshold.

## 7. Model Interpretation

Important individual XGBoost features included:

- June
- July
- Scheduled arrival hour
- Early-morning departure indicator
- Origin SLC
- September
- Origin LAX
- Origin SFO
- Destination EWR
- Origin DFW

Aggregated feature importance indicates that airport location, seasonality, and scheduled timing are the most informative pre-flight feature groups.

Feature importance should be interpreted as predictive importance rather than causal importance.

## 8. Business Interpretation

The final model should be viewed as a pre-flight risk prioritization tool rather than a deterministic delay predictor.

It can help operations teams identify a smaller group of flights with elevated delay risk before departure.

At the selected threshold, approximately one-third of flights are flagged for additional attention.

Potential operational uses include:

- proactive aircraft and crew monitoring
- targeted turnaround support
- schedule recovery preparation
- high-risk flight watchlists
- prioritization of limited operational resources

The prediction model complements the root-cause and propagation analyses rather than replacing them.
