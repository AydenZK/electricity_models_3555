library(tidyverse)
library(readxl)
library(fpp3)
library(readabs)
library(glue)

countries <- read_excel("../data/raw/country_assoc.xlsx") %>% mutate(AreaCode = areacode) %>% select(AreaCode,AreaName)

data2014_12 <- read_excel("../data/raw/2014_12_ActualTotalLoad.xlsx")
data2014 <- data2014_12

start_time <- Sys.time()
data2015_1 <- read_excel("../data/raw/2015_1_ActualTotalLoad.xlsx")
data2015_2 <- read_excel("../data/raw/2015_2_ActualTotalLoad.xlsx")
data2015_3 <- read_excel("../data/raw/2015_3_ActualTotalLoad.xlsx")
data2015_4 <- read_excel("../data/raw/2015_4_ActualTotalLoad.xlsx")
data2015_5 <- read_excel("../data/raw/2015_5_ActualTotalLoad.xlsx")
data2015_6 <- read_excel("../data/raw/2015_6_ActualTotalLoad.xlsx")
data2015_7 <- read_excel("../data/raw/2015_7_ActualTotalLoad.xlsx")
data2015_8 <- read_excel("../data/raw/2015_8_ActualTotalLoad.xlsx")
data2015_9 <- read_excel("../data/raw/2015_9_ActualTotalLoad.xlsx")
data2015_10 <- read_excel("../data/raw/2015_10_ActualTotalLoad.xlsx")
data2015_11 <- read_excel("../data/raw/2015_11_ActualTotalLoad.xlsx")
data2015_12 <- read_excel("../data/raw/2015_12_ActualTotalLoad.xlsx")
data2015 <- bind_rows(data2015_1,data2015_2,data2015_3,data2015_4,data2015_5,data2015_6,data2015_7,data2015_8,data2015_9,data2015_10,data2015_11,data2015_12)
print("Extracted 2015 Data")
print(Sys.time() - start_time)
print("")

start_time <- Sys.time()
data2016_1 <- read_excel("../data/raw/2016_1_ActualTotalLoad.xlsx")
data2016_2 <- read_excel("../data/raw/2016_2_ActualTotalLoad.xlsx")
data2016_3 <- read_excel("../data/raw/2016_3_ActualTotalLoad.xlsx")
data2016_4 <- read_excel("../data/raw/2016_4_ActualTotalLoad.xlsx")
data2016_5 <- read_excel("../data/raw/2016_5_ActualTotalLoad.xlsx")
data2016_6 <- read_excel("../data/raw/2016_6_ActualTotalLoad.xlsx")
data2016_7 <- read_excel("../data/raw/2016_7_ActualTotalLoad.xlsx")
data2016_8 <- read_excel("../data/raw/2016_8_ActualTotalLoad.xlsx")
data2016_9 <- read_excel("../data/raw/2016_9_ActualTotalLoad.xlsx")
data2016_10 <- read_excel("../data/raw/2016_10_ActualTotalLoad.xlsx")
data2016_11 <- read_excel("../data/raw/2016_11_ActualTotalLoad.xlsx")
data2016_12 <- read_excel("../data/raw/2016_12_ActualTotalLoad.xlsx")
data2016 <- bind_rows(data2016_1,data2016_2,data2016_3,data2016_4,data2016_5,data2016_6,data2016_7,data2016_8,data2016_9,data2016_10,data2016_11,data2016_12)
print("Extracted 2016 Data")
print(Sys.time() - start_time)
print("")

start_time <- Sys.time()
data2017_1 <- read_excel("../data/raw/2017_1_ActualTotalLoad.xlsx")
data2017_2 <- read_excel("../data/raw/2017_2_ActualTotalLoad.xlsx")
data2017_3 <- read_excel("../data/raw/2017_3_ActualTotalLoad.xlsx")
data2017_4 <- read_excel("../data/raw/2017_4_ActualTotalLoad.xlsx")
data2017_5 <- read_excel("../data/raw/2017_5_ActualTotalLoad.xlsx")
data2017_6 <- read_excel("../data/raw/2017_6_ActualTotalLoad.xlsx")
data2017_7 <- read_excel("../data/raw/2017_7_ActualTotalLoad.xlsx")
data2017_8 <- read_excel("../data/raw/2017_8_ActualTotalLoad.xlsx")
data2017_9 <- read_excel("../data/raw/2017_9_ActualTotalLoad.xlsx")
data2017_10 <- read_excel("../data/raw/2017_10_ActualTotalLoad.xlsx")
data2017_11 <- read_excel("../data/raw/2017_11_ActualTotalLoad.xlsx")
data2017_12 <- read_excel("../data/raw/2017_12_ActualTotalLoad.xlsx")
data2017 <- bind_rows(data2017_1,data2017_2,data2017_3,data2017_4,data2017_5,data2017_6,data2017_7,data2017_8,data2017_9,data2017_10,data2017_11,data2017_12)
print("Extracted 2017 Data")
print(Sys.time() - start_time)
print("")

