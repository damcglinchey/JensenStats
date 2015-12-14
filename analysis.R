## Data Analysis of bab Jensen guesses

## Read in the data from file
data <- read.csv("data.csv")

## Plot the relative frequency of gender
ggender <- ggplot(data) + 
    geom_histogram(aes(x=data$Gender, y=..count../sum(..count..)), fill="steelblue") + 
    labs(title = paste(length(data$Gender),"Total Guesses")) + 
    labs(x="Gender",y="Fraction of Total Guesses") + 
    theme_bw()

ggsave(filename = "gender.png", 
       plot = ggender,
       width=4.0, height=4.0,
       units="in")