Intro.
http://cran.r-project.org/doc/contrib/Short-refcard.pdf
#History=====================================================================================================
R is an open decendant of S. Internal language for stats developed by Bell Labs
Books list: See R-programming lectures vid (2 - 2... end of vid)
#Swirl=====================================================================================================
install.packages("swirl", repos='http://cran.us.r-project.org')
library(swirl)
swirl()
| When you are at the R prompt (>):
| -- Typing skip() allows you to skip the current question.
| -- Typing play() lets you experiment with R on your own; swirl will ignore
| what you do...
| -- UNTIL you type nxt() which will regain swirl's attention.
| -- Typing bye() causes swirl to exit. Your progress will be saved.
| -- Typing main() returns you to swirl's main menu.
| -- Typing info() displays these options again.


#Help========================================================================================================
?sum
help(sum)
#sum                    package:base                    R Documentation
#Sum of Vector Elements
#Description: 'sum' returns the sum of all the values present in its arguments.
#Usage:       sum(..., na.rm = FALSE)

#Arguments:, #Details:, Value:, S4 methods:, References:, See Also:

example(min)  # examples of min usage including plots etc
#min> require(stats); require(graphics)
#min>  min(5:1, pi) #-> one number
#[1] 1
#...

# Call the function without () displays the internals of the function
sum       #function (..., na.rm = FALSE)  .Primitive("sum")  # R code of function  
args(sum) #function (..., na.rm = FALSE) 
help.search("sum")

summary(airquality)
#     Ozone           Solar.R           Wind             Temp           Month            Day     
# Min.   :  1.00   Min.   :  7.0   Min.   : 1.700   Min.   :56.00   Min.   :5.000   Min.   : 1.0  
# 1st Qu.: 18.00   1st Qu.:115.8   1st Qu.: 7.400   1st Qu.:72.00   1st Qu.:6.000   1st Qu.: 8.0  
# Median : 31.50   Median :205.0   Median : 9.700   Median :79.00   Median :7.000   Median :16.0  
# Mean   : 42.13   Mean   :185.9   Mean   : 9.958   Mean   :77.88   Mean   :6.993   Mean   :15.8  
# 3rd Qu.: 63.25   3rd Qu.:258.8   3rd Qu.:11.500   3rd Qu.:85.00   3rd Qu.:8.000   3rd Qu.:23.0  
# Max.   :168.00   Max.   :334.0   Max.   :20.700   Max.   :97.00   Max.   :9.000   Max.   :31.0  
# NA's   :37       NA's   :7                                       
                               
str(airquality) # structure
#'data.frame':	153 obs. of  6 variables:
# $ Ozone  : int  41 36 12 18 NA 28 23 19 8 NA ...
# $ Solar.R: int  190 118 149 313 NA NA 299 99 19 194 ...
# $ Wind   : num  7.4 8 12.6 11.5 14.3 14.9 8.6 13.8 20.1 8.6 ...
# $ Temp   : int  67 72 74 62 56 66 65 59 61 69 ...
# $ Month  : int  5 5 5 5 5 5 5 5 5 5 ...
# $ Day    : int  1 2 3 4 5 6 7 8 9 10 ...
 
head(airquality)
#  Ozone Solar.R Wind Temp Month Day
#1    41     190  7.4   67     5   1
#2    36     118  8.0   72     5   2
#3    12     149 12.6   74     5   3
#4    18     313 11.5   62     5   4
#5    NA      NA 14.3   56     5   5
#6    28      NA 14.9   66     5   6

#Libraries ==================================================================================================
available.packages() # list all packages available on cran (thousands)
install.packages('magrittr') # install a new package

library('magrittr') #import package into scope  # %>%

#Basics======================================================================================================
#Assignment (Dynamicly Typed)
x <- 42             # traditional syntax, does not print
x =  42             # more c-like syntax was supported from 2001
x/2                 #[1] 21              # [1] is the vector index of the first elem printed on that line
(x <- "Arr, matey!")#[1] "Arr, matey!"   # parentheses to force printing 
#Function call
sum(1, 3, 5)             #[1] 9
#Call by name
rep("Yo ho!", times = 3) #[1] "Yo ho!" "Yo ho!" "Yo ho!"

#Primatives () ==================================================================================================
#vector of strings(Character)
"hello"    #[1] "hello"   # collections are primatives
'hello'
#vector of double(Numeric)
1   #[1] 1
#vector of long(Integer)
1L  #[1] 1
--
R deals with 1/0 0/0 more naturally than java Inf -Inf NaN
#vector of complex
5+2i
#vector of boolean (logical)
T == TRUE
F == FALSE #[1] TRUE
( 1 + 1*2 != (1+1)*2 ) == (T == TRUE) #[1] TRUE #Boolean logic

#Dates and Times ============================================================================================
x <- as.Date("1970-01-01")
x                              # [1] "1970-01-01"
unclass(x)                     # [1] 0
unclass(as.Date("1970-01-02")) # [1] 1
weekdays(x)                    # [1] "Thursday"  #works on dates and times
months, quarters

