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