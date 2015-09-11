'?'(mean)
help(mean)
#These commands have the same result. They will provide information on a specific funtion
options(htmlhelp=FALSE)
#If you do not know the name of the function you want to use, there is another command:
help.search("mean")
apropos("mean")
#To search for a function not yet downloaded:
RSiteSearch("violin")
RSiteSearch("violin", restrict=c("functions"))

#Assign values with <-
a<-2+3
a
b<-a+a
#Perform multiple actions at once using semicolon.
a+a;a+b

#Defitions: A scalar is a single, real number. A vector is a group of numbers
Y<-c(8.3, 8.6, 10.7, 10.8, 11, 11, 11.1, 11.2, 11.3, 11.4)
#Basics of creating sequences
1:4
4:1
-1:3
-(1:3)
#More complex sequences
seq(from=1, to=3, by=0.2)
seq(1,3, by=0.2)
seq(1,3,length=7)
#sequence was evenly divided into 7 parts after length was specified.
#Variations within the repeat function allow you ro repeat a single digit or a sequence.
rep(1,3)
rep(1:3, 2)
rep(1:3, each=2)

#Getting information about vectors
sum(Y)
mean(Y)
max(Y)
length(Y)
summary(Y)
#Non-number vector examples
Names<-c("Sarach", "Yunluan")
Names
b<-c(TRUE,FALSE)
b
#Finding class of a number
class(Y)
class(b)
#Can compare values in a group using <,>,<=,>=,==,!= (not equal to)
Y>10
Y>mean(Y)
Y==11
Y!=11

#Algebra with vectors
a<-1:3
b<-4:6
a+b
a*b
a/b
#Using scalars on vectors
a+1
a*2
1/a
#Shouldn't multiply vectors of different lengths
a*1:2
a*c(1,2,1)
#This multiplication is acceptable because the length of the second vector is a multiple of the length of the first vector
1:4*1:2
1:4*c(1,2,1,2)

#Extracting subsets from vectors can be done by specifying columns or using T/F
Y[1]
Y[1:3]
#extract subset based on <,=, etc. the mean
Y>mean(Y)
Y[Y>mean(Y)] #these are the values that are greater than the mean
#Missing data...can't get means when data are missing
a<-c(5,3,6,NA)
a
is.na(a)
!is.na(a) #is not NA
a[!is.na(a)] #separates out all parts of a that are not NA
na.excluse(a)
na.exclude(a)
#three ways to get means
mean(a)
mean(a,na.rm=TRUE)
d<-na.exclude(a) #this method sets new variable "d" as a - NA values
mean(d)

#Matrices
matrix(letters[1:4],ncol=2) #letter matrix
M<-matrix(1:4, nrow=2) #number matrix with name M
I<-diag(1, nrow=2)
I
Minv<-solve(M)
M%*%Minv #Why this notation??
#Extracting values from matrices
M[1,2] #extract ONE value
M[1,1:2]
M[,2] #will give whole row/column is row/col is not specified
M[,] #no specification gives whole matrix

#OPTIONAL B.4 SECTION: FUNCTIONS
help(mean)
mean(1:4)
mean(1:4, trim=0)
#trim function can remove extremes when calculating the mean
class(1:10)
class(warpbreaks)
summary(1:10)
summary(warpbreaks)
summary(lm(breaks~wool,data=warpbreaks)) #get F stats
#can create your own functions, for ex. here increasing the mean by 5%
MyBogusMean <- function(x, cheat = 0.05)
 {SumOfX <- sum(x)
 n <- length(x)
 trueMean <- SumOfX/n
(1 + cheat) * trueMean}
RealSales <- c(100, 200, 300)
MyBogusMean(RealSales)
#can change the amount you are "cheating"
MyBogusMean(RealSales, cheat=0.1)
MyBogusMean(RealSales, cheat=0)

#OPTIONAL SECTION B.6:ITERATED ACTIONS
m<-matrix(1:10, nrow=2)
m
apply(m,MARGIN=1, mean) #finds one mean per row
apply(m, MARGIN=2, sum) #finds sum of all values in each column
sapply(1:10, function(i) mean(rnorm(5)))
#making loops. This is simulating how many individuals will be in a population at time t=0, and then again in the next 10 generations.
gens<-10
output<-numeric(gens+1)
output[1]<-25
for (t in 1:gens) output [t+1] <-output[t]+round(rnorm(n=1, mean=0, sd=2),0)
output

#OPTIONAL SECTION B.13: GRAPHICS
#don't have the tree data used in this section, but
#can change color in plot using col= function
#can cale colors using hcl(h=ex.30+270*hts, alpha=0.9) where alpha gives transparency to points
#size of numbers varies with size of value (here, height of tree) using cex= function
#use matplot to plot more than one variable
#xlab= and ylab= functions label the axes
quartz(width = 5, height = 3) #open a window 5in wide and 3in tall
#par means parameters of graph
#mar, mgp, and tcl are all functions that can be used to control how the graph looks, such as how much space is around it, in margins, between the title and graph, etc.
#layout function lets one put small graphs into one image! ex.:
quartz(, 5, 5)
layout(matrix(c(1, 2, 3, 3), nrow = 2, byrow = TRUE))
plot(Girth, Height)
#To save a file from R, use the dev.print function. Ex. of script:

getwd()
quartz(, 4, 4)
plot(Height, Volume, main = "Tree Data")
dev.print(pdf, "MyTree.pdf")
