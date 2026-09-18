
1.	Implement R program for finding the factorial of a given number.
R program:
# Input from the user
num <- as.integer(readline(prompt = "Enter a number: "))

# Initialize result to 1
result <- 1 

# Calculate factorial using a loop
for (i in 1:num) {
  result <- result * i
}
# Display the result
Print(result) 	  #OR
print(paste("The factorial of", num, "is", result))

2.	Implement R program to read two integers and perform all possible arithmetic operations and display the results.
R program:
# Read two integers from the user
num1 <- as.integer(readline(prompt = "Enter the first integer: "))
num2 <- as.integer(readline(prompt = "Enter the second integer: "))

# Function to perform and display arithmetic operations
perform_operations <- function(num1, num2) {
  sum_result <- num1 + num2
  diff_result <- num1 - num2
  prod_result <- num1 * num2
  
  # Check for division and modulus by zero
  if (num2 != 0) {  div_result <- num1 / num2  } 
else {  div_result <- "Undefined (division by zero)"  }
  # Display the results
  cat("Addition: ", sum_result, "\n")
  cat("Subtraction: ", diff_result, "\n")
  cat("Multiplication: ", prod_result, "\n")
  cat("Division: ", div_result, "\n")
  cat("Modulus: ", mod_result, "\n")
}
# Call the function to perform the operations
perform_operations(num1, num2)

3.	Write R program to create a vector which contains 10 random integer values between -50 and +50. 
R program:

# Create a vector with 10 random integer values between -50 and 50
random_vector <- sample(-50:50, 10, replace = TRUE)

# Display the random vector
cat("Random vector:", random_vector, "\n")

4.	Write R program to create three vectors having numeric data, character data and logical data. Display the content of the vectors and their type.
R program:

# Create a numeric vector
numeric_vector <- c(10, 20, 30, 40, 50)

# Create a character vector
char_vector <- c("apple", "banana", "cherry", "date")

# Create a logical vector
logical_vector <- c(TRUE, FALSE, TRUE, FALSE, TRUE)

# Display the content of the vectors
numeric_vector
char_vector
logical_vector

# Display the type of each vector
cat("Type of Numeric Vector: ", typeof(numeric_vector), "\n")
cat("Type of Character Vector: ", typeof(char_vector), "\n")
cat("Type of Logical Vector: ", typeof(logical_vector), "\n")

5.	Write R program to read CSV file and perform the following preprocessing operations: (a)Display the contents of CSV file. 
(b) Find the missing values in a dataset.
 (c) How to remove missing values in a data set.
R program:
# Load the CSV file
data<- read.csv("C:/Users/admin/Desktop/R1-lab.csv")
print(data)

# Replace empty strings ("") with NA for proper handling of missing values
data[data == ""] <- NA

# (b) Check for missing values (NAs) in the entire dataset
missing_values <- is.na(data)  
missing_values

# Display the number of missing values in each column
print(colSums(missing_values))

# Alternatively, check the total number of missing values in the dataset
total_missing_values <- sum(missing_values)
print(total_missing_values)

# Display rows with missing values
missing_rows <- data[!complete.cases(data), ]
print(missing_rows)
6.	Implement R program to create bell curve of a random normal distribution for a given data.
EX-1:
set.seed(123)
random_data=rnorm(1000,mean=50,sd=10)
hist(random_data,
     probability = TRUE,
     col = "green",
     main = "Bell Curve of Random Normal Distribution",
     xlab = "Values",
     ylab = "Density")
curve(dnorm(x, mean = mean(random_data), sd = sd(random_data)),
      col = "red",
      add = TRUE)
EX-2: 
set.seed(123)
data=rnorm(1000,mean=0.2,0.05)
hist(data,
     probability = TRUE,
     col = "pink",
     main = "Bell Curve of Random Normal Distribution",
     xlab = "Values",
     ylab = "Density")
curve(dnorm(x, mean = mean(data), sd = sd(data)),
      col = "blue",
      add = TRUE)