x <- Sys.time()                # defaults to POSIXct
x                              # [1] "2015-02-05 15:59:43 SAST"
unclass(x)                     # [1] 1423145160  # POSIXct underlying is a integer(long)
p <- as.POSIXlt(x)             # POSIXlt underlying is a list (unclass to get list)
p                              # [1] "2015-02-05 15:59:43 SAST"
names(unclass(p))              # [1] "sec" "min" "hour" "mday" "mon" "year" "wday" "yday" "isdst"  "zone" "gmtoff"
p$sec                          # [1] 43.77702 #this accesses underlying list (not available on POSIXct)

datestring <- c("January 10, 2012 10:40", "December 9, 2011 09:10")
x <- strptime(datestring, "%B %d, %Y %H:%M")
x        # [1] "2012-01-10 10:40:00" "2011-12-09 09:10:00"
class(x) # [1] "POSIXlt" "POSIXt"

x <- as.Date("2012-01-01")
y <- strptime("9 Jan 2011 11:34:21", "%d %b %Y %H:%M:%S")
x-y   # Warning: Incompatible methods ("-.Date", "-.POSIXt") for "-" Error: non-numeric argument to binary operator
x <- as.POSIXlt(x)
x-y   # Time difference of 356.3 days

y <- as.POSIXct("2012-10-25 01:00:00", tz = "GMT")
x <- as.POSIXct("2012-10-25 01:00:00")
y-x   # Time difference of 2 hours (I am in time zone +2)

#Data Types==================================================================================================
#Vector  #
vector(mode = "logical", length = 0L) # default
mode -> "character", "complex", "numeric", "integer", "logical"
vector("numeric",3) #[1] 0 0 0
#concatenate
c(2i,2)     #[1] 0+2i 2+0i         # auto convert to complex
c(1i,1,"1") #[1] "0+1i" "1" "1"    # auto convert to string   # implicit coercion

x <- 1:3                   #x ->#[1] 1 2 3
names(x) <- c('a','b','c') #x ->#
#a b c 
#1 2 3
names(x) #[1] "a" "b" "c"


length(1:6)   #[1] 6
length("sdf") #[1] 1
(1:6)[6]      #[1] 6

class(1)               #[1] "numeric"
class(1:6)             #[1] "integer"
class(as.numeric(1:6)) #[1] "numeric"  # explicit coercion
as.logical(0:2)        #[1] FALSE  TRUE  TRUE  # only 0 becomes FALSE
as.character(0:6)      #[1] "0" "1" "2" "3" "4" "5" "6"
as.numeric("1e2")      #[1] 100
as.numeric("a")        #[1] NA # Warning message: NAs introduced by coercion 

#List    #Vector that can have mixed types
list(1,"sdf",T) 
# list with built in names
list(a=1,b="sdf",c=T) # $a [1] 1     $b  [1] "sdf"     $c [1] TRUE

#Matrix
matrix(data = NA, nrow = 1, ncol = 1, byrow = FALSE, dimnames = NULL) 
m <- matrix(11:16,2,3, dimnames=list(c('a','b'),1:3))
m # 1  2  3
#a 11 13 15
#b 12 14 16
dim(m)        #[1] 2 3           #get dim
attributes(m) #[1] "1" "2" "3"
m[6]          #[1] 6

m <- 1:10
dim(m) <- c(2,5)                 #set dim, makes vector into matrix
dimnames(m) <- list(c('a','b'),c('q','w','e','r','t'))
#  q w e r  t
#a 1 3 5 7  9
#b 2 4 6 8 10
dim(m) <- c(5,2)
dimnames(m) # NULL # changing dim cleared this attribute

x <-  1: 3
y <- 11:13
cbind(x,y) # bind columns into matrix
rbind(x,y) # bind rows

#Data Frame (Tabular Data) is to matrix as list is to vector
df <- data.frame(foo=1:2,bar=c(T,F),nax=3:4)
#  foo   bar nax
#1   1  TRUE   3
#2   2 FALSE   4
d[1] == d["foo"]
d[c(1,2)] == d[c("foo","bar")]
nrow(d)  #[1] 2
ncol(d)  #[1] 3
df[complete.cases(df),] # complete rows i.e no NAs

data.matrix(d) # make matrix from frame (will force all columns to same type i.e. strings)

df <- data.frame(a = 1, b = "a")


#Factor                                                                                    #1st level is the baseline or default level
x <- factor(c("yes", "no", "yes"))                        #x#[1] yes no  yes        Levels: no yes  # default level order(alphabetic)
x <- factor(c("yes", "no", "yes"), levels=c("yes", "no")) #x#[1] yes no  yes        Levels: yes no  # changes order of levels
table(x)
#x
#yes  no 
#  2   1 
y <- unclass(x)  # gives the underlying integer vector 
class(y) #[1] "integer"
#Data.table =================================================================================================
# data.table 'inherits' from data.frame (i.e. can be used to replace)
# written in C so much faster. especially for subsetting, grouping and updating
install.packages("data.table", repos='http://cran.us.r-project.org')
library(data.table)

