## Imports
library(dplyr)
library(fpp3)

## Globals
TRAIN_START_DATE = "2014-12-01"
TRAIN_END_DATE = "2019-10-19"
TEST_START_DATE = "2019-10-18"
TEST_END_DATE = "2021-06-01"

load_dhr_data <- function(country) {
    data = list()

    raw = read.csv("../data/all_data_daily.csv") %>% 
        mutate(Date = as.Date(Date, "%Y-%m-%d")) %>% 
        select(Date, Country, TotalLoadValue) %>% 
        filter(Country == country) %>%
        select(Date, TotalLoadValue) %>%
        as_tsibble() %>% fill_gaps()

    data$train = raw %>% filter(
        Date >= TRAIN_START_DATE,
        Date <= TRAIN_END_DATE)

    data$test = raw %>% filter(
        Date >= TEST_START_DATE,
        Date <= TEST_END_DATE)

    return(data)
}

train_dhr_model <- function(country) {
    train = load_dhr_data(country)$train 
    
    print(glue("Data loaded: Rows: {nrow(train)}"))

    start_time <- Sys.time()
    mod <- train %>% 
        model(
            dhr = ARIMA(TotalLoadValue ~ fourier(period="year", K=4) + 0 + pdq(5,0,1) + PDQ(2,1,0))
        )
    print("Trained Model")
    print(Sys.time() - start_time)

    return(mod)
}

generate_dhr_preds_df <- function(mod, h) {
    mod %>% 
        forecast(h=h) %>% 
        as_tsibble(index=Date) %>%
        select(Date, .mean) %>%
        rename(TotalLoadValue = .mean)
}