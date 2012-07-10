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
sex <- factor(usa.data$SEX, labels = c("man", "woman"))
# Now for state, where in IPUM, 27 = MN, 55 = WI
state <- factor(usa.data$STATEFIP, labels = c("mn", "wi"))
# Now for education
edu <- factor(usa.data$EDUC), labels = c("college.one", "grade.four.or.less", 
+ "grade.twelve", "college.five.plus" "grade.five.eight," "college.four", 
+ "grade.nine" "NA", )