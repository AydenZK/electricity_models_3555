## Imports
library(dplyr)
library(keras)
library(tensorflow)
library(fpp3)
library(pacman)
library(glue)

## Globals
TRAIN_START_DATE = "2014-12-01"
TRAIN_END_DATE = "2019-10-19"
TEST_START_DATE = "2019-10-18"
TEST_END_DATE = "2021-06-01"

load_nn_data <- function(country) {
    data = list()

    raw = read.csv("../data/all_data_hourly.csv") %>% 
        filter(AreaName == country) %>% 
        select(Year, Date, Month, Day, Hours, dayofweek, TotalLoadValue)

    # Create unstandardised dataset
    lagged_data_usd <- raw %>% 
        mutate(
            "hour-1" = lag(TotalLoadValue, n=1), 
            "hour-2" = lag(TotalLoadValue, n=2),
            "day-1" = lag(TotalLoadValue, n=24), 
            "day-7" = lag(TotalLoadValue, n=168)) %>% 
        select(Year, Date, Month, Day, Hours, dayofweek, TotalLoadValue, `day-1`, `day-7`, `hour-1`, `hour-2`) %>%
        tail(-168)

    # Create standardised dataset
    lagged_data_sd <- raw %>% 
        mutate(
            "hour-1" = lag(TotalLoadValue, n=1), 
            "hour-2" = lag(TotalLoadValue, n=2),
            "day-1" = lag(TotalLoadValue, n=24), 
            "day-7" = lag(TotalLoadValue, n=168)) %>% 
        select(Year, Date, Month, Day, Hours, dayofweek, TotalLoadValue, `day-1`, `day-7`, `hour-1`, `hour-2`) %>% 
        mutate(`day-1`= sqrt(`day-1`), `day-7`= sqrt(`day-7`), `hour-1`= sqrt(`hour-1`), `hour-2`= sqrt(`hour-2`)) %>% 
        tail(-168)

    # Sin/cosine transform the time variables
    lagged_data_sd$Hours_sin = sin(2*pi*lagged_data_sd$Hours/24)
    lagged_data_sd$Hours_cos = cos(2*pi*lagged_data_sd$Hours/24)
    lagged_data_sd$Month_sin = cos(2*pi*lagged_data_sd$Month/12)
    lagged_data_sd$Month_cos = cos(2*pi*lagged_data_sd$Month/12)
    lagged_data_sd$Day_sin = cos(2*pi*lagged_data_sd$Day/31)
    lagged_data_sd$Day_cos = cos(2*pi*lagged_data_sd$Day/31)

    lagged_data_usd$Hours_sin = sin(2*pi*lagged_data_usd$Hours/24)
    lagged_data_usd$Hours_cos = cos(2*pi*lagged_data_usd$Hours/24)
    lagged_data_usd$Month_sin = cos(2*pi*lagged_data_usd$Month/12)
    lagged_data_usd$Month_cos = cos(2*pi*lagged_data_usd$Month/12)
    lagged_data_usd$Day_sin = cos(2*pi*lagged_data_usd$Day/31)
    lagged_data_usd$Day_cos = cos(2*pi*lagged_data_usd$Day/31)

    # Remove outliers
    lagged_data_sd <- lagged_data_sd[!lagged_data_sd$TotalLoadValue %in% boxplot.stats(lagged_data_sd$TotalLoadValue)$out,]
    lagged_data_usd <- lagged_data_usd[!lagged_data_usd$TotalLoadValue %in% boxplot.stats(lagged_data_usd$TotalLoadValue)$out,]

    # Splits
    train = lagged_data_sd %>% filter(
        Date >= TRAIN_START_DATE,
        Date <= TRAIN_END_DATE)

    test = lagged_data_sd %>% filter(
        Date >= TEST_START_DATE,
        Date <= TEST_END_DATE)

    test_pred <- lagged_data_usd %>% filter(
        Date >= TEST_START_DATE,
        Date <= TEST_END_DATE) %>% 
        mutate(`day-1`= sqrt(`day-1`), `day-7`= sqrt(`day-7`), `hour-1`= sqrt(`hour-1`), `hour-2`= sqrt(`hour-2`))

    data$X_train = train %>% select(-Year, -TotalLoadValue, -Hours, -Day, -Month)
    data$y_train = train %>% select(TotalLoadValue)

    data$X_test = test %>% select(-Year, -TotalLoadValue, -Hours, -Day, -Month)
    data$y_test = test %>% select(TotalLoadValue)

    data$X_test_pred <- test_pred %>% select(-Year, -TotalLoadValue, -Hours, -Day, -Month)
    data$Y_test_pred = test %>% select(TotalLoadValue) %>% mutate(TotalLoadValue = TotalLoadValue)
    data$train = train
    data$test = test

    return(data)
}

