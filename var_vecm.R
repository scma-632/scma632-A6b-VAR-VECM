setwd('C:\\Users\\Patil\\Downloads\\Fwd_')
getwd()
# Load necessary libraries
library(readxl)
library(dplyr)
library(janitor)
library(urca)
library(vars)

df = read_excel('pinksheet.xlsx', sheet="Monthly Prices", skip = 6)

# Rename the first column to "Date"
colnames(df)[1] <- 'Date'
# Convert the Date column to Date format
df$Date <- as.Date(paste0(df$Date, "01"), format = "%YM%m%d")
str(df)


# Get the column numbers for each column
column_numbers <- setNames(seq_along(df), colnames(df))

commodity = df[,c(1,3,25,70,72,61,31)]

commodity = clean_names(commodity)

str(commodity)
# Use dplyr::select to avoid any conflicts and exclude the Date column
commodity_data <- dplyr::select(commodity, -date)

vecm.model <- ca.jo(commodity_data, ecdet = 'const', type  = 'eigen', K = 2, spec = 'transitory', dumvar = NULL)

summary(vecm.model)


# Estimating the VECM
vecm <- cajorls(vecm.model, r = 1)  # r is the number of cointegration vectors
summary(vecm)

# Extracting the coefficients from the VECM model
vecm_coefs <- cajorls(vecm.model, r = 1)$rlm$coefficients

# Creating a VECM model for prediction
vecm_pred <- vec2var(vecm.model, r = 1)


# Forecasting using the VECM

# Forecasting 10 steps ahead
forecast <- predict(vecm_pred, n.ahead = 12)

# Plotting the forecast
par(mar = c(4, 4, 2, 2))  # Adjust margins: c(bottom, left, top, right)
plot(forecast)
