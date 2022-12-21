# Potato Disease Classification Using Convolution Neural Networks

Dataset credits: https://www.kaggle.com/arjuntejaswi/plant-village

## Objective 
Farmers every year face economic loss and crop waste due to various diseases in potato plants.  One of the most important steps in automatic identification of plant diseases is to extract the infected region from the normal portion of the plant. 

<br> Studying the infected leaves it has been observed that the greenness of the infected portion of the leaves changes significantly with respect to the normal leaves. Vegetation indices (VI) are some metric used for the remote sensing images to measure the greenness. Images of potato leaves of both categories healthy and diseased captured with digital camera and resolution of 256x256 pixels forms the dataset. CNN model is used for identifying the health status of plants.<br><br>
In this project, I built a CNN deep learning model using potato plant images. The goal of this model is to classify these images as either healthy or early blight or late blight.  <br> <br>

The goal is to help novice farmers determine if their plants are healthy or need some special attention. If the model can accurately classify an unhealthy plant, then farmers can take the next step to research and determine whether their potatoes are being over/under watered, receiving too much/too little sunlight, etc. <br>

## Methodology
1. Image Pre-processing: <br>
To remove noise in an image, different pre-processing techniques are used. Clipping of leaf image is applied to extract the region of the image in which we are interested. Before we feed our images to network, we should be resizing it to the desired size. Moreover, to improve model performance, we should normalize the image pixel value (keeping them in range 0 and 1 by dividing by 256).  <br><br>
2. Model Architecture:
Classifiers are used to identify and categorize the different diseases that occur on plant leaves based on obtained features. We use a CNN coupled with a Softmax activation in the output layer. We also add the initial layers for resizing, normalization and Data Augmentation. We use adam Optimizer, SparseCategoricalCrossentropy for losses, and accuracy as a metric.


## Technology used:
Model Building: tensorflow, CNN, data augmentation, tf dataset <br>
Backend Server and ML Ops: FastAPI <br>

## Conclusion
* In this study, a pre-trained Convolutional Neural Network was fine-tuned. Most of the time, our model reached the accuracy level of above 80%.
* Build a web application using Flask that showcases the result of the our classification model, so that the plant disease detection can be an automated process.





