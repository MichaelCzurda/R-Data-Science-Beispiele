library(dplyr)

#Im Dataframe “data”" werden beispielhafte tägliche Verkaufszahlen generiert. 
day <- seq(as.Date("2018/01/01"), as.Date("2018/12/31"),"days")
month <- format(day, "%m")
y <- runif(365, 1000, 10000)
data <- data.frame(day,month,y)
#head(data)

agg.data <- data %>% 
  select(month, y) %>%
  group_by(month) %>% 
  summarise(sum = sum(y))
#agg.data

agg.data.false <- data %>% 
  select(month, y) %>%
  group_by(month) %>% 
  summarise(sum = sum(y+1))
#agg.data.false

sum_check <- function(d1,d2){
  if (sum(d1$y)==sum(d2$sum)){
    print("Summierung korrekt")
  } else{
    print("Summierung fehlerhaft")
  }
}
#sum_check(data, agg.data)
#sum_check(data, agg.data.false)