start_time <- Sys.time()
data2018_1 <- read_excel("../data/raw/2018_1_ActualTotalLoad.xlsx")
data2018_2 <- read_excel("../data/raw/2018_2_ActualTotalLoad.xlsx")
data2018_3 <- read_excel("../data/raw/2018_3_ActualTotalLoad.xlsx")
data2018_4 <- read_excel("../data/raw/2018_4_ActualTotalLoad.xlsx")
data2018_5 <- read_excel("../data/raw/2018_5_ActualTotalLoad.xlsx")
data2018_6 <- read_excel("../data/raw/2018_6_ActualTotalLoad.xlsx")
data2018_7 <- read_excel("../data/raw/2018_7_ActualTotalLoad.xlsx")
data2018_8 <- read_excel("../data/raw/2018_8_ActualTotalLoad.xlsx")
data2018_9 <- read_excel("../data/raw/2018_9_ActualTotalLoad.xlsx")
data2018_10 <- read_excel("../data/raw/2018_10_ActualTotalLoad.xlsx")
data2018_11 <- read_excel("../data/raw/2018_11_ActualTotalLoad.xlsx")
data2018_12 <- read_excel("../data/raw/2018_12_ActualTotalLoad.xlsx")
data2018 <- bind_rows(data2018_1,data2018_2,data2018_3,data2018_4,data2018_5,data2018_6,data2018_7,data2018_8,data2018_9,data2018_10,data2018_11,data2018_12)
print("Extracted 2018 Data")
print(Sys.time() - start_time)
print("")

start_time <- Sys.time()
data2019_1 <- read_excel("../data/raw/2019_1_ActualTotalLoad.xlsx")
data2019_2 <- read_excel("../data/raw/2019_2_ActualTotalLoad.xlsx")
data2019_3 <- read_excel("../data/raw/2019_3_ActualTotalLoad.xlsx")
data2019_4 <- read_excel("../data/raw/2019_4_ActualTotalLoad.xlsx")
data2019_5 <- read_excel("../data/raw/2019_5_ActualTotalLoad.xlsx")
data2019_6 <- read_excel("../data/raw/2019_6_ActualTotalLoad.xlsx")
data2019_7 <- read_excel("../data/raw/2019_7_ActualTotalLoad.xlsx")
data2019_8 <- read_excel("../data/raw/2019_8_ActualTotalLoad.xlsx")
data2019_9 <- read_excel("../data/raw/2019_9_ActualTotalLoad.xlsx")
data2019_10 <- read_excel("../data/raw/2019_10_ActualTotalLoad.xlsx")
data2019_11 <- read_excel("../data/raw/2019_11_ActualTotalLoad.xlsx")
data2019_12 <- read_excel("../data/raw/2019_12_ActualTotalLoad.xlsx")
data2019 <- bind_rows(data2019_1,data2019_2,data2019_3,data2019_4,data2019_5,data2019_6,data2019_7,data2019_8,data2019_9,data2019_10,data2019_11,data2019_12)
print("Extracted 2019 Data")
print(Sys.time() - start_time)
print("")

start_time <- Sys.time()
data1 <- bind_rows(data2014,data2015,data2016,data2017,data2018,data2019)
data1$Date <- as.Date(data1$DateTime)
data1$Time <- format(data1$DateTime, "%H:%M:%S")
data1$Hours <- format(as.POSIXct(data1$DateTime, "%Y-%m-%d %H:%M:%S", tz = ""), format = "%H")
data1$Minutes <- format(as.POSIXct(data1$DateTime, "%Y-%m-%d %H:%M:%S", tz = ""), format = "%M")
data1$Day <- format(as.POSIXct(data1$DateTime, "%Y-%m-%d %H:%M:%S", tz = ""), format = "%d")
data1$Year <- format(as.POSIXct(data1$DateTime, "%Y-%m-%d %H:%M:%S", tz = ""), format = "%Y")
data1$Month <- format(as.POSIXct(data1$DateTime, "%Y-%m-%d %H:%M:%S", tz = ""), format = "%m")
data1 <- data1 %>% mutate(AreaCode = areacode) %>% select(DateTime, Year, Month, Day, Hours, Minutes, AreaName, AreaCode, AreaTypeCode, ResolutionCode, TotalLoadValue)
print("Joined 2014-2019 Data")
print(Sys.time() - start_time)
print("")

start_time <- Sys.time()
#data2020_1 <- read_excel("../data/raw/2020_1_ActualTotalLoad.xlsx")
#data2020_2 <- read_excel("../data/raw/2020_2_ActualTotalLoad.xlsx")
#data2020_3 <- read_excel("../data/raw/2020_3_ActualTotalLoad.xlsx")
#data2020_4 <- read_excel("../data/raw/2020_4_ActualTotalLoad.xlsx")
#data2020_5 <- read_excel("../data/raw/2020_5_ActualTotalLoad.xlsx")
#data2020_6 <- read_excel("../data/raw/2020_6_ActualTotalLoad.xlsx")
#data2020_7 <- read_excel("../data/raw/2020_7_ActualTotalLoad.xlsx")

