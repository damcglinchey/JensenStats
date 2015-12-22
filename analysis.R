## Data Analysis of bab Jensen guesses

## Read in the data from file
data <- read.csv("data.csv", strip.white=TRUE)

## Turn Birthdate guesses into dates
data$Birthdate.Guess <- as.Date(data$Birthdate.Guess, "%m/%d/%Y")

## Weight as numeric in [lb] (1 lb = 16 oz)
lbs <- as.numeric(sub("lb","",regmatches(data$Weight, gregexpr("[[:digit:]]+lb", data$Weight))))
ozs <- as.numeric(sub("oz","",regmatches(data$Weight, gregexpr("[[:digit:]]+oz", data$Weight))))
lbs[is.na(lbs)] <- 0
ozs[is.na(ozs)] <- 0
ozs <- ozs / 16
w <- lbs + ozs
data$Weight <- w

## Length as numeric in [in]
l <- regmatches(data$Length,gregexpr("[[:digit:]]+\\.*[[:digit:]]*",data$Length))
data$Length <- as.numeric(l)


## Plot the relative frequency of gender
ggender <- ggplot(data) + 
    geom_histogram(aes(x=data$Gender, y=..count../sum(..count..)), fill="steelblue") + 
    ylim(0, 1) + 
    labs(title = paste(length(data$Gender),"Total Guesses")) + 
    labs(x="Gender",y="Fraction of Total Guesses") + 
    theme_bw()

ggsave(filename = "gender.png", 
       plot = ggender,
       width=4.0, height=4.0,
       units="in")

## Plot the birthdate
gdate <- ggplot(data) + 
    geom_histogram(aes(x=data$Birthdate.Guess), 
                   fill = "steelblue", binwidth = 1) + 
    xlim(as.Date("2016-1-1"), as.Date("2016-2-15")) +
    labs(x="Birth Date") +
    labs(title = paste(length(data$Gender),"Total Guesses")) + 
    geom_vline(xintercept=as.numeric(as.Date("2016-1-24")), 
               linetype = "dashed", size = 1, color = "red") +
    annotate("text", x=as.Date("2016-2-15"), y=5.5, hjust=1,
             label="Due Date: 2016-01-24", color="red", size=3) +
    annotate("text", x=as.Date("2016-2-15"), y=5.0, hjust=1,
             label=paste("Mean Guess: ", mean(data$Birthdate.Guess)), 
             color="steelblue", size=3) +
    annotate("text", x=as.Date("2016-2-15"), y=4.5, hjust=1,
             label=paste("Median Guess: ", median(data$Birthdate.Guess)), 
             color="steelblue", size=3) +
    annotate("text", x=as.Date("2016-2-15"), y=4.0, hjust=1,
             label=paste("Mode: ", names(tail(sort(table(data$Birthdate.Guess)),1))),
             color="steelblue", size=3) + 
    theme_bw()

ggsave(filename = "date.png",
       plot = gdate,
       width=6.0, height=4.0,
       units="in")

## Plot the Weight
gweight <- ggplot(data) + 
    geom_histogram(aes(x=data$Weight), 
                   fill = "steelblue", binwidth = 0.2) + 
    xlim(5, 20) +
    labs(x="Weight [lb]") +
    labs(title = paste(length(data$Gender),"Total Guesses") ) + 
    annotate("text", x=10, y=9, hjust=0,
             label=paste("Mean:", round(mean(data$Weight, na.rm=TRUE), digits=2)),
             color="steelblue", size=3) +
    annotate("text", x=10, y=8.5, hjust=0,
             label=paste("Median:", round(median(data$Weight, na.rm=TRUE), digits=2)),
             color="steelblue", size=3) +
    annotate("text", x=10, y=8.0, hjust=0, 
             label=paste("Mode:", 
                         names(table(data$Weight))[table(data$Weight) == max(table(data$Weight))]),
             color="steelblue", size=3) +
    annotate("text", x=10, y=7.5, hjust=0,
             label=paste("Std. Dev.:", round(sd(data$Weight, na.rm=TRUE), digits=2)),
             color="steelblue", size=3) +
    theme_bw()

ggsave(filename = "weight.png",
       plot = gweight,
       width=6.0, height=4.0,
       units="in")

## Plot the length
glength <- ggplot(data) + 
    geom_histogram(aes(x=data$Length), 
                   fill = "steelblue", binwidth = 0.5) + 
    xlim(10, 25) +
    labs(x="Length [in]") +
    labs(title = paste(length(data$Gender),"Total Guesses")) + 
    annotate("text", x=10, y=9, hjust=0,
             label=paste("Mean:", round(mean(data$Length, na.rm=TRUE), digits=2)),
             color="steelblue", size=3) +
    annotate("text", x=10, y=8.5, hjust=0,
             label=paste("Median:", round(median(data$Length, na.rm=TRUE), digits=2)),
             color="steelblue", size=3) +
    annotate("text", x=10, y=8.0, hjust=0, 
             label=paste("Mode:", 
                         names(table(data$Length))[table(data$Length) == max(table(data$Length))]),
             color="steelblue", size=3) +
    annotate("text", x=10, y=7.5, hjust=0,
             label=paste("Std. Dev.:", round(sd(data$Length, na.rm=TRUE), digits=2)),
             color="steelblue", size=3) +
    theme_bw()

ggsave(filename = "length.png",
       plot = glength,
       width=6.0, height=4.0,
       units="in")
