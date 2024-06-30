# Load necessary libraries
library(ggplot2)

# Load the data
birth_rate_data <- read.csv("birth-rate.csv")

# Creating a histogram for the year 2008
ggplot(birth_rate_data, aes(x=`X2008`)) +
  geom_histogram(binwidth=1, fill="skyblue", color="black") +
  labs(title="Histogram of Birth Rates in 2008", x="Birth Rate per 1000 People",
       y="Number of Countries") +
  theme_minimal()


# Creating a histogram for the year 2008
ggplot(birth_rate_data, aes(x=`2008`)) +
  geom_histogram(binwidth=1, fill="skyblue", color="black") +
  labs(title="Histogram of Birth Rates in 2008", x="Birth Rate per 1000 People",
       y="Number of Countries") +
  theme_minimal()

# Check columns
print(colnames(birth_rate_data))

# If the column is not named as expected, you might need to fix the column names
# For example, if the column name includes spaces or additional characters, you might need to adjust it:
# names(birth_rate_data)[names(birth_rate_data) == ' 2008'] <- '2008'


# Load necessary library
library(ggplot2)

# Load the data
crime_rate_data <- read.csv("crimeratesbystate-formatted.csv")

# Creating a box plot for robbery rates
ggplot(crime_rate_data, aes(y=robbery, x=factor(1))) +  # factor(1) to treat all data as a single group
  geom_boxplot(fill="lightblue", color="black") +
  labs(title="Box Plot of Robbery Rates Across States", x="", y="Robbery Rate per 100,000 People") +
  theme_minimal()


# Load necessary libraries
library(ggplot2)
library(dplyr)

# Load the data
education_data <- read.csv("education.csv")

# Add a target dropout rate
education_data$target_dropout_rate <- 6  # Setting the target dropout rate to 6%

# Create a bullet chart equivalent
ggplot(education_data) +
  geom_bar(aes(x=state, y=dropout_rate, fill=(dropout_rate <= target_dropout_rate)), 
           stat="identity", color="black") +
  geom_hline(yintercept=6, color="red", linetype="dashed") +
  labs(title="Comparison of Actual Dropout Rates to Target", x="State", y="Dropout Rate (%)") +
  scale_fill_manual(values=c("TRUE"="green", "FALSE"="red")) +
  theme_minimal() +
  theme(axis.text.x = element_text(angle = 90, hjust = 1))


# Load necessary library
library(ggplot2)
library(reshape2)

# Load the data
crime_rate_data <- read.csv("crimeratesbystate-formatted.csv")

# Melt the data for better handling in ggplot
crime_rate_melted <- melt(crime_rate_data, id.vars = "state", variable.name = "Crime_Type", value.name = "Rate")

# Creating side-by-side box plots for different crime types
ggplot(crime_rate_melted, aes(x=Crime_Type, y=Rate, fill=Crime_Type)) +
  geom_boxplot() +
  labs(title="Box Plot of Different Crime Rates Across States", x="Type of Crime", y="Rate per 100,000 People") +
  theme_minimal() +
  theme(axis.text.x = element_text(angle=45, hjust=1))

# Load necessary libraries
library(ggplot2)
library(hexbin)

# Load the data
education_data <- read.csv("education.csv")

# Creating a hexbin plot for SAT Reading vs. SAT Math scores
ggplot(education_data, aes(x=reading, y=math)) +
  geom_hex(bins=30) +
  labs(title="Hexbin Plot of SAT Math vs. SAT Reading Scores",
       x="SAT Reading Scores", y="SAT Math Scores") +
  scale_fill_gradient(low="blue", high="red") +
  theme_minimal()

install.packages("hexbin")