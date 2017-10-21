# Welcome to Journalism/Interactive 2017, an introduction to data analysis and visualization in R. 
# In today's tutorial, we're going to introduce you to... 

# ...how to install R and RStudio.  
# ...R, an excellent programming language for data analysis and visualization.
# ...RStudio, a program that helps you clean, analyze, and visualize data. 
# ...The method for loading cool "packages" for R, which are FREE chunks of code, sometimes called libraries, to help you do neat things like visualize data.
# ...A suite of packages called "the Tidyverse", which are great for cleaning, analyzing and visualizing data. 
# ...Analyzing data and making some graphics (called plots) in R. 

# Let's get started!  If you get stuck using RStudio, this is a great cheat sheet: https://github.com/rstudio/cheatsheets/raw/master/rstudio-ide.pdf

# This is an R script file, by the way. You can tell, because it has the file extension ".r".  You can write code in here, highlight it, then click on the little green arrow button at the top of this window that says "Run" and it will execute in the "Console" below. 

# Let's try executing some code now, to print out a basic calculation. Highlight it, click Run, and look at the console below.

print(2+5)

# By the way, this line (and all the other green text) is an example of a "comment" in R. Comments in R start with a #. It's good practice to liberally use comments to explain your code. Running a comment won't do anything, even if your comment contains code that R recognizes.  To see this in action, try running the next line.

# print(2+5)

# It didn't give you an answer, right? That's because it's a comment. 

# You can also write code directly into the console (though it's better practice to work in script files). In the console below, try printing out your name by typing print('your name here'). Did it work?

# Today's exercise

# We're going to work with data documenting the growth of opioid overdose deaths in the U.S. over the last 20 years, created by the NIH National Institute on Drug Abuse. Data and documentation available here. https://www.drugabuse.gov/related-topics/trends-statistics/overdose-death-rates.

# Before we bring the data into RStudio, we're going to load in a collection of packages called "the Tidyverse." Explainer site: https://www.tidyverse.org/ | Great collection of cheatsheets: https://www.rstudio.com/resources/cheatsheets/ | Tutorial guide: http://r4ds.had.co.nz/.  

# The Tidyverse package has already been installed on this machine, so you don't need to install it.  But if you were trying to run this on your local machine, you'd first need to run this line of code:

# install.packages('tidyverse')

# Because we've already installed on these computers, you just need to run the following function to work with it:

library(tidyverse)

# Okay, now let's read in the data we're going to work with with the read_csv function.  We're going to store it as an variable/object called "overdoses" so we can refer to it later. Notice that we're feeding two "arguments" to the read_csv function.  The first one, in quotes, is the file path telling it where to find the file.  The second is telling it that file has column names.

overdoses <- read_csv("csv/opioid_deaths_nida.csv", col_names=TRUE)

# This is a really great cheat sheet on reading in data with the Tidyverse. https://github.com/rstudio/cheatsheets/raw/master/data-import.pdf

# If you look at the window to the right, under the "environment" tab, there's an object under data called overdoses.  It has 17 observations (or rows), and 4 variables (or columns or fields). Now that we've read in the data, let's look at it with the View function. 

View(overdoses)

# Notice that it pops up in the RStudio table viewer in this window. It looks kind of like Excel, right?  You can click on the column names to sort ascending and descending. 

# Okay, let's first create a table of summary statistics, calculating the mean, median, min and max and total values for all opioid deaths between 1999 and 2015.  This is a great cheatsheet on analyzing data with the Tidyverse: https://github.com/rstudio/cheatsheets/raw/master/data-transformation.pdf 
# We're going to store this table we're creating as a variable/object called "opioid_summary".  The method we're using to write this uses the Tidyverse packages. 

opioid_summary <- overdoses %>%
  summarise(Name = "Opioid Deaths",
            Mean = mean(all_opioids),
            Median = median(all_opioids),
            Min = min(all_opioids),
            Max = max(all_opioids),
            Total = sum(all_opioids)
            )

# Now that we've created it, let's look at it. Between 1999 and 2015, 309K people died of opioid overdoses. 

View(opioid_summary)

# Now, let's create a similar summary table for heroin-related deaths called heroin_summary. Put you code in the space below, run it, and view the table.