df <- data.frame(x=1:3, y=c('a','b','c'), z=1:3)
dt <- data.table(x=1:3, y=c('a','b','c'), z=1:3) # constructed just like frame # also prints the same
tables() #
#     NAME NROW NCOL MB COLS  KEY
#[1,] dt      3    3  1 x,y,z    
#Total: 1MB

dt[2,]         # subset rows
dt[2]          # subset rows # data.table subsets rows even with out ','
dt[dt$y=='a',] # filter rows

dt[,c(2,3)]    #[1] 2 3      # not subseting rows (see below)
dt[,list(mean(x),sum(z))]    #  V1 V2   1:  2  6 # don't need to quote or prefix col names of dt

dt2 <- dt  # unlike data.frame does not make a new copy of the data
dt2 <==> dt# this means if dt2 is modified the changes will also appear in dt
# must explicitly use copy function to get a copy

dt[,w:=z^2]  # don't need to use dt$z
dt[,m:={complex; multi-line; expression}]
dt[,m:={complex; multi-line; expression}]
dt[,m:=mean(x+w),by=x>2] # Mean function done on groups specified by 'by' clause
dt[,n:=.N,by=x>2]        # Count elems of groups specified by 'by' clause
#   x y z w    m n
#1: 1 a 1 1  2.5 2
#2: 2 b 2 4  2.5 2
#3: 3 c 3 9 10.0 1

setkey(dt,y)
dt['a']        # will subset extra quick on key row # don't even need to specify dt[y=='a']
merge(dt1,dt2) # join two data.tables that have keys

fread('file')  # like read.table but order of mag faster #reads data.table

#Data Selection==============================================================================================
[]    # takes subset of same type as original
[[]]  # takes single element of list or data.frame can return a different type
$     # like [[]] but by name
x <- c('a','b','c')
#numeric index
x[1]         #[1] "a"
x[1:2]       #[1] "a" "b"
x[c(1,3)]    #[1] "a" "c"
x[x %in% 1:2]#[1] "a" "b"
#logical index
y <- x > 'a' #y->#[1] FALSE  TRUE  TRUE
x[y]         #[1] "b" "c"
x[x > 'a']   #[1] "b" "c"

#list
x <- list(foo=1:4, bar=0.6)
name <- "foo"
class(x[1])  #[1] "list"
x[1]         #$foo      [1] 1 2 3 4
x['foo']     #$foo      [1] 1 2 3 4
x[[c(2,1)]]  #[1] 0.6      # means the second element of the firest element
x[[2]] [[1]] #[1] 0.6      # means the second element of the firest element
x[[1]]       #[1] 1 2 3 4  # can not select on multiple elems (see above)
x[['foo']]   #[1] 1 2 3 4
x[[name]]    #[1] 1 2 3 4
x$foo        #[1] 1 2 3 4
#partial matching -- usefull on cammand prompt
x$f                     #[1] 1 2 3 4  # works if only one elem has name starting with seq 'f'
x[['f', exact=FALSE]]   #[1] 1 2 3 4


#matrix
x <- matrix(1:6,2,3)
x#    [,1] [,2] [,3]
#[1,]    1    3    5
#[2,]    2    4    6

x[1,2]   #[1] 3     # [row,col]            # single [] but returns vector not a 1 by 1 matrix
x[1,]    #[1] 1 3 5 # get row              # will return a vector if only one row is selected
x[,1]    #[1] 1 2   # get col

x[1,,drop=FALSE]    #[1] 1 2   # get col   # drop false forces the result to be a matrix
x#    [,1] [,2] [,3]
#[1,]    1    3    5

# Removing missing values
x <- c(1,2,NA,4,NaN,5)
x[! is.na(x)] #[1] 1 2 4 5

y <- c('a',NA,NA,'d','e','f')
complete.cases(x,y)    # where niether have missing vals
y[complete.cases(x,y)] #[1] "a" "d" "f"
#data.frame
d <- data.frame(foo=1:3,bar=c(NaN,F,NA),narf=3:5)
complete.cases(d)     #[1]  FALSE  TRUE FALSE
d[complete.cases(d),]
#  foo bar narf
#1   1   0    3

c(NaN,F) #[1] NaN   0  # NaN forces implicit convertion to numeric

#data.table    # faster but does not copy data