train_nn_model <- function(country) { 
    d = load_nn_data(country)
    print("Data Loaded")

    model1 <- keras_model_sequential() %>%
        layer_dense(64, activation = "relu") %>%
        layer_dense(64, activation = "relu") %>%
        layer_dense(1, activation = "linear")

    model1 <- model1 %>% 
        compile(optimizer = optimizer_adam(), loss = 'mean_absolute_error')

    model1 %>% fit(as.matrix(d$X_train), as.matrix(d$y_train), validation_split = 0.2, epochs = 15)
    print("Model Trained")

    return(model1)
}

save_predictions <- function(df, country) {
    path = glue("../models/predictions/nn_{country}.csv")
    write.csv(df, path)
    print(glue("Predictions csv saved to {path}"))
}

generate_nn_preds_df <- function (mod, data) {
    X_test_pred = data$X_test_pred
    Y_test_pred = data$Y_test_pred
    test = data$test

    predictions <- data.frame(rownumber = numeric(0), prediction = numeric(0))

    print(glue("Predictions Length {nrow(X_test_pred)}"))

    p_load(progress)
    pb <- progress_bar$new(total=nrow(X_test_pred), width=60, clear=F,
	format = " Loading Predictions [:bar] :percent ELAPSED= :elapsed ETA= :eta")

    for (i in 1:nrow(X_test_pred)) {
        if (i == 1) {
            prediction_i <- sqrt(predict(mod, as.matrix(X_test_pred[i,])))
            predictions[i,] <- c(i, prediction_i)
        }
        
        else if (i > 1 & i < 25) {
            X_test_pred$`hour-1`[i] = prediction_i
            X_test_pred$`hour-2`[i] = X_test_pred$`hour-1`[i-1]
            prediction_i <- sqrt(predict(mod, as.matrix(X_test_pred[i,])))
            predictions[i,] <- c(i, prediction_i)
        }
        
        else if (i > 24 & i < 169) {
            X_test_pred$`hour-1`[i] = prediction_i
            X_test_pred$`hour-2`[i] = X_test_pred$`hour-1`[i-1]
            X_test_pred$`day-1`[i] = predictions[i-24,2]
            prediction_i <- sqrt(predict(mod, as.matrix(X_test_pred[i,])))
            predictions[i,] <- c(i, prediction_i)
        }
        else {
            X_test_pred$`hour-1`[i] = prediction_i
            X_test_pred$`hour-2`[i] = X_test_pred$`hour-1`[i-1]
            X_test_pred$`day-1`[i] = predictions[i-24,2]
            X_test_pred$`day-7`[i] = predictions[i-168,2]
            prediction_i <- sqrt(predict(mod, as.matrix(X_test_pred[i,])))
            predictions[i,] <- c(i, prediction_i)
        }
        pb$tick()
        if (i %% 1000 == 0) {print(glue("Iteration: {i}"))}
    }

    final_predictions <- predictions %>% mutate(TotalLoadValue = prediction^2) 
    final <- test
    final$TotalLoadValuePred = final_predictions$TotalLoadValue

    final <- final %>% 
        group_by(Year, Month, Day) %>% summarise(TotalLoadValue = sum(TotalLoadValuePred)) %>% 
        mutate(Date = ymd(glue("{Year}-{Month}-{Day}"))) %>%
        select(Date, TotalLoadValue) %>% 
        filter(Date >= TEST_START_DATE, Date <= TEST_END_DATE) %>% 
        as_tsibble(index=Date)

    save_predictions(final, country)

    return(final)
}