# Finished? Now, let's create a similar summary table for prescription opioid-related deaths called rx_summary. Put you code in the space below, run it, and view the table.



# Finished? Okay, let's make some graphs/plots/graphics with the ggplot library, which is part of the Tidyverse suite of packages.  

# R has some basic plotting functionality built in, but it's kind of limited.  ggplot is great. If you get stuck using ggplot, this cheatsheet is quite nice: file:///Users/smussend/Downloads/data-visualization-2.1.pdf

# As you've probably heard, opioid deaths have skyrocketed over the last 20 years.  Let's build a basic bar chart that shows the growth, using the ggplot function. In the function below, the first line tells the function which data set to use, and which columns to put on the x and y axes.  The second line tells it what kind of chart to make. Run it!

ggplot(data=overdoses, aes(y=all_opioids, x=year)) + 
  geom_bar(stat="identity")

# If you look over at the window on the right, you'll see your chart appears in the "plots" tab. Neat, right? Let's say we want a line chart instead of a bar chart.  All we have to do is change one thing, and run it again. Do you see what changed in the code to make the chart change?

ggplot(data=overdoses, aes(y=all_opioids, x=year)) + 
  geom_line(stat="identity")

# Okay, this is pretty good on its own, but we can make it better.  Let's add a title and run it again. Notice as we add more features to our graph, we keeping using the plus symbol at the end of the previous line.

ggplot(data=overdoses, aes(y=all_opioids, x=year)) + 
  geom_line(stat="identity") + 
  labs(
    title ="Annual opioid deaths quadruple since 1999"
  )

# Let's add a caption with source and run it again. 

ggplot(data=overdoses, aes(y=all_opioids, x=year)) + 
  geom_line(stat="identity") + 
  labs(
    title ="Annual opioid deaths quadruple since 1999",
    caption="Source: National Institute on Drug Abuse"
  )

# Getting better.  The axis labels are a little funky.  Let's fix those by getting rid of year, and cleaning up all_opioids.
  
ggplot(data=overdoses, aes(y=all_opioids, x=year)) + 
  geom_line(stat="identity") + 
  labs(
    title ="Annual opioid deaths quadruple since 1999",
    caption="Source: National Institute on Drug Abuse",
    x="",
    y="Annual opioid deaths"
  ) 

# Let's polish it up a bit by changing from the default ggplot "theme" to use the black and white theme. 
ggplot(data=overdoses, aes(y=all_opioids, x=year)) + 
  geom_line(stat="identity") + 
  labs(
    title ="Annual opioid deaths quadruple since 1999",
    caption="Source: National Institute on Drug Abuse",
    x="",
    y="Annual opioid deaths"
  ) + 
  theme_bw()

# And let's change the color of the line to red, inside the geom_line function.
ggplot(data=overdoses, aes(y=all_opioids, x=year)) + 
  geom_line(stat="identity", colour="#e2201d") + 
  labs(
    title ="Annual opioid deaths quadruple since 1999",
    caption="Source: National Institute on Drug Abuse",
    x="",
    y="Annual opioid deaths"
  ) + 
  theme_bw()

# To reinforce our point a bit more, let's annotate the top and bottom points. 
ggplot(data=overdoses, aes(y=all_opioids, x=year)) + 
  geom_line(stat="identity", colour="#e2201d") + 
  labs(
    title ="Annual opioid deaths quadruple since 1999",
    caption="Source: National Institute on Drug Abuse",
    x="",
    y="Annual opioid deaths"
  ) + 
  theme_bw() + 
  annotate(geom="text",x=2014,y=33091,label="33K") +
  annotate(geom="text",x=1999, y=9000, label="8K")

# Looking good! If you're happy with your graph, click the "export" button in the plot viewer at right to save your graphic as an image.  Suitable for Tweeting!

# If there's time left, try recreating a similar graphic for heroin deaths, using your previous code as a guide.  

# Or talk to me, and I'll help you get RStudio up and running on your local machine.  You'll probably need to install R, the language, and RStudio. 
# Install R, the language https://cran.r-project.org/
# Install RStudio https://www.rstudio.com/products/rstudio/download/

