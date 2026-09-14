library(readxl)
library(ggplot2)
setwd("D:/R")
getwd()
data= read_excel("Copy of sleep_health_lifestyle_dataset (2).xlsx")
names(data)
dim(data)
str(data)
summary(data)
colSums(is.na(data))
sapply(data,class)

# descriptive statistics

Table1=data.frame(
  Variable=c("Sleep Duration","Sleep Quality","Stress Level","Physical activity"),
  Mean=c(
    mean(data$`Sleep Duration (hours)`),
    mean(data$`Quality of Sleep (scale: 1-10)`),
    mean(data$`Stress Level (scale: 1-10)`),
    mean(data$`Physical Activity Level (minutes/day)`)
  ),
  Median=c(
    median(data$`Sleep Duration (hours)`),
    median(data$`Quality of Sleep (scale: 1-10)`),
    median(data$`Stress Level (scale: 1-10)`),
    median(data$`Physical Activity Level (minutes/day)`)
  ),
  SD=c(
    sd(data$`Sleep Duration (hours)`),
    sd(data$`Quality of Sleep (scale: 1-10)`),
    sd(data$`Stress Level (scale: 1-10)`),
    sd(data$`Physical Activity Level (minutes/day)`))
  )


Table1

#frequency analysis

table(data$Gender)
table(data$`BMI Category`)
table(data$`Sleep Disorder`)


View(aggregate(`Sleep Duration (hours)`~Occupation,data=data,mean))
View(aggregate(`Daily Steps`~Gender,data=data,mean))


Table2=data.frame(
  Variables=c(
    "Age vs Sleep Quality",
    "Stress vs Sleep Quality",
    "Physical Activity vs Sleep Duration",
    "Daily Steps vs Sleep Duration "
  ),
  Correlation=c(
    cor(data$Age,
        data$`Quality of Sleep (scale: 1-10)`),
    
    cor(data$`Stress Level (scale: 1-10)`,
        data$`Quality of Sleep (scale: 1-10)`),
    
    cor(data$`Physical Activity Level (minutes/day)`,
        data$`Sleep Duration (hours)`),
    
    cor(data$`Daily Steps`,
        data$`Sleep Duration (hours)`)
  )
)

Table2



# Data visualization

ggplot(data,aes(x=`Sleep Duration (hours)`))+
  geom_histogram(binwidth=0.5,fill="skyblue",color="black")+
  labs(
    title="Distribution of Sleep Duration",
    x="Sleep Duration (hours)",
    y="Frequency"
  )

ggplot(data,aes(x=`Quality of Sleep (scale: 1-10)`))+
  geom_histogram(binwidth=1,fill="lightgreen",color="black")+
  labs(
    title="Distribution of Sleep Quality",
    x="Sleep Quality",
    y="Frequency"
  )

ggplot(data,aes(x=`Sleep Disorder`,fill=`Sleep Disorder`))+
  geom_bar()+
  labs(
    title="Distribution of Sleep Disorders",
    x="Sleep Disorder",
    y="Frequency"
  )

ggplot(data,aes(x=Occupation,fill=Occupation))+
  geom_bar()+
  labs(
    title="Distribution of Occupation",
    x="Occupation",
    y="Frequency"
  )

ggplot(data,aes(x=Gender,
                y=`Quality of Sleep (scale: 1-10)`,
                fill=Gender))+
  geom_boxplot()+
  labs(
    title="Sleep Quality by Gender",
    x="Gender",
    y="Sleep Quality"
  )

ggplot(data,aes(x=Gender,
                y=`Physical Activity Level (minutes/day)`,
                fill=Gender))+
  geom_boxplot()+
  labs(
    title="Physical Activity Level by Gender",
    x="Gender",
    y="Physical Activity (minutes/day)"
  )

ggplot(data,aes(x=Gender,
                y=`Stress Level (scale: 1-10)`,
                fill=Gender))+
  geom_boxplot()+
  labs(
    title="Stress Level by Gender",
    x="Gender",
    y="Stress Level"
  )

ggplot(data,aes(x=`BMI Category`,
                y=`Physical Activity Level (minutes/day)`,
                fill=`BMI Category`))+
  geom_boxplot()+
  labs(
    title="Physical Activity Level by BMI",
    x="BMI Category",
    y="Physical Activity (minutes/day)"
  )

ggplot(data,aes(x=Age,
                y=`Quality of Sleep (scale: 1-10)`))+
  geom_point(color="blue")+
  geom_smooth(method="lm")+
  labs(
    title="Age and Quality of sleep",
    x="Age",
    y="Sleep Quality"
  )

ggplot(data,aes(x=`Physical Activity Level (minutes/day)`,
                y=`Sleep Duration (hours)`))+
  geom_point(color="red")+
  geom_smooth(method="lm")+
  labs(
    title="Physical Activity Level and Sleep Duration",
    x="Physical Activity Level",
    y="Sleep Duration (hours)"
  )


ggplot(data,aes(x=`Daily Steps`,
                y=`Sleep Duration (hours)`))+
  geom_point(color="black")+
  geom_smooth(method="lm")+
  labs(
    title="Daily Steps and Sleep Duration",
    x="Daily Steps",
    y="Sleep Duration (hours)"
  )


