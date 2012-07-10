# usa.data is the set with degree fields added, I now realize that it's confusingly
# similar to the previous dataset, but I'll remember that in the future
usa.data <- read.csv("usa_00005.csv")
# it seems that trying to manipulate the sample size doesn't really work in IPUMS. 

# I tried 2000 people, but it automatically went to 22k, 
  # so I tried 25 to see what happened. For some reason I have only 916 obs. 

# This is something to look into. 

names(usa.data)
table(usa.data$SEX)
# In IPUMS 1 = Male, 2 = Female, created factor "sex" using those values
usa.data$sex <- factor(usa.data$SEX, labels = c("man", "woman"))
# Now for state, where in IPUM, 27 = MN, 55 = WI
usa.data$state <- factor(usa.data$STATEFIP, labels = c("mn", "wi"))
# Now for education, college.number = number of years of college edu.
#                    grade.number = last complete grade of grade school
# The question is, how detailed should we be? Is it ok to aggregate to a certain
# level, for example, have "less than high school" "some high school" "high school"
# "some college" "college" "more than college," as supposed to 12 dif. categories
# like below:

usa.data$edu <- factor(usa.data$EDUC)
levels(edu) = c("NA", "grade.four.or.less", "grade.five.eight", 
"grade.nine", "grade.eleven", "grade.ten", "grade.twelve", "college.one", 
"college.two", "college.four", "college.fiveplus")

# Since this is a complex factor, I spent some time comparing the data with 
# the factor to make sure all the values matched up correctly.

# Now for the degree of field. I'm going to use the less detailed version with
# *only* 38 categories. My only concern is that there will be so many levels in
# the factor that it'll be hard to keep track of all of them. 

degreefield <- factor(usa.data$DEGFIELD)
levels(degreefield) = c("NA", )