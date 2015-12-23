# JensenStats

This repository presents a study of the baby Jensen guessing pool.

Participants were asked to predict the gender, birthday, weight, and length of baby Jensen. Prior knowledge included the due date (24 Jan 2015). 

### Description of data

- Name: first and last name
- Birthdate.Guess: Birthday 
- Gender: Boy or Girl
- Weight: in lbs
- Length: in inches

### Data manipulation

- Name: No change from input
- Birthdate.Guess: Change to class "Date" using `as.Date()`
- Gender: No change from input
- Weight: Parse string and form double in lbs
- Length: Parse string and form double in inches

No entries are removed. Any missing entry entered as `NA`.

### Data summary

- Total entries: 48
- Boy: 32 (67%), Girl: 16 (33%)

|     Data     | Mean(All) | Mean(Boy) | Mean(Girl) |
|--------------|-----------|-----------|------------|
| Birthday     | 2016-1-24 | 2016-1-26 | 2016-1-20  |
| Weight [lbs] | 8.77      | 8.97      | 8.35       |
| Length [in]  | 19.37     | 19.11     | 19.86      |

Birthdate plotted separated by Gender:
![Birthdate](https://github.com/damcglinchey/JensenStats/blob/master/date_gender.png)

Weight plotted separated by Gender:
![Weight](https://github.com/damcglinchey/JensenStats/blob/master/weight_gender.png)

Length plotted separated by Gender:
![Length](https://github.com/damcglinchey/JensenStats/blob/master/length_gender.png)