#Data Sets===================================================================================================
http://stat.ethz.ch/R-manual/R-devel/library/datasets/html/00Index.html
-- A --
ability.cov		Ability and Intelligence Tests
airmiles		Passenger Miles on Commercial US Airlines, 1937-1960
AirPassengers	Monthly Airline Passenger Numbers 1949-1960
airquality		New York Air Quality Measurements
anscombe		Anscombe`s Quartet of 'Identical' Simple Linear Regressions
attenu			The Joyner-Boore Attenuation Data
attitude		The Chatterjee-Price Attitude Data
austres			Quarterly Time Series of the Number of Australian Residents
-- B --
beaver1	        Body Temperature Series of Two Beavers
beaver2	        Body Temperature Series of Two Beavers
beavers	        Body Temperature Series of Two Beavers
BJsales	        Sales Data with Leading Indicator
BJsales.lead	Sales Data with Leading Indicator
BOD	Biochemical Oxygen Demand
-- C --
cars			Speed and Stopping Distances of Cars
ChickWeight		Weight versus age of chicks on different diets
chickwts		Chicken Weights by Feed Type
CO2	Carbon 		Dioxide Uptake in Grass Plants
co2	Mauna 		Loa Atmospheric CO2 Concentration
crimtab			Student`s 3000 Criminals Data
-- D --
datasets		The R Datasets Package
discoveries		Yearly Numbers of Important Discoveries
DNase			Elisa assay of DNase
-- E --
esoph			Smoking, Alcohol and (O)esophageal Cancer
euro			Conversion Rates of Euro Currencies
euro.cross		Conversion Rates of Euro Currencies
eurodist		Distances Between European Cities and Between US Cities
EuStockMarkets	Daily Closing Prices of Major European Stock Indices, 1991-1998
...
#Tests=======================================================================================================
is.na(c(NA,NaN))     #[1] TRUE TRUE
is.nan(c(1,NaN, NA)) #[1] FALSE  TRUE  FALSE

is.array               is.expression          is.logical             is.name                is.package_version     is.stepfun
is.atomic              is.factor              is.matrix              is.nan                 is.pairlist            is.symbol
is.call                is.finite              is.mts                 is.null                is.primitive           is.table
is.character           is.function            is.na                  is.numeric             is.qr                  is.ts
is.complex             is.infinite            is.na.data.frame       is.numeric_version     is.R                   is.tskernel
is.data.frame          is.integer             is.na.numeric_version  is.numeric.Date        is.raster              is.unsorted
is.double              is.language            is.na.POSIXlt          is.numeric.difftime    is.raw                 is.vector
is.element             is.leaf                is.na<-                is.numeric.POSIXt      is.recursive           
is.empty.model         is.list                is.na<-.default        is.object              is.relistable          
is.environment         is.loaded              is.na<-.factor         is.ordered             is.single      

#File Ops====================================================================================================
getwd() # working directory # Rstudio it equals home dir # terminal it is folder where started from
setwd("./James")  setwd("/opt/") # relative and absolute paths

#comand line
dir()               #[1] "files in working dir"
ls()                #[1] user defined varables and functions

file.exists("folder")  # test file/directory 
dir.create("folder")   # 

list.files()        #[1] "notes.R" "script.R"  # dir,ls

# write functions (invers of read func list)
write.table()
writeLines
dput(y)                                        # writes to console
dput(y,file="y.dat")        # dget('y.dat')    # contains data type can be read with dget
dump(c('x','y'), 'xy.dat')  # source('xy.dat') # dput on multiple objects
save                        # load
serialized                  # unserialized

# read functions
read.table(file, header = FALSE, sep = "", quote = "\"'", dec = ".", 
    numerals = c("allow.loss", "warn.loss", "no.loss"), row.names, 
    col.names, as.is = !stringsAsFactors, na.strings = "NA", 
    colClasses = NA, nrows = -1, skip = 0, check.names = TRUE, 
    fill = !blank.lines.skip, strip.white = FALSE, blank.lines.skip = TRUE, 
    comment.char = "#", allowEscapes = FALSE, flush = FALSE, 
    stringsAsFactors = default.stringsAsFactors(), fileEncoding = "", 
    encoding = "unknown", text, skipNul = FALSE)
file        # name of file or connection
header      # does the file have a header line
sep         # separator
quote       # quote chars
colClasses  # class of each column(figures out automatically)
nrows       # number of rows(not required)
comment.char# anything to the right is ignored ()
skip        # number of lines to skip from the beggining
na.strings  # what to mark as NA
stringsAsFactors# should strings be coded as factors
readLines() #give file text

#large data sets
comment.char# set tp "", # is lightly to turn up somewhere and it improves speed
colClasses  # faster to supply this for large data sets, (if you give a single value it will apply for all cols)
colClasses  # can use nrows = 100 to auto find these vals the use then on whole dataset
skip + nrows# to chunk dataset

numeric     # 8 bytes 64 bits 
#e.g. rows 1,500,000 * col 120 * numeric 8 bytes /1024^3 = 1.4GB rule of thunb *2 required for read 2.8GB required


read.csv() # like table but default header = TRUE, sep = ","


bash> echo "x<-'script output'" > script.R
source("script.R")  # run script
x                   #[1] "script output"
dget("y.dat")
load
unserialized

#connections     read/write/append/ ???binary
     file name       rwa rb wb ab  
file(description = "", open = "", blocking = TRUE, encoding = getOption("encoding"), raw = FALSE)       
file      # standard file conection
gzfile    # g-zip
bzfile    # b-zip
url       # webpage

con <- file('y.da', 'r')
data <- read.csv(con)  # OR # data <- read.csv('y.da') # does the same   (reads everything)
close(con)

con <- url('http://www.???.com/myPage', 'r')
x <- readLines(con,10) # use in loop to chunk file up 

