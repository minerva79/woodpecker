source("https://raw.githubusercontent.com/minerva79/aqlib/master/R/aqCommons.R")
lib()

source("https://raw.githubusercontent.com/minerva79/aqlib/master/R/themes.R")
rm(list=ls()[!ls() %in% "theme_scientific"])

filename <- "https://raw.githubusercontent.com/minerva79/woodpecker/master/data/day_minmax_sg_11_17.txt"
df <- read.table(filename, sep="\t", header=T)

###########################
## Summarising daily min-max weather data into Year-month data

df$mmyy <- substring(as.character(df$Date), 1, 7)
df <- df %>% select(Station, mmyy, Max_TemperatureC:CloudCover) %>% group_by(Station, mmyy) %>% summarise_each(funs(mean))
df <- df %>% mutate(date = as.Date(paste0(as.character(mmyy), "-01"), "%Y-%m-%d"))


###########################
## Visualising as line (mean parameter) + ribbon (min and max parameter) plot

plotFn <- function(ymin, ymax, ymean){
  ggplot(df, aes(x=date)) + 
    geom_ribbon(aes_string(ymax=ymax, ymin=ymin), alpha=0.5) +
    geom_line(aes_string(y=ymean))
}

var <- c("TemperatureC", "Humidity", "Sea_Level_PressurehPa")
var_list <- lapply(var, function(x)list(paste0("Min_", x), paste0("Max_", x), paste0("Mean_", x)) %>% setNames(c("ymin", "ymax", "ymean")))
p <- lapply(var_list, function(x) do.call(plotFn, x))

ylabels <- c("Air Temperature [°C]", "Humidity [%]", "Sea Level Pressure [hPa]")

lapply(seq(length(p)), function(x){
  p[[x]] +  facet_wrap(~Station) + theme_scientific() + scale_x_date(date_breaks = "1 year", date_minor_breaks="1 month", date_labels = "%Y") + labs(y=ylabels[x],  x= "Year")
})


############################
## Dual axis-facet plot of temperature against humidity


ggplot(df, aes(date)) + 
  geom_line(aes(y=Mean_TemperatureC, colour="Temperature")) + 
  geom_line(aes(y=Mean_Humidity/3, colour="Humidity")) + 
  scale_y_continuous(sec.axis = sec_axis(~.*3, name = "Humidity [%]")) +
  labs(y="Air Temperature [°C]", x= "Date", colour="Parameters") +
  scale_x_date(date_breaks = "1 year", date_minor_breaks="1 month", date_labels = "%Y") +
  theme_scientific() + theme(legend.position="bottom") + facet_wrap(~Station) + 
  scale_color_brewer(palette="Set1")