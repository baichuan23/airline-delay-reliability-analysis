# Day 6 - Intervention Prioritization & Financial Impact

## 1. Operationally Actionable Delay Baseline

Total attributed delay minutes in the analytical dataset:

76,925,980 minutes

For intervention analysis, operationally actionable delay is defined as:

Carrier Delay + Late Aircraft Delay

Observed baseline:

- Operationally actionable delay minutes: 54,619,827
- Operationally actionable share: 71.00%
- External / system delay minutes: 22,306,153
- External / system share: 29.00%

The 71% figure represents the observed share of delay minutes associated with Carrier Delay and Late Aircraft Delay.

It should not be interpreted as the percentage of delay that can be fully eliminated.

## 2. Airport Intervention Opportunities

The largest actionable delay opportunity pools among the selected core airports include:

- ORD: 4.92 million actionable delay minutes
- DFW: 4.60 million
- ATL: 3.16 million
- CLT: 2.77 million
- DEN: 2.41 million
- LGA: 1.85 million

ORD and DFW combine large delay exposure with high actionable delay intensity.

EWR and LGA have smaller absolute volumes than ORD and DFW but relatively high actionable delay intensity.

## 3. Route-Level Opportunities

High-opportunity routes were identified using:

- minimum annual flight volume
- delay rate
- actionable delay minutes
- actionable delay intensity
- actionable share

Examples include:

- LGA → ORD
- ORD → LGA
- DFW → ORD
- ORD → DFW
- DFW → SAT
- ORD → MKE
- ORD → STL
- LAX → DFW
- IAH → DFW

The analysis supports targeted route-level interventions rather than uniform network-wide schedule changes.

## 4. Recommended Intervention Framework

### Aircraft Rotation Recovery

Target:
High-propagation airports and aircraft rotations.

Actions may include:

- proactive recovery of delayed inbound aircraft
- protection of downstream rotations
- aircraft swaps where operationally feasible
- additional recovery resources following severe upstream delays

Evidence:
Previous-flight delays increased next-flight delay risk from 13.82% to 48.41%.

### Targeted Turnaround Support

Target:
High-volume operational hubs such as ORD, DFW, ATL, CLT and DEN.

Potential actions:

- targeted gate support
- ground-handling prioritization
- baggage and fueling coordination
- turnaround recovery resources for high-risk flights

### Route-Specific Schedule Buffer Review

Target:
Repeated high-intensity routes.

Potential actions:

- review scheduled block time
- review turnaround buffers
- identify recurring structural schedule pressure

This recommendation does not imply system-wide schedule padding.

### High-Risk Flight Watchlist

Target:
Flights identified by the pre-flight XGBoost model.

Potential actions:

- proactive monitoring
- recovery preparation
- prioritized operational attention
- resource allocation to higher-risk departures

The final model produced a 1.32x risk lift on the December out-of-time test set.

## 5. Delay Reduction Scenarios

Scenario reductions of 5%, 10% and 15% were applied to operationally actionable delay minutes.

These are scenario assumptions and not observed reductions.

### Network-Wide Scenario

Baseline actionable delay minutes:

54,619,827

Estimated delay minutes avoided:

- 5% reduction: 2,730,991 minutes
- 10% reduction: 5,461,983 minutes
- 15% reduction: 8,192,974 minutes

### Targeted Six-Airport Scenario

Priority airports:

ORD, DFW, ATL, DEN, CLT and LGA

Baseline actionable delay minutes:

19,713,632

Estimated delay minutes avoided:

- 5% reduction: 985,682 minutes
- 10% reduction: 1,971,363 minutes
- 15% reduction: 2,957,045 minutes

## 6. Financial Sensitivity Assumptions

Because the BTS dataset does not identify the exact operational phase of each arrival-delay minute, a single observed airline cost per delay minute cannot be derived directly.

The financial analysis therefore uses explicit scenario assumptions:

- Low: $20 per avoided delay minute
- Base: $40 per avoided delay minute
- High: $60 per avoided delay minute

These values are sensitivity assumptions rather than realized airline financial results.

## 7. Network-Wide Scenario Value

Under the Base assumption of $40 per avoided delay minute:

- 5% reduction: $109.24 million
- 10% reduction: $218.48 million
- 15% reduction: $327.72 million

These figures represent estimated scenario operating value rather than guaranteed cost savings.

## 8. Targeted Six-Airport Scenario Value

Under the Base assumption of:

10% actionable delay reduction
and
$40 per avoided delay minute

the six-airport scenario produces:

- Delay minutes avoided: approximately 1.97 million
- Estimated operating value: approximately $78.85 million

Airport-level scenario values:

- ORD: $19.67 million
- DFW: $18.42 million
- ATL: $12.65 million
- CLT: $11.09 million
- DEN: $9.63 million
- LGA: $7.40 million

## 9. Business Recommendation

The recommended strategy is targeted rather than network-wide.

Priority should be given to airports and routes that combine:

- large operational exposure
- high actionable delay minutes
- strong delay propagation
- elevated actionable delay intensity

A practical intervention sequence would be:

1. Prioritize ORD and DFW as major propagation and actionable-delay nodes.
2. Expand targeted recovery support to ATL, DEN, CLT and LGA.
3. Review recurring high-intensity routes for schedule and turnaround pressure.
4. Use the pre-flight XGBoost model to identify higher-risk flights for targeted operational attention.
5. Measure realized delay-minute reductions before translating scenario value into financial claims.

## Interpretation Note

All financial values in this analysis are scenario-based estimates.

They should not be interpreted as actual airline profit, realized cost savings, or guaranteed financial outcomes.
