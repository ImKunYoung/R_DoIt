#변수 만들기
x <- c(1, 2, 3)
x
## [1] 1 2 3

# 함수 적용하기
mean(x)
## [1] 2

max(x)
## [1] 3

min(x)
## [1] 1


str5
## [1] "Hello!" "World"  "is"     "good!" 

paste(str5, collapse=",") ## 쉼표를 구분자로 str5의 단어들 하나로 합침
## [1] "Hello!,World,is,good!"

paste(str5, collapse = " ")
## [1] "Hello! World is good!"


x_mean <- mean(x)
x_mean
## [1] 2

str5_paste <- paste(str5, collapse = " ")
str5_paste
## [1] "Hello! World is good!"

