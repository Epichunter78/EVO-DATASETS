setwd("C:/Users/yusuf/Desktop/STU/FINALE")
library(tidyverse)

lineup <- read.csv("EVO - Annual Game Lineup Counts.csv", TRUE, ",")
participants <- read.csv("EVO - Annual Participants.csv", TRUE, ",")
franchiseInclusionCounts <- read.csv("EVO - Franchise Inclusion Counts.csv", TRUE, ",")
playersWithConsecutiveWins <- read.csv("EVO - Players with Consecutive Wins.csv", TRUE, ",")



barplot <- ggplot(lineup, aes(x = Year, y = Games, fill = Year, group=1))+
  #geom_bar(stat = "identity")+
  guides(color = guide_legend(override.aes = list(fill = Year)))+
  #scale_fill_identity()+
  scale_x_continuous(breaks=function(x) pretty(x, n=20))+
  scale_y_continuous(breaks=function(x) pretty(x, n=10))+
  theme(plot.title = element_text(hjust = 0.5)) +
  labs(x = "Year", title = "Number of Games Per Year")+
  scale_color_manual(values = colors)
barplot 
ggsave("EVOBarPlot.png")


lineplot <- ggplot(participants, aes(Year, Players, group=2))+
  geom_line(colour = "red")+
  theme(plot.title = element_text(hjust = 0.5)) +
  labs(x = "Year", y = "No. of Players", 
       title = "Annual EVO Participants (1996-2011 are an Estimated Average)")
lineplot
ggsave("EVOLinePlot.png")

scatterplot <- ggplot(playersWithConsecutiveWins, aes(colour=Player, Wins, Player, group=2))+
  geom_point()+
  theme(plot.title = element_text(hjust = 0.5)) +
  labs(x = "Wins", y = "Player", 
       title = "Consequtive EVO Champions")
scatterplot
ggsave("EVOScatterPlot.png")


library(scales)
library(ggplot2)
library(ggrepel)

blank_theme <- theme_minimal()+
  theme(
    axis.title.x = element_blank(),
    axis.title.y = element_blank(),
    panel.border = element_blank(),
    panel.grid=element_blank(),
    axis.ticks = element_blank(),
    plot.title=element_text(size=15, face="bold")
  )


piechart<- ggplot(franchiseInclusionCounts, aes(x = "", y = TimesFeatured, fill = Series)) +
  geom_col(color = "black") +
  geom_label(aes(label = TimesFeatured),
             color = "white",
             position = position_stack(vjust = 0.5),
             show.legend = FALSE) +
  coord_polar(theta = "y")+
  labs(x = "", y = "", 
       title = "Times Each Series Has Been In EVO's Main Lineup")
piechart

ggsave("EVOPieChart.png")



