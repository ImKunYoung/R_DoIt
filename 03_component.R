a<-1 # a에 1할당
a # a출력
## [1] 1

b<-2
b
## [1] 2

c<-3
c
## [1] 3

d<-3.5
d
## [1] 3.5

a+b
## [1] 3

a+b+c
## [1] 6

4/b
## [1] 2

5*b
## [1] 10


## variable name은 소문자로 만들 것

var1 <- c(1,2,5,7,8) # 숫자 5개로 구성된 var1 생성
var1
## [1] 1 2 5 7 8

var2 <- c(1:5) # 1~5까지 연속 값으로 var2 생성
var2
## [1] 1 2 3 4 5

var3 <- seq(1,5)  # 1~5까지 연속 값으로 var3 생성
var3
## [1] 1 2 3 4 5

var4<- seq(1,10, by=2) # 1~10까지 2 간격 연속 값으로 var4 생성
var4
## [1] 1 3 5 7 9

var5 <- seq(1, 10, by=3) # 1~10까지 3 간격 연속 값으로 var5 생성
var5
## [1]  1  4  7 10


var1
## [1] 1 2 5 7 8

var1+2
## [1]  3  4  7  9 10


var1
## [1] 1 2 5 7 8

var2
## [1] 1 2 3 4 5

var1+var2
## [1]  2  4  8 11 13

str1 <-"a"
str1
## [1] "a"

str2 <- "text"
str2
## [1] "text"

str3 <- "Hello World!"
str3
## [1] "Hello World!"


str4 <- c("a", "b", "c")
str4
## [1] "a" "b" "c"

str5 <- c("Hello!", "World", "is", "good!")
str5
## [1] "Hello!" "World"  "is"     "good!" 


str1+2 # char 타입 variable은 computed 안됨
## Error in str1 + 2 : non-numeric argument to binary operator

