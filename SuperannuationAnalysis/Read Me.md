 
## Project Title : Superannuation Analysis Using Monte Carlo Simulation

### Author : Saakshi Agarwal


## Overview
This project, analyzes the superannuation plan of Emily, a 30-year-old data analyst from Auckland, to ensure her financial security in retirement. Using a Monte Carlo simulation, we forecast her retirement fund's future value, assess her current investment strategy, and provide actionable recommendations to help her achieve her NZD 2 million retirement goal over a 35-year timeline.

## Table of Contents
- [Overview](#overview)
- [Project Objectives](#project-objectives)
- [Methodology](#methodology)
- [Key Findings](#key-findings)
- [Technology Stack](#technology-stack)
- [Usage](#usage)
- [Conclusion](#conclusion)
- [License](#license)
- [Acknowledgments](#acknowledgments)

## Project Objectives
The primary objectives of this project include:
1. Evaluate Emily’s current superannuation strategy, including her investment allocations and contribution rates.
2. Project her retirement fund's future value using a Monte Carlo simulation, considering market volatility, salary growth, inflation, and unforeseen expenses.
3. Provide recommendations to optimize her portfolio for long-term growth while balancing risk, ensuring she meets her retirement goals (healthcare, travel, and financial security).

## Methodology
1. **Data Collection**: Gathered historical performance data for Emily’s investment funds (SkyHigh Equity Growth Fund, Balanced Hybrid Fund, Stable Bonds Fund), salary growth trends, and inflation rates.
2. **Monte Carlo Simulation**: Ran 1000 iterations to model potential outcomes of Emily’s superannuation fund, factoring in:
   - Dynamic investment phases (Aggressive, Moderate, Conservative).
   - Fund returns (e.g., SkyHigh: 10.5% growth, 20.5% volatility; Stable Bonds: 3.5% growth, 4% volatility).
   - Salary growth (3.5% mean, 0.7% standard deviation).
   - Inflation adjustment (1.5% annually).
   - Retirement expenses (e.g., NZD 6,000 per health event every 5 years, NZD 4,000 per international trip every 2 years).
   - **Unforeseen Expenses Modeling**: Used the Poisson theorem to model the frequency of unforeseen expenses (e.g., significant unplanned costs averaging NZD 30,000 every 5 years), assuming a Poisson distribution for rare events with a fixed average rate of occurrence.
3. **Analysis**:
   - Assessed portfolio performance across best-case (95th percentile: NZD 3.2M) and worst-case (5th percentile: NZD 1.8M) scenarios.
   - Conducted scenario analysis, stress testing, and sensitivity analysis to ensure robustness.
4. **Recommendations**:
   - Increase allocation to growth-oriented funds (e.g., SkyHigh Equity from 20% to 60% in the first 10 years).
   - Raise contribution rate to 7% (from 6% combined).
   - Perform annual portfolio reviews to adapt to market changes.

## Key Findings
- **Current Strategy**: Emily’s conservative allocation (20% SkyHigh, 40% Balanced, 40% Stable) limits long-term growth potential.
- **Projected Balance**: Average retirement fund of NZD 2.79M (pre-tax), NZD 2.01M (post-tax), with a 60% chance of reaching NZD 2M.
- **Surplus**: After expenses (NZD 1.51M), Emily is projected to have NZD 587,537 remaining for financial flexibility.
- **Recommendations**: Shift to a more aggressive allocation early on, increase contributions, and regularly rebalance the portfolio.

## Technology Stack
### Monte Carlo Simulation
The Monte Carlo simulation is a computational technique used to model the probability of different outcomes in a process that involves uncertainty. In this project, it was applied to forecast Emily’s retirement fund by simulating 1000 possible future scenarios. Each iteration randomly generates fund returns, salary growth, and other variables based on their historical distributions (e.g., normal distribution for salary growth with a mean of 3.5% and standard deviation of 0.7%). This method accounts for market volatility, inflation, and other uncertainties, providing a range of outcomes (e.g., 5th to 95th percentiles) to assess the likelihood of Emily meeting her NZD 2M goal.

### Poisson Theorem
The Poisson theorem (or Poisson distribution) is a probability model used to predict the number of times a rare event occurs within a fixed interval of time or space, given a known average rate of occurrence. In this project, we used the Poisson distribution to model the frequency of unforeseen expenses during Emily’s retirement, such as significant unplanned costs (e.g., NZD 30,000 every 5 years on average). By setting the Poisson parameter (lambda) to 0.2 (1 event every 5 years), we simulated the likelihood and timing of these rare events across the 35-year timeline, ensuring a realistic representation of unexpected financial shocks in the Monte Carlo simulation.

## Usage
1. **Clone the Repository**:
   ```bash
   git clone https://github.com/yourusername/RetirementPlanningMonteCarlo.git
   cd RetirementPlanningMonteCarlo
   ```

2. **Set Up Input Data in Excel**:
   - Open Excel and navigate to the `data/` folder in the repository.
   - Ensure the following files are present (create them if not provided, using the project’s parameters):
     - `fund_performance.xlsx`: Columns for fund returns and volatility (e.g., SkyHigh: 10.5% growth, 20.5% volatility).
     - `salary_growth.xlsx`: Columns for salary growth (mean: 3.5%, standard deviation: 0.7%).
     - `expenses.xlsx`: Columns for expenses (e.g., health events: NZD 6,000 every 5 years; unforeseen costs: NZD 30,000 every 5 years).
   - Open or create `monte_carlo_simulation.xlsx` in the `scripts/` folder, setting up sheets for Inputs, Simulation, and Results.

3. **Run the Monte Carlo Simulation in Excel**:
   - In the **Inputs Sheet**, define parameters: initial salary (NZD 80,000), contribution rate (6%), inflation rate (1.5%), fund allocations (e.g., 60% SkyHigh for years 1-10), and Poisson lambda (0.2 for unforeseen expenses).
   - In the **Simulation Sheet**, set up a table for 35 years × 1000 iterations:
     - Use `NORM.INV(RAND(), mean, stdev)` for salary growth and fund returns.
     - Use `POISSON.DIST(1, 0.2, FALSE)` with `IF` and `RAND()` to simulate unforeseen expenses.
     - Calculate annual balances: Previous Balance × (1 + Portfolio Return) + Contributions - Expenses.
   - Use Excel’s Data Table feature (under "What-If Analysis") to run 1000 iterations, then press `F9` to recalculate.

4. **Analyze Results in Excel**:
   - In the **Results Sheet**, compute statistics (e.g., `AVERAGE()`, `PERCENTILE.INC()` for 5th/95th percentiles) and the probability of exceeding NZD 2M using `COUNTIF()`.
   - Create charts (e.g., histogram of final balances) to visualize outcomes.
   - Refer to `report/BUSINFO_705_Team_22_GROUP_PROJECT_REPORT.pdf` for detailed findings and `figures/` for visualizations of fund allocations, returns, and expenses.

---


## Conclusion
This project demonstrates the effectiveness of **Monte Carlo simulation for retirement planning**. By leveraging **Monte Carlo simulation with the Poisson theorem**, integrated through Python-based modeling, Emily can forecast her superannuation fund’s future value with a comprehensive understanding of uncertainties such as market volatility, salary growth, inflation, and unforeseen expenses. The simulation’s 1000 iterations, combined with the Poisson theorem’s modeling of rare events (e.g., NZD 30,000 unforeseen costs every 5 years), provide a robust projection of outcomes, revealing an average retirement balance of NZD 2.79M (pre-tax) and a 60% chance of meeting her NZD 2M goal. Recommendations such as increasing contributions to 7% and allocating 60% to growth-oriented funds in the first 10 years enhance her financial trajectory, ensuring a surplus of NZD 587,537 after expenses. Through this approach, Emily can secure her retirement goals of healthcare, travel, and financial stability via **structured, data-driven financial planning**, offering resilience against economic uncertainties and a clear path to a comfortable retirement.
---

## License
This project is licensed under the **MIT License** - see the [LICENSE](LICENSE) file for details.

## Acknowledgments
- Special thanks to [Microsoft Azure](https://azure.microsoft.com/) for cloud-based data management solutions.
- This project was completed as part of a Master’s program project at the [University of Auckland](https://www.auckland.ac.nz/en.html). Special thanks to the University of Auckland for the opportunity to undertake this project and for their invaluable support.
