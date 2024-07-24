# scma632-A6b-VAR-VECM

### Choosing between a Vector Autoregressive (VAR) model and a Vector Error Correction Model (VECM) depends primarily on whether your variables are cointegrated. Here's a step-by-step process to decide which model to use:

## 1. Stationarity Testing
First, check if your time series data are stationary. This can be done using unit root tests like the Augmented Dickey-Fuller (ADF) test, Phillips-Perron (PP) test, or KPSS test.

## Stationary Data: If your data are stationary (i.e., no unit root), you can use a VAR model.
## Non-Stationary Data: If your data are non-stationary (i.e., unit root present), proceed to test for cointegration.

## 2. Cointegration Testing
If your variables are non-stationary, test for cointegration using the Johansen cointegration test. Cointegration indicates a long-term equilibrium relationship between the variables.

No Cointegration: If there is no cointegration among the variables, the appropriate model is a VAR model in differences (ΔVAR), where you difference the data to make them stationary.
Cointegration Present: If there is cointegration, the appropriate model is a VECM. The VECM accounts for both the short-term dynamics and the long-term equilibrium relationship among the variables.

## 3. Model Selection
Based on the results of the stationarity and cointegration tests, you can decide between VAR and VECM:

## Vector Autoregressive (VAR) Model
Use When: The variables are stationary or made stationary through differencing, and there is no cointegration among them.
Description: A VAR model captures the linear interdependencies among multiple time series. It models each variable as a linear function of its own past values and the past values of other variables in the system.

## Vector Error Correction Model (VECM)
Use When: The variables are non-stationary, and there is evidence of cointegration.
Description: A VECM is a special form of VAR for non-stationary series that are cointegrated. It includes an error correction term that captures the long-term equilibrium relationship, allowing the model to correct deviations from this equilibrium.
Practical Considerations
Economic Theory: In some cases, economic theory may suggest a long-term equilibrium relationship, making a VECM more appropriate even before formal tests.
Data Considerations: The choice may also depend on data availability, frequency, and quality. For example, higher-frequency data might require differencing more often, leading to a preference for VAR in differences.

## Summary
VAR: Use for stationary or differenced non-stationary data without cointegration.
VECM: Use for non-stationary data with cointegration.
Always ensure proper model diagnostics (such as residual analysis, stability tests, and checking for autocorrelation) after fitting either model to ensure it adequately captures the data's dynamics.

## VAR/VECM Workflow

1. **Start with Time Series Data (GDP, SBI, SBIS)**
2. **Unit Root Test**
   - **Stationary at Level**
     - Proceed with **VAR Analysis**
   - **Not Stationary**
     - Test for **Stationarity at First Difference**
       - **Johansen's Co-Integration Test**
         - If **Co-Integration Exists**:
           1. Determine **Lag Length**
           2. Conduct **Co-Integration Test**
           3. Build **VECM Model**
         - If **No Co-Integration**:
           - Perform **Unrestricted VAR Analysis**
3. **Post VAR/VECM Analysis**
   - **Granger's Causality Test**
   - **Impulse Response Function (IRF) and Variance Decomposition (VD) Analysis**
4. **Forecasting**
5. **Output**
