Time Series Data (CRUDE_BRENT, MAIZE, WHEAT)
             |
       Unit Root Test
             |
         /       \
 Stationary   Not Stationary
   (level)       |
     |        Stationary at 
     |         first difference
     |              |
  VAR Analysis   Johansen's 
                 Co-Integration Test
                      |
                 /         \
                Yes         No
                 |           |
            Lag Length   Unrestricted 
                 |         VAR Analysis
         Co-Integration Test    |
                 |           Granger's
             VECM Model     Causality Test
                 |                |
                 |          IRF and VD Analysis
                 \________________/
                           |
                      Forecasting
                           |
                          Output