date()  # [1] "Wed Feb  4 19:34:36 2015"
download.file(fileUrl, destfile="where to save+date", method="curl") # curl is nessisary for https


#Flow Control================================================================================================
#Choices
if(F) 1                       #        # no return (NULL)
if(T)  1                      #[1] 1
if(F)  1  else  3             #[1] 3
if(F) {1} else {3}            #[1] 3   # {} brackets only optional in single line statment
if(F) 1 else  if(F) 2 else 3  #[1] 3
if(F) 1 else {if(F) 2 else 3} #[1] 3   # nested ifs can also drop brackets

if(F) y <- 1 else y <- 3  #y->#[1] 3 #y is accessable outside of the if statment (statment does not have its own scope)
y <- if(F) 1 else 3       #y->#[1] 3 

#Vectorized if-else
ifelse(test=c(1,0,1,0)>0,yes=TRUE,no=FALSE)  #[1] TRUE FALSE TRUE FALSE
ifelse(c(1,0,1,0)>0     ,TRUE    ,FALSE   )  #[1] TRUE FALSE TRUE FALSE



#Loops
# for loop are not slower than apply any more (historically it was true) TEST???
x <- c('a','b','c')
for(i in 1:10) print(i)           #i->#[1] 10 # {} brackets only optional for single statment loops
for(i in 1:10) {i<-i+1; print(i)} #i->#[1] 11 # 10 loops i is always reset at the start of the loop
for(i in x) print(i)              #i holds elems of x
for(i in seq_along(x)) print(i)   #i holds indexs of x

seq_along(7:9) #[1] 1 2 3
seq_len(3)     #[1] 1 2 3

cnt <- 0
while(cnt < 10) {print(cnt); cnt <- cnt + 1}    # infinite loops possible :(
repeat { if(cnt > 20) break else print(cnt)}    # infinite loop by default so need to break
#break, next, return  ^^^^^ break (see above)
next   #skip to next loop (on inner most loop)
return #will exit the function as well as the loop

#Other ways to Loop =========================================================================================
#Vectorised Ops
# operations done in parallel
x <- 1:3; y <- 2:4
x + y      #[1] 3  5 7   # element wise addition
x * y      #[1] 2  6 12  # element wise multiplication
x == 2     #[1] FALSE  TRUE FALSE
x < 2      #[1]  TRUE FALSE FALSE

x <- matrix(1:4,2,2); y <- matrix(rep(10,4),2,2)
x  *  y    # element wise multiplication
x %*% y    # matrix multiplication

#Functional Programming
paste(1,2,3, sep="-")   #[1] "1-2-3"

                                                                            Returns in order of preference | Internal Func
lapply(X, FUN, ...)                                                  list -> list ~= map on list           | lapply
sapply(X, FUN, ..., simplify = TRUE, USE.NAMES = TRUE)               list -> vector, matrix, list          | lapply
apply (X, MARGIN, FUN, ...)                 high dimensional array/matrix -> vector, matrix, array
mapply(FUN, ..., MoreArgs = NULL, SIMPLIFY = TRUE, USE.NAMES = TRUE) lists-> vec, mat, list OR SIMPLIFY = FALSE -> list
tapply(X, INDEX, FUN = NULL, ..., simplify = TRUE)                   list -> vec, mat, list OR SIMPLIFY = FALSE -> list

lapply(list(a = 1:5, b = rnorm(10)), mean)            # $a [1] 3            $b [1] -0.2986962  #list
sapply(list(a = 1:5, b = rnorm(10)), mean)            #  a  3.000000000      b -0.005896734 

lapply(1:2, runif, max=10)          # [[1]] [1] 1.887514   [[2]] [1] 0.6160749 8.5131017
x <- list(a = matrix(1:4, 2, 2), b = matrix(1:6, 3, 2)) 
lapply(x, function(elt) elt[1,])    #$a [1] 1 3     $b [1] 1 4  ## annonamous function to extract first row

x <- matrix(rnorm(6), 2, 3) # 2 rows 3 column
apply(x, MARGIN=1, mean) #[1] -0.1696308  0.3434682              # MARGIN -> 1 keep rows
apply(x,        2, sum ) #[1] -1.4425378  0.5121538 -0.3818363   # MARGIN -> 2 keep cols
a <- array(rnorm(2 * 2 * 10), c(2, 2, 10))
apply(a, MARGIN=c(1, 2), mean)   # output 2x2 matrix             # MARGIN -> 1&2 keep rows and cols
apply(a, MARGIN=1, mean)         # output 2 vector               # MARGIN -> 1 keep rows

