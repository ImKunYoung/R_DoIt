## 05-3 파생변수 만들기
## 파생변수란? 기존의 변수를 변형해서 만든 변수

## 1. 2개 변수로 이루어진 데이터 프레임 생성
df<- data.frame(var1= c(4, 3, 8),
                var2= c(2, 6, 1))
df
#   var1 var2
# 1    4    2
# 2    3    6
# 3    8    1


## 2. var_sum이라는 파생변수 만들어 df에 추가
df$var_sum <- df$var1 + df$var2 # var_sum 파생변수 생성
df
#   var1 var2 var_sum
# 1    4    2       6
# 2    3    6       9
# 3    8    1       9


## 3. var_mean이라는 파생변수 생성
df$var_mean <- (df$var1+df$var2)/2 # var_mean 파생변수 생성
df
#   var1 var2 var_sum var_mean
# 1    4    2       6      3.0
# 2    3    6       9      4.5
# 3    8    1       9      4.5



## mpg 통합 연비 변수 만들기
library(ggplot2)

## 1. cty, hwy 두 변수 평균 구해서 통합 연비 구함
mpg$total <- (mpg$cty + mpg$hwy)/2 # 통합 연비 변수 생성
head(mpg)
#   manufacturer model displ  year   cyl trans      drv     cty   hwy fl    class   total
#   <chr>        <chr> <dbl> <int> <int> <chr>      <chr> <int> <int> <chr> <chr>   <dbl>
# 1 audi         a4      1.8  1999     4 auto(l5)   f        18    29 p     compact  23.5
# 2 audi         a4      1.8  1999     4 manual(m5) f        21    29 p     compact  25
# 3 audi         a4      2    2008     4 manual(m6) f        20    31 p     compact  25.5
# 4 audi         a4      2    2008     4 auto(av)   f        21    30 p     compact  25.5
# 5 audi         a4      2.8  1999     6 auto(l5)   f        16    26 p     compact  21
# 6 audi         a4      2.8  1999     6 manual(m5) f        18    26 p     compact  22


## 2. 통합 연비 변수 평균 구하기
mean(mpg$total)
# [1] 20.14957



###### 조건문을 활용해 파생변수 만들기
###### 고연비 합격 판정을 받은 자동차가 몇 대나 되는지


## 1. 기준값 정하기
summary(mpg$total) # 요약 통계량 산출
#    Min. 1st Qu.  Median    Mean 3rd Qu.    Max.
#   10.50   15.50   20.50   20.15   23.50   39.50

hist(mpg$total) # 히스토그램 생성
# total 연비의 평균과 중앙값이 약 20이다.
# total 연비가 20~25 사이에 해당하는 자동차 모델이 가장 많다.
# 대부분 25 이하이고, 25를 넘기는 자동차는 많지 않다.
# so 기준점 20으로 정하자!


## 2. 합격 판정 변수 만들기 ,, 조건문 함수: 조건에 따라 서로 다른 값을 반환하는 함수
## ifelse(조건, true:"pass", false:"fail")
mpg$test <- ifelse(mpg$total >= 20, "pass", "fail") # 20 이상이면 pass, 그렇지 않으면 fail 부여
head(mpg, 20) # 데이터 확인
#    manufacturer model              displ  year   cyl trans      drv     cty   hwy fl    class   total test
#    <chr>        <chr>              <dbl> <int> <int> <chr>      <chr> <int> <int> <chr> <chr>   <dbl> <chr>
#  1 audi         a4                   1.8  1999     4 auto(l5)   f        18    29 p     compact  23.5 pass
#  2 audi         a4                   1.8  1999     4 manual(m5) f        21    29 p     compact  25   pass
#  3 audi         a4                   2    2008     4 manual(m6) f        20    31 p     compact  25.5 pass
#  4 audi         a4                   2    2008     4 auto(av)   f        21    30 p     compact  25.5 pass
#  5 audi         a4                   2.8  1999     6 auto(l5)   f        16    26 p     compact  21   pass
#  6 audi         a4                   2.8  1999     6 manual(m5) f        18    26 p     compact  22   pass
#  7 audi         a4                   3.1  2008     6 auto(av)   f        18    27 p     compact  22.5 pass
#  8 audi         a4 quattro           1.8  1999     4 manual(m5) 4        18    26 p     compact  22   pass
#  9 audi         a4 quattro           1.8  1999     4 auto(l5)   4        16    25 p     compact  20.5 pass
# 10 audi         a4 quattro           2    2008     4 manual(m6) 4        20    28 p     compact  24   pass
# 11 audi         a4 quattro           2    2008     4 auto(s6)   4        19    27 p     compact  23   pass
# 12 audi         a4 quattro           2.8  1999     6 auto(l5)   4        15    25 p     compact  20   pass
# 13 audi         a4 quattro           2.8  1999     6 manual(m5) 4        17    25 p     compact  21   pass
# 14 audi         a4 quattro           3.1  2008     6 auto(s6)   4        17    25 p     compact  21   pass
# 15 audi         a4 quattro           3.1  2008     6 manual(m6) 4        15    25 p     compact  20   pass
# 16 audi         a6 quattro           2.8  1999     6 auto(l5)   4        15    24 p     midsize  19.5 fail
# 17 audi         a6 quattro           3.1  2008     6 auto(s6)   4        17    25 p     midsize  21   pass
# 18 audi         a6 quattro           4.2  2008     8 auto(s6)   4        16    23 p     midsize  19.5 fail
# 19 chevrolet    c1500 suburban 2wd   5.3  2008     8 auto(l4)   r        14    20 r     suv      17   fail
# 20 chevrolet    c1500 suburban 2wd   5.3  2008     8 auto(l4)   r        11    15 e     suv      13   fail


