
# Topic Modelling on NIPS Papers
An Original DataCamp Project by Lars Hulstaert. <br>
<br>

## NIPS
Neural Information Processing Systems (NIPS) is one of the top machine learning conferences in the world. As one of the most prestigious yearly events in the machine learning community, the NIPS conference (Neural Information Processing Systems) is a place that a large number of research papers are published each year. Over 50,000 PDF files were automatically downloaded and processed to obtain a dataset on various machine learning techniques. These papers discuss a wide variety of topics in machine learning, from neural networks to optimization methods and many more.
<br>

## Objective
Goal: Find Hottest Topics in ML
Analysis of a NIPS papers data set using LDA. Use Natural Language Processing on NIPS research papers from the past decade to discover the latest trends in machine learning research. The techniques used here to handle large amounts of data can be applied to other text datasets as well.
<br> <br>
Dataset: Over 50,000 NIPS papers are stored in datasets/papers.csv. The CSV file contains information on the different NIPS papers that were published from 1987 until 2017.
<Br>Columns: id, year, title, event_type, pdf_name, abstract, paper_text
<br>
  
## Logics Behind
Topic modeling is a method for unsupervised classification of documents, similar to clustering on numeric data, which finds groups of items (topics). 
LDA is one of the most popular topic modeling methods. Each document is made up of various words, and each topic also has various words belonging to it. The aim of LDA is to find topics a document belongs to, based on the words in it.
In order to perform LDA, we need to 1) filter and simplify the dataset for analysis, 2) preprocess and transform text data into numerical values which our models can consume.

<br> 
## Process
1. Loading the NIPS papers 
2. Preparing the data for analysis by dropping unnecessary columns, and observing the current data shape by making a plot.
3. Preprocessing the text data by removing special characters, lowering characters, and creating a word cloud (visual representation of the most common words) to verify whether the preprocessing happened correctly.
4. Prepare the text for LDA analysis: Use Count Vectorizer to transform the titles into a vector.
5. Analysing trends with LDA
