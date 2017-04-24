# SGS: Bond Price Visualisation #
## This script demonstrates some simple visualisation of raw bond yield and bond price against date

source("https://raw.githubusercontent.com/minerva79/aqlib/master/R/aqCommons.R")
lib()

source("https://raw.githubusercontent.com/minerva79/aqlib/master/R/themes.R")
rm(list=ls()[!ls() %in% "theme_scientific"])


file <- "https://raw.githubusercontent.com/minerva79/woodpecker/master/data/SGS_benchmark_1998_2017.txt"
df <- read.table(file, sep="\t", header=T)
df$date <- as.Date(df$date)

#######################################
## Raw plot: Price against Date
ggplot(df, aes(date, price)) + 
  geom_line(colour="red") + 
  theme_scientific() + 
  scale_x_date(date_breaks = "1 year", date_labels="%y") + 
  labs(y="Price", x="Year")

## Plotting with gam smoother

mod <- gam(price ~ s(as.numeric(date)), data=df)

newdat <- data.frame(date=seq(min(df$date), max(df$date), length=100))
newdat <- augment(mod, newdata=newdat)

ggplot(newdat, aes(date, .fitted)) + 
  geom_point(data=df, aes(y=price), alpha=.2) +
  geom_ribbon(aes(ymin=.fitted-1.96*.se.fit, ymax=.fitted+1.96*.se.fit), alpha=.5) +
  geom_line(colour="red") +
  theme_scientific() + 
  scale_x_date(date_breaks = "1 year", date_labels="%y") +
  labs(y="Price", x="Year")


#######################################
## Dual axis raw plot: yield and price

ggplot(df, aes(date)) + 
  geom_line(aes(y=price, colour="Price")) + 
  geom_line(aes(y=yield*20, colour="Yield")) + 
  scale_y_continuous(sec.axis = sec_axis(~./20, name = "Yield")) +
  labs(y="Price", x= "Year", colour="Type") +
  scale_x_date(date_breaks = "1 year", date_minor_breaks="1 month", date_labels = "%Y") +
  theme_scientific() + theme(legend.position="bottom")