mapply(FUN, ..., MoreArgs = NULL ___ # can take multiple input lists (this uses ..., so extra args are passed with MoreArgs)
mapply(rep, 1:4, 4:1) <==> list(rep(1, 4), rep(2, 3), rep(3, 2), rep(4, 1))
mapply(rnorm, 1:5, 1:5, .002)   # 1:5 map x=>rnorm(x, mean = x, sd = .002) # constants replicated to each call

x <- c(rnorm(4), runif(4), rnorm(4, 1))
f <- gl(3, 4)                   # [1] 1 1 1 1 2 2 2 2 3 3 3 3   factor with Levels: 1 2 3
tapply(x, f, mean)              # 1 -0.3187430         2 0.6346760         3 0.3671171
# group x using f with function mean


# faster dedicated functions for sum and mean
rowSums(x)  #=> apply(x, 1, sum)
colSums(x)  #=> apply(x, 2, sum)
rowMeans(x) #=> apply(x, 1, mean)
colMeans(x) #=> apply(x, 2, mean)
rowMeans(a, dims = 2) #=> apply(a, MARGIN=c(1, 2), mean)

apply(x, 1, quantile, probs = c(0.25, 0.75))

#split
split(x, f, drop = FALSE, ...) # group x using factor f
split(rnorm(4), gl(2, 2))      # $`1` [1] 0.7115321 0.6903508     $`2` [1] -0.5255058 -0.2296368


f1 <- gl(2, 3)      # [1] 1 1 1 2 2 2
f2 <- gl(3, 2)      # [1] 1 1 2 2 3 3
interaction(f1, f2) # [1] 1.1 1.1 1.2 2.2 2.3 2.3   with Levels: 1.1 2.1 1.2 2.2 1.3 2.3
split(rnorm(6), list(f1,f2), drop=T) # will automaticaly create interaction # drop=T to drop empy levels

#Command vectorization



#Functions ==================================================================================================
add2 <- function(x,y=3)    x + y    # last line returns #{} optional on single line
add2 <- function(x,y=3) {x + y}     # last line returns 
add2(2,c(3,4))                      #[1] 5 6
add2(2)                             #[1] 5

mkVec <- function(...) {c(...)}     
mkVec(1,2,3)                        #[1] 1 2 3

add2 <- function(x,yyy=3) {x + yyy}   
add2(2, y=4)                        #[1] 6  # partial match (can't be used in function signatures with ...)

f <- function(x) invisible(x)       # returns x, but prevents the automatic printing if called from the console 

#Infix functions
#All user-created infix functions must start and end with %.
#R comes with the following infix functions predefined: %%, %*%, %/%, %in%, %o%, %x%. 
#(The complete list of built-in infix operators that don’t need % is:
# ::, :::, $, @, ^, *, /, +, -, >, >=, <, <=, ==, !=, !, &, &&, |, ||, ~, <-, <<-)
`%+%` <- function(a, b) paste0(a, b)
"new" %+% 1   #[1] "new1"
`+`(1, 5)     #[1] 6

R’s default precedence rules mean that infix operators are composed from left to right:
`%-%` <- function(a, b) paste0("(", a, " %-% ", b, ")")
"a" %-% "b" %-% "c"   #[1] "((a %-% b) %-% c)"

# making getOrElse
`%||%` <- function(a, b) if (!is.null(a)) a else b
function_that_might_return_null() %||% default value

# functions can be nested and/or return functions


#Lexical Scoping ============================================================================================
search()
".GlobalEnv" "package:stats" "package:graphics" "package:grDevices" "package:utils"
     "package:datasets" "package:methods" "Autoloads" "package:base"

".GlobalEnv"  -> user workspace - searched first
#new librarys imported go right after the ".GlobalEnv"
library('swirl')
search()  # [1] ".GlobalEnv"        "package:swirl"     "package:stats" ...

# separate name spaces for functions and variables(vectors...)

add <- function(x,y=3) {z <- x + y}
add(1)
z  #Error: object 'z' not found    # x,y and z are only in the functions scope

z <- 2
add <- function(x) x+z
add(1)     #[1] 3   # z is found in the enviroment where the function is defined
                    # the function enviroment is a closure -- like scala

add <- function(x) {k<-x*2 ; function(y) y*k}
add(4)(10)          #[1] 80    # the returned function can still access k

# see what is in a specific scope
ls()                         #[1] "add"  "add2" "z"  
get('add')                   # function(x) {l<-x*2 ; function(y) y*l}
ls(environment(add(4)))      #[1] "k" "x"
get('k',environment(add(4))) #[1] 8
#                                                                     | let you choose |
# Lexical Scoping -- look up where function is defined -- R, scala,   | lisp, perl     |
# Dynamic Scoping -- look up where function is called  -- Logo, Emacs | lisp, perl     |  and the shell languages bash etc

`%getNumOrElse%` <- function(a, b) if (is.numeric(a) && !is.nan(a)) a else b
printAll <- function(...) print(paste(...))

#Regex=======================================================================================================
paste(..., sep = " ", collapse = NULL) 

x <- print("hello") #print also returns its String


#Maths=======================================================================================================
as.numeric("1e100")
2^3.4         #[1] 10.55606
16^.5         #[1] 4
sqrt(16)      #[1] 4


rep(1, 3)  rep(1, times = 3) #[1] 1 1 1

sum(1, 3, 5)  #[1] 9
mean(1:3)     #[1] 2
mean(c(NA,2,2,2),na.rm = T) #[1] 2
mean(c(NA,2,2,2))           #[1] NA

quantile(rnorm(10000), probs = c(0.25, 0.75)) # 25%  -0.6825452      75% 0.6660930  
# returns vec with 25 and 75 percentile

#Random =====================================================================================================
#Standard distributions are built in: Normal, Poisson, Binomial, Exponential, Gamma, etc.
#Normal distribution
nRandVec <- rnorm(n, mean = 0, sd = 1)                                  : generate random Normal variates
y        <- dnorm(x, mean = 0, sd = 1, log = FALSE)                     : probability density
sumOf_y  <- pnorm(q, mean = 0, sd = 1, lower.tail = TRUE, log.p = FALSE): cumulative distribution function
invPnorm <- qnorm(p, mean = 0, sd = 1, lower.tail = TRUE, log.p = FALSE): quantile function

dnorm(0)           # [1] 0.3989423 # y value for gives x
pnorm(0)           # [1] 0.5       # sum of distrobution to left
pnorm(qnorm(.314)) # [1] 0.314     # invers functions

runif(n, min = 0, max = 1)  # even distribution
rbinom(n, size, prob)       # binomial distribution
rpois(n, lambda): generate random Poisson variates with a given rate # dpois ppois qpois behave similarly


runif(3)      #[1]  0.3362421  0.3484444  0.4306559 # three uniform random numbers
rpois(5,7) #[1]14 6 9 11 5# if on average 7 things occur in 1 unit of time. then how many occur at a random unit of time
mean(rpois(500,7)) #[1] 7

rnorm(n, mean = 0, sd = 1)
set.seed(1)   
rnorm(3)      #[1] -0.6264538  0.1836433 -0.8356286 # three normalized random numbers
rnorm(3)      #[1]  1.5952808  0.3295078 -0.8204684
set.seed(1)   
rnorm(3)      #[1] -0.6264538  0.1836433 -0.8356286 # reseting the seed to make random generaters give the same result
rnorm(3)      #[1]  1.5952808  0.3295078 -0.8204684

set.seed(20)
x <- rnorm(100)
y <- 0.5 + 2 * x + rnorm(100, 0, 2)
plot(x, y)

# if the params are vectors they will be cycled through
rnorm(5, 1:3 + .01, 0.00000001) # [1] 1.01 2.01 3.01 1.01 2.01 

sample(1:4)      #[1] 4 3 1 2   # random order
sample(1:10, 4)  #[1] 3 4 5 7   # only take 4
sample(1:2, 4)   # Error can't pick 4 elems from list of 2
sample(1:2, 6, replace = TRUE) #[1] 1 1 2 2 2 1
sample(letters, 5)             #[1] "q" "b" "e" "x" "p"




#Optimization ===============================================================================================

#We should forget about small efficiencies, say about 97% of the time: premature
#optimization is the root of all evil
#--Donald Knuth

system.time( { rnorm(1e6) } )  # remember to use {} if wrappign multiple lines
# user  system elapsed 
#0.092   0.000   0.094    # elapsed time will be much higher than user time if there are web calls etc

user time: time charged to the CPU(s) for this expression 
elapsed time: "wall clock" time # can be smaller than user time on multi core machines

# Rprof works by sampling the call stack (every 0.02 seconds by default)
# so if your function runs in less than 0.02 it won't get timed :(
#DO NOT use system.time() and Rprof() together or you will be sad

Rprof()           # starts the profiler in R 
$by.total  # rank by time taken including childeren
$by.self   # rank by time taken excluding childeren
                    self.time  self.pct total.time total.pct
"lm.fit"                 2.99     40.35       3.50     47.23
"as.list.data.frame"     0.82     11.07       0.82     11.07
"[.data.frame"           0.79     10.66       1.03     13.90
"structure"              0.73     9.85        0.73      9.85
"na.omit.data.frame"     0.49     6.61        1.30     17.54
"list"                   0.46     6.21        0.46      6.21
"lm"                     0.30     4.05        7.41    100.00
"model.matrix.default"   0.27     3.64        0.79     10.66
"na.omit"                0.24     3.24        1.54     20.78
"as.character"           0.18     2.43        0.18      2.43
"model.frame.default"    0.12     1.62        2.24     30.23
"anyDuplicated.default"  0.02     0.27        0.02      0.27

#Debugging 
#levels
message  : notification/diagnostic message
warning  : something is wrong; execution continues
error    : fatal problem; execution stops

condition: generic term for all the above; programmers can create their own conditions

log(-1)   #[1] NaN    #Warning message: In log(-1) : NaNs produced
if(NA>4)1             #Error in if (NA > 4) 1 : missing value where TRUE/FALSE needed

traceback(): prints stacktrace; call this imidiatly after error
browser  : suspends the execution wherever it is called;  starts debug mode
debug    : flags a function for “debug” mode; starts debug mode whenever the function is called
trace    : allows insertion of debugging code into a function in specific places
recover  : allows you to modify the error behavior so that you can browse the function call stack

lm(y ~ x)  # Error in eval(expr, envir, enclos) : object ’y’ not found
traceback()
# ... other function calls
#3: eval(expr, envir, enclos)
#2: eval(mf, parent.frame())
#1: lm(y ~ x)

debug(lm)
lm(formula=y ~ x)
# prints out function body
  Browse[2]>            # browser prompt # enter to run next line
# debug: ret.x <- x     # displays the line that is run
  Browse[2]> function   # can access and modify variables
# y ~ x

# Browse[3]>    # 3 if a nested debug session started

options(error = recover) # modify error behavior for the session
read.csv("nosuchfile")
#Error ...
#Enter a frame number, or 0 to exit
#1: read.csv("nosuchfile")
#2: read.table(file = file, header = header, sep = sep, quote = quote, dec =
#3: ...
#Selection:

# like the call stack but lets you jump to a enviroment (call scope) to see what was going on there 


#Importing Data 
#XLSX
bash> sudo R CMD javareconf

install.packages("xlsx", repos='http://cran.us.r-project.org')
library(swirl)
read.xlsx('./path', sheetIndex=1, colIndex=1:6, rowIndex=1:100)
write.xlsx()

#XML

library(XML)
doc <- xmlTreeParse(url, useInternal=T)
doc <- htmlTreeParse(url, useInternal=T)
rootNode <- xmlRoot(doc)
xmlName(rootNode) # name of root node
names(rootNode)   # childeren

rootNode[[1]][[1]]
roorNode$food$name

#xpaths
xmlSApply(rootNode, xmlValue)           # get all text
xpathSApply(rootNode, "xPath", xmlValue)  # get all text on given path

#JSON
library(jsonlite)
jsonData <- fromJSON("file")
names(jsonData)
jsonData$food$name

iris   #  built in iris dataset
js <- toJSON(iris, pretty=T)
cat(js)

#SQL
install.packages("RMySQL", repos='http://cran.us.r-project.org')
library(RMySQL)

usscDB <- dbConnect(MySQL(), user='genome', host='genome-mysql.cse.ucsc.edu')
result <- dbGetQuery(usscDB, 'show databases;');  # sql command 'show databases;'
dbDisconnect(usscDB) #[1] TRUE # remember to close
result  # list of databases

hg19   <- dbConnect(MySQL(), user='genome', db="hg19", host='genome-mysql.cse.ucsc.edu')
dbListTables(hg19)                   # list of a database's tables
dbListFields(hg19, "affyU133Plus2")  # list of a table's fields (columns)
dbGetQuery(hg19, "select count(*) from affyU133Plus2")  # count rows = 58463

affyData <- dbReadTable(hg19, "affyU133Plus2") # to data.frame
head(affyData)

query <- dbSendQuery(hg19, "select count(*) from affyU133Plus2 where misMatches between 1 and 3")  # count rows = 58463
affyMis <- fetch(query) # result stored on db till fetch   ## OR
affyMis <- fetch(query,n=10); dbClearResult(query)
dbDisconnect(hg19)
#search UCSC Genome Bioinformatics -- sequencing info ...

#HDF5
#used for storing large datasets  # supports a range of datatypes
#datasets are similar to data.frames
#groups contain 0 or more datasets
source("http://bioconductor.org/biocLite.R")
biocLite('rhdf5')
h5createFile('eg.h5')                               #[1] TRUE
h5createGroup('eg.h5','foo')                        #[1] TRUE
h5createGroup('eg.h5','foo/bar')                    #[1] TRUE
h5ls('eg.h5')    # list contents of h5 file
h5write(matrix(1:10,nr=5,nc=2),'eg.h5','foo/bar/a') #[1] TRUE # write matrix to h5 file

b <- array(0.1,2.0,by=0.1),dim=c(5,2,2))
attr(b,'Scale') <- 'liter'
h5write(b,'eg.h5','foo/bar/b') #[1] TRUE # write 3d array with attibutes






.La/t        # tab auto complete
.Last.value
lv <- function() .Last.value. Then use lv()


attach(frame)
cummax(x)
cut(x, breaks = c(, max(x)))
density(x, bw = bandwidth)
detach()
data(name)
FALSE
factor(x)
for (i in seq) {}
function(x) {}
ifelse(test, yes, no)
length(x)
lines(x, color=red)
na.omit()
rug(jitter(x))
read.table("filename", header = TRUE,  sep = "\t",  stringsAsFactors = FALSE)
seq(from, to, by)
sort(x)
source("", chdir = TRUE)
TRUE



#Markdown

#h1
##h2
###h3
plain text
*list elem 1
*list elem 2

#Code Snippets 


x <- read.csv('hw1_data.csv')
head(x)
nrow(x)
mean(x$Ozone, na.rm=T)


xc <- x[complete.cases(x[c('Ozone', 'Temp')]),]
sel <- xc[xc$Ozone > 31 & xc$Temp > 90,]

sel <- x[Vectorize(isTRUE)(x$Ozone > 31 & x$Temp > 90),]


mean(sel$Solar.R)
mean(x[x$Month==6,]$Temp)
max(na.omit(x[x$Month==5,]$Ozone))