data2020_01 <- read_excel("../data/raw/2020_01_ActualTotalLoad_6.1.A.xlsx")
data2020_02 <- read_excel("../data/raw/2020_02_ActualTotalLoad_6.1.A.xlsx")
data2020_03 <- read_excel("../data/raw/2020_03_ActualTotalLoad_6.1.A.xlsx")
data2020_04 <- read_excel("../data/raw/2020_04_ActualTotalLoad_6.1.A.xlsx")
data2020_05 <- read_excel("../data/raw/2020_05_ActualTotalLoad_6.1.A.xlsx")
data2020_06 <- read_excel("../data/raw/2020_06_ActualTotalLoad_6.1.A.xlsx")
data2020_07 <- read_excel("../data/raw/2020_07_ActualTotalLoad_6.1.A.xlsx")
data2020_08 <- read_excel("../data/raw/2020_08_ActualTotalLoad_6.1.A.xlsx")
data2020_09 <- read_excel("../data/raw/2020_09_ActualTotalLoad_6.1.A.xlsx")
data2020_10 <- read_excel("../data/raw/2020_10_ActualTotalLoad_6.1.A.xlsx")
data2020_11 <- read_excel("../data/raw/2020_11_ActualTotalLoad_6.1.A.xlsx")
data2020_12 <- read_excel("../data/raw/2020_12_ActualTotalLoad_6.1.A.xlsx")
data2020 <- bind_rows(data2020_01,data2020_02,data2020_03,data2020_04,data2020_05,data2020_06,data2020_07,data2020_08,data2020_09,data2020_10,data2020_11,data2020_12)
print("Extracted 2020 Data")
print(Sys.time() - start_time)
print("")

start_time <- Sys.time()
data2021_01 <- read_excel("../data/raw/2021_01_ActualTotalLoad_6.1.A.xlsx")
data2021_02 <- read_excel("../data/raw/2021_02_ActualTotalLoad_6.1.A.xlsx")
data2021_03 <- read_excel("../data/raw/2021_03_ActualTotalLoad_6.1.A.xlsx")
data2021_04 <- read_excel("../data/raw/2021_04_ActualTotalLoad_6.1.A.xlsx")
data2021_05 <- read_excel("../data/raw/2021_05_ActualTotalLoad_6.1.A.xlsx")
data2021_06 <- read_excel("../data/raw/2021_06_ActualTotalLoad_6.1.A.xlsx")
data2021 <- bind_rows(data2021_01,data2021_02,data2021_03,data2021_04,data2021_05,data2021_06)
print("Extracted 2021 Data")
print(Sys.time() - start_time)
print("")


start_time <- Sys.time()
data2 <- bind_rows(data2020,data2021)
data2$Date <- as.Date(data2$DateTime)
data2$Time <- format(data2$DateTime, "%H:%M:%S")
data2$Hours <- format(as.POSIXct(data2$DateTime, "%Y-%m-%d %H:%M:%S", tz = ""), format = "%H")
data2$Minutes <- format(as.POSIXct(data2$DateTime, "%Y-%m-%d %H:%M:%S", tz = ""), format = "%M")
data2$Day <- format(as.POSIXct(data2$DateTime, "%Y-%m-%d %H:%M:%S", tz = ""), format = "%d")
data2$Year <- format(as.POSIXct(data2$DateTime, "%Y-%m-%d %H:%M:%S", tz = ""), format = "%Y")
data2$Month <- format(as.POSIXct(data2$DateTime, "%Y-%m-%d %H:%M:%S", tz = ""), format = "%m")
data2 <- data2 %>% select(DateTime, Year, Month, Day, Hours, Minutes, AreaName, AreaCode, AreaTypeCode, ResolutionCode, TotalLoadValue)

all_data <- bind_rows(data1,data2)
print("Joined All Data")
print(Sys.time() - start_time)
print("")

filtered_all_data <- all_data %>% 
  filter(AreaTypeCode == "CTY") %>% 
  inner_join(countries, by="AreaCode") %>% 
  mutate(
    AreaName = AreaName.y, 
    Month = as.numeric(Month), 
    Day = as.numeric(Day), 
    Hours = as.numeric(Hours), 
    Minutes = as.numeric(Minutes), 
    Year = as.numeric(Year),
    Date = ymd(glue("{Year}-{Month}-{Day}")),
    dayofweek = ifelse(weekdays(Date) %in% c("Saturday", "Sunday"), 1, 0)) %>% 
  select(DateTime, Year, Month, Day, Hours, dayofweek,
         Minutes, AreaName, ResolutionCode, TotalLoadValue) %>% 
  group_by(Year, Month, Day, Hours, AreaName, dayofweek) %>% 
  summarise(TotalLoadValue = sum(TotalLoadValue))

write.csv(filtered_all_data, "../data/all_data_hourly.csv")
print("Data saved: data/all_data_hourly.csv")

daily_data <- filtered_all_data %>% 
  mutate(Date=Date, Country=AreaName) %>%
  group_by(Date, Country) %>%
  summarise(TotalLoadValue = sum(TotalLoadValue), .groups="drop") %>%
  as_tsibble(index="Date", key="Country")

write.csv(daily_data, "../data/all_data_daily.csv")
print("Data saved: data/all_data_daily.csv")


