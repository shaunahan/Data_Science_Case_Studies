# Age-Prediction-Model

Classroom Data Science and Machine Learning is mostly limited to prediction problems where we have explicit knowledge of the ground truth (a.k.a. the Target variable) for some portion of the dataset. However, at work, we constantly deal with prediction tasks with little (via. some proxy) to no ground truth availability.

One such scenario is the task of predicting how long as a person been in the workforce, where the age of the user provides a fair enough proxy. Since we make use of public LinkedIn profile data (and if you've noticed, LinkedIn does not expose age or year of birth of users in public profile view), we completely rely on predicting a user's age using factors including the positions they have held (and when, if available), the degrees they have obtained (and when, if available) et cetera.

Given the fact that we deal with data in the order of hundreds of gigabytes, we try to offload as many of the tasks as possible to be performed within the database itself...wherein comes into play the importance of being extremely comfortable with data engineering concepts along with that of data science for this role.

This assignment will try to test your proficiency in both data modeling and engineering with the task of trying to predict the age of a user with the given data. 

Task:

Your aim is to try and predict user age using the variables available in the following three tables:

positions: This contains the information about the jobtitle and it's `startdate` and `enddate` for 100,000 distinct users, where each user is identified by their `user_id`.

education: This contains, for the same users as that in the positions table, information about their `major`, `startdate` and `enddate`.

jobtitle_seniority: This contains, for the same users as that in the positions table, extra information about the `jobtitle` and the `seniority` level of that job for each user


To create your own ground truth, you are supposed to choose some fraction of users and find their age directly using the available data. It is up to you to determine which users will become a part of your training dataset and how many. Of course, you are expected to defend your resoning behind it.

Final answer to this part should be a pandas dataframe with the following columns: user_id age true_or_predicted where the last column indicates whether that user was a part of your training set and you 'pre-determined' their age or their age is what is predicted by your model.