## 3. 빈도표로 합격 판정 자동차 수 살펴보기 -- 빈도표: 변수의 각 값들이 몇 개씩 존재하는지
table(mpg$test) # 연비 합격 빈도표 생성
# fail pass
#  106  128


## 4. 막대 그래프로 빈도 표현하기
library(ggplot2) # ggplot2 로드
qplot(mpg$test) # 연비 합격 빈도 막대 그래프 생성


### 중첩 조건문
## 1. 중첩 조건문 활용하기
mpg$grade <- ifelse(mpg$total >= 30, "A",
                    ifelse(mpg$total >=20, "B", "C")) # total을 기준으로 A, B, C 등급 부여
head(mpg, 20) # 데이터 확인
#    manufacturer model              displ  year   cyl trans      drv     cty   hwy fl    class   total test  grade
#    <chr>        <chr>              <dbl> <int> <int> <chr>      <chr> <int> <int> <chr> <chr>   <dbl> <chr> <chr>
#  1 audi         a4                   1.8  1999     4 auto(l5)   f        18    29 p     compact  23.5 pass  B
#  2 audi         a4                   1.8  1999     4 manual(m5) f        21    29 p     compact  25   pass  B
#  3 audi         a4                   2    2008     4 manual(m6) f        20    31 p     compact  25.5 pass  B
#  4 audi         a4                   2    2008     4 auto(av)   f        21    30 p     compact  25.5 pass  B
#  5 audi         a4                   2.8  1999     6 auto(l5)   f        16    26 p     compact  21   pass  B
#  6 audi         a4                   2.8  1999     6 manual(m5) f        18    26 p     compact  22   pass  B
#  7 audi         a4                   3.1  2008     6 auto(av)   f        18    27 p     compact  22.5 pass  B
#  8 audi         a4 quattro           1.8  1999     4 manual(m5) 4        18    26 p     compact  22   pass  B
#  9 audi         a4 quattro           1.8  1999     4 auto(l5)   4        16    25 p     compact  20.5 pass  B
# 10 audi         a4 quattro           2    2008     4 manual(m6) 4        20    28 p     compact  24   pass  B
# 11 audi         a4 quattro           2    2008     4 auto(s6)   4        19    27 p     compact  23   pass  B
# 12 audi         a4 quattro           2.8  1999     6 auto(l5)   4        15    25 p     compact  20   pass  B
# 13 audi         a4 quattro           2.8  1999     6 manual(m5) 4        17    25 p     compact  21   pass  B
# 14 audi         a4 quattro           3.1  2008     6 auto(s6)   4        17    25 p     compact  21   pass  B
# 15 audi         a4 quattro           3.1  2008     6 manual(m6) 4        15    25 p     compact  20   pass  B
# 16 audi         a6 quattro           2.8  1999     6 auto(l5)   4        15    24 p     midsize  19.5 fail  C
# 17 audi         a6 quattro           3.1  2008     6 auto(s6)   4        17    25 p     midsize  21   pass  B
# 18 audi         a6 quattro           4.2  2008     8 auto(s6)   4        16    23 p     midsize  19.5 fail  C
# 19 chevrolet    c1500 suburban 2wd   5.3  2008     8 auto(l4)   r        14    20 r     suv      17   fail  C
# 20 chevrolet    c1500 suburban 2wd   5.3  2008     8 auto(l4)   r        11    15 e     suv      13   fail  C


## 2. 빈도표, 막대 그래프로 연비 등급 살펴보기
table(mpg$grade) # 등급 빈도표 생성
#   A   B   C
#  10 118 106

qplot(mpg$grade) # 등급 빈도 막대 그래프 생성


### 원하는 만큼 범주 만들기
mpg$grade2 <- ifelse(mpg$total >= 30, "A",
                     ifelse(mpg$total >= 25, "B",
                            ifelse(mpg$total >= 20, "C","D")))
head(mpg, 20)
table(mpg$grade2)
qplot(mpg$grade2)