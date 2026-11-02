# Day 4 - Network Reliability & Delay Propagation: Key Findings

## 1. Aircraft Rotation Sample

Aircraft tail numbers were used to reconstruct consecutive flight rotations.

- Total analytical flights: 4,518,993
- Flights missing Tail Number: 11,105
- Unique aircraft tail numbers: 4,551
- Tail-number/time conflicts represented only 0.046% of records
- 98.24% of tail-number records were retained after propagation data cleaning

A valid consecutive flight pair required the previous flight destination to match the current flight origin.

## 2. Overall Delay Propagation

The downstream delay rate differs substantially depending on the status of the previous flight.

- Previous flight on time: 13.82% next-flight delay rate
- Previous flight delayed >=15 minutes: 48.41% next-flight delay rate
- Risk difference: +34.59 percentage points
- Risk ratio: 3.50x

This provides strong evidence of a network delay propagation pattern.

These results describe an association and should not be interpreted as a causal estimate.

## 3. Upstream Delay Severity

Downstream delay risk increases sharply with the severity of the previous flight delay.

- 0-14 minutes: 13.82%
- 15-29 minutes: 30.97%
- 30-59 minutes: 50.61%
- 60-119 minutes: 61.63%
- 120+ minutes: 60.95%

The relationship rises strongly and then appears to plateau once upstream delay exceeds approximately one hour.

Although the delay probability plateaus, flights following 120+ minute upstream delays still record very high average downstream arrival delay severity.

## 4. Airline Propagation Differences

The airline networks exhibit different propagation patterns.

AA:
- Previous flight on time: 15.09%
- Previous flight delayed: 50.29%
- Risk difference: +35.20 percentage points
- Risk ratio: 3.33x

DL:
- Previous flight on time: 11.62%
- Previous flight delayed: 49.71%
- Risk difference: +38.09 percentage points
- Risk ratio: 4.28x

UA:
- Previous flight on time: 14.81%
- Previous flight delayed: 44.51%
- Risk difference: +29.70 percentage points
- Risk ratio: 3.01x

AA has the highest conditional downstream delay rate after an upstream delay, while DL shows the largest relative increase from its lower baseline delay risk.

## 5. Airport Propagation Differences

Propagation sensitivity differs materially across core airports.

Examples:

- LGA: 15.95% baseline vs 54.99% after previous delay
- ATL: 15.82% vs 54.42%
- CLT: 15.93% vs 52.08%
- DFW: 20.12% vs 52.82%
- ORD: 17.22% vs 50.76%

Some airports have high propagation sensitivity, while others have greater operational exposure because of higher flight volume.

## 6. Propagation Intervention Priority

A transparent prioritization metric was constructed as:

Propagation Priority Score
= Delayed Previous Flight Pairs
x Propagation Risk Difference

This score represents propagation exposure multiplied by downstream risk uplift.

It is a prioritization metric and not a causal estimate of additional delays.

Highest-priority airports:

1. ORD
2. DFW
3. ATL
4. DEN
5. CLT
6. LGA
7. IAH
8. DTW

ORD and DFW are particularly important because they combine large aircraft-rotation exposure with substantial propagation risk.

## Business Implication

Delay reduction should not focus only on individual delayed flights.

The results indicate that upstream disruptions can persist through aircraft rotations and amplify later in the operating day.

Potential intervention areas include:

- aircraft rotation recovery
- targeted schedule buffers
- faster turnaround recovery
- spare aircraft or crew capacity at high-priority hubs
- proactive intervention after severe upstream delays
- airport-specific recovery strategies

These strategies will be evaluated financially in the later intervention and scenario analysis stage.
