# Iris Species Prediction Web Application

This project is a web application developed using the R language and the Shiny framework. It utilizes the random forest algorithm to predict the species of the Iris flower based on input features. The Iris dataset is a popular dataset in machine learning, which contains measurements of four features of Iris flowers: sepal length, sepal width, petal length, and petal width. The goal of this application is to provide an interactive interface for users to input these measurements and obtain predictions for the corresponding Iris species.
## -- https://prime-rog.shinyapps.io/Iris_predicter/
## Getting Started

To get started with this project, you'll need to have R and RStudio installed on your machine. Follow the steps below to set up and run the application locally.

1. **Clone the repository:**
   ```
   git clone https://github.com/prime-rog/Iris_predicition/
   ```

2. **Navigate to the project directory:**
   ```
   cd iris-species-prediction
   ```

3. **Install dependencies:**
   Open the project in RStudio and run the following command in the R console to install the required packages:
   ```R
   install.packages(c("shiny", "randomForest", "shinythemes"))
   ```

4. **Run the application:**
   In RStudio, open the `app.R` file located in the project directory. Click the "Run App" button in the top right corner of the editor or use the shortcut `Ctrl + Shift + Enter` (Windows/Linux) or `Cmd + Shift + Enter` (Mac) to launch the application in a new window.

5. **Interact with the application:**
   Once the application is running, you can access it in your web browser at `http://127.0.0.1:port`, where `port` is the port number displayed in the RStudio console. Use the provided input fields to enter the measurements of the Iris flower, and click the "Predict" button to obtain the predicted species.

## Project Structure

The project structure is organized as follows:

- `app.R`: This is the main file that contains the Shiny application code. It defines the user interface (UI) and the server logic for handling user inputs and generating predictions.

## Dataset

The Iris dataset used in this project is included within the `datasets` package in R. It can be accessed using the following code:

```R
library(datasets)
iris <- datasets::iris
```

## Random Forest Model

The random forest algorithm is implemented using the `randomForest` package in R. The model is trained on the Iris dataset to predict the species based on the four input features. The trained model is then used in the Shiny application to make predictions.

## Contributing

Contributions to this project are welcome. If you find any issues or would like to suggest enhancements, please create a new issue in the GitHub repository. Additionally, you can submit pull requests with proposed changes.


## Acknowledgments

Special thanks to the creators and maintainers of the `shiny` and `randomForest` packages, which were instrumental in the development of this web application.

If you have any questions or need further assistance, please don't hesitate to reach out. Happy predicting!
