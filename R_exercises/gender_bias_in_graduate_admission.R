
''' Following the tutorial on Datacamp Exercise '''

#1. Load UCBAdmissions dataset
# the dataset is included in base R.

data("UCBAdmissions")

# Print dataset to console
print(UCBAdmissions)

# Load broom package
library(broom)

# Convert UCBAdmissions to tidy format
ucb_tidy <- tidy(UCBAdmissions)

# Print tidy dataset to console
print(ucb_tidy)

# 2. Acceptance rate for men and women
# The data is more readable now that it is in tidy format, but – since it is split by department and displays raw counts – it is difficult for us to infer any kind of gender bias. 
#To do that, we need to aggregate over department and ask ourselves, overall, what proportion of men and women were accepted into Berkeley in 1973.

#calculate the overall acceptance rate for men and women

# Load the dplyr library
library(dplyr)

# Aggregate over department
ucb_tidy_aggregated <- ucb_tidy %>% 
  group_by(Admit, Gender) %>% 
  summarize(n = sum(n)) %>% 
  ungroup() %>% 
  group_by(Gender) %>% 
  mutate(prop = n / sum(n)) %>% 
  filter(Admit == "Admitted")

# Print aggregated dataset
print(ucb_tidy_aggregated)

#3. Visualizing Discrepancy
# From the previous task, we can see that 44.5% of male applicants were accepted into Berkeley, as opposed to 30.4% of female applicants. 
# Did Berkeley's graduate admissions department really discriminate against women that year?

# Load the ggplot2 and scales packages
library(ggplot2)
library(scales)

# Prepare the bar plot
gg_bar <- ucb_tidy_aggregated %>% 
  ggplot(aes(x = Gender, y = prop, fill = Gender)) +
  geom_col() +
  geom_text(aes(label = percent(prop)), vjust = -1) +
  labs(title = "Acceptance rate of male and female applicants",
       subtitle = "University of California, Berkeley (1973)",
       y = "Acceptance rate") +
  scale_y_continuous(labels = percent, limits = c(0, 0.5)) +
  guides(fill = FALSE)

# Print the bar plot
print(gg_bar)

#4. Acceptance Rate by Department

# Calculate acceptance/rejection rate
ucb_by_dept <- ucb_tidy %>% 
  group_by(Gender, Dept) %>% 
  mutate(prop = n / sum(n)) %>% 
  filter(Admit == "Admitted")

# Print the dataset
print(ucb_by_dept)

# Prepare the bar plot for each department
gg_bar_faceted <- ucb_by_dept %>% 
  ggplot(aes(Gender, prop, fill = Gender)) +
  geom_col() +
  geom_text(aes(label = percent(prop)), vjust = -1) +
  labs(title = "Acceptance rate of male and female applicants",
       subtitle = "University of California, Berkeley (1973)",
       y = "Acceptance rate") +
  scale_y_continuous(labels = scales::percent, limits = c(0, 1)) +
  facet_wrap(~Dept) +
  guides(fill = FALSE)

# Print the bar plot for each department
print(gg_bar_faceted)

#5. 

"""
Although men were indeed more likely to be admitted into Departments C and E, 
women were more likely to be admitted into all other departments. 
Department A and B were quite easy to get into. However, relatively few women applied to these departments – only 108 women applied to Department A, as opposed to 825 men!
At this stage, we can hypothesise that the effect of gender on acceptance is null when you control for department. 
We can test that hypothesis using binary logistic regression, but first we need to de-aggregate the dataset so that each row represents one student. 
That should leave us with 4,526 rows – one row for each student who applied to Berkeley that year.
"""

# De-aggregate the dataset so that each row represents one student.

# Define function that repeats each row in each column n times
multiply_rows <- function(column, n) {
  rep(column, n)
}

# Create new de-aggregated data frame using the multiply_rows function
ucb_full <- data.frame(Admit = multiply_rows(ucb_tidy$Admit, ucb_tidy$n),
                       Gender = multiply_rows(ucb_tidy$Gender, ucb_tidy$n),
                       Dept = multiply_rows(ucb_tidy$Dept, ucb_tidy$n))

# Check the number of rows equals the number of students
nrow(ucb_full) == 4526

ucb_full
# 6. Run a binary logistic model that predicts admission as a function of GENDER alone.

'''
use the built-in glm() function to fit a generalised linear model, making sure to set family = "binomial" because the outcome variable is binary (Admitted or Rejected).
By default, Admit is coded such that Admitted is level 1 and Rejected is level 2 (because of their alphabetical order). Since glm() will assume that level 2 represents 'success', we will reverse the coding of Admit so we are predicting the probability of admittance rather than rejection.
To change the coding of a variable, you can use the fct_relevel() function from the forcats package.
'''

# Load the forcats library
library(forcats) #provide a suite of tools that solve common problems with factors, including changing the order of levels or the values.

# Reverse the coding of the Admit variable
ucb_full$Admit <- fct_relevel(ucb_full$Admit, "Rejected", "Admitted")
ucb_full$Admit

# Run the regression
glm_gender <- glm(Admit ~ Gender, data = ucb_full, family = "binomial")
## The variable on the left-hand side of tilde operator is the dependent variable and the variable on the right-hand side of tilde operator is the independent variable.


# Run a binary logistic model that predicts admission as a function of both gender and department.

# Run the regression, including Dept as an explanatory variable
glm_genderdept <- glm(Admit ~ Gender + Dept, data = ucb_full, family = "binomial")

# Summarize the results
summary(glm_genderdept)
'''
We hypothesised that the effect of gender on acceptance is null when you control for department.
(NB: The null hypothesis is usually "no effect", unless something else is specified).
As departmental effect is not statistically significant (p > 0.05), we conclude that there was not a campus-wide bias against applicants of either gender in 1973.
'''



#8. Run a binary logistic model that predicts admission as a function of gender, for Department A only.
# Filter for Department A
dept_a <- ucb_full %>% 
  filter(Dept == "A")

# Run the regression
glm_gender_depta <- glm(Admit ~ Gender, data = dept_a, family = "binomial")

# Summarize the results
summary(glm_gender_depta)
# for dept A, we find there is a statistically significant bias in favour of women.
# However, since we do not have any data on the respective qualifications of the candidates, we cannot say whether any gender bias in their admissions process amounted to discrimination.


# 9. Bias / Discrimination

# Define bias
bias <- "a pattern of association between a particular decision and a particular sex of applicant, of sufficient strength to make us confident that it is unlikely to be the result of chance alone"

# Define discrimination
discrimination <- "the exercise of decision influenced by the sex of the applicant when that is immaterial to the qualifications for entry"

# Does bias equal discrimination?
bias == discrimination

'''
In conclusion, this graduate admission (at UCB, 1973) case is a useful reminder about 
the dangers of aggregation and omitted variable bias, especially in relation to matters of such legal and ethical importance as discrimination. 
Where bias does exist – as it does in the case of Department A – it is always worth considering whether there are any other factors that could explain the discrepancy. '''

#hello!