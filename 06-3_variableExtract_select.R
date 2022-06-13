## 06-3 필요한 변수만 추출하기

## 1. 변수 추출하기
exam %>% select(math) # math 추출
#    math
# 1    50
# 2    60
# 3    45
# 4    30
# 5    25
# 6    50
# 7    80
# .. .. ..

## 2. 변수 추출하기
exam %>% select(english) # english 추출
#    english
# 1       98
# 2       97
# 3       86
# 4       98
# 5       80
# 6       89
# 7       90
# ..     ..

## 3. 여러 변수 추출
exam %>% select(class, math, english) # class, math, english 변수 추출
#    class math english
# 1      1   50      98
# 2      1   60      97
# 3      1   45      86
# 4      1   30      98
# 5      2   25      80
# .. .. .. .. ..

## 4. 변수 제외
exam %>% select(-math) # math 제외
#    id class english science
# 1   1     1      98      50
# 2   2     1      97      60
# 3   3     1      86      78
# 4   4     1      98      58
# 5   5     2      80      65
# ..

## 5. 변수 제외
exam %>% select(-math, -english) # math, english 제외
#    id class science
# 1   1     1      50
# 2   2     1      60
# 3   3     1      78
# 4   4     1      58
# 5   5     2      65
# 6   6     2      98
# 7   7     2      45
# ..



## dplyr 함수 조합하기

# 1. filter()와 select() 조합
exam %>% filter(class == 1) %>% select(english) # class가 1인 행만 추출한 다음 english 추출
#   english
# 1      98
# 2      97
# 3      86
# 4      98

# 2. 가독성 있게 줄 바꾸기
exam %>%
  filter(class == 1) %>% # class가 1인 행 추출
  select(english) # english 추출

# 3. 일부만 출력하기
exam %>%
  select(id, math) %>%    # id, math 추출
  head                    # 앞부분 6행까지 추출
#   id math
# 1  1   50
# 2  2   60
# 3  3   45
# 4  4   30
# 5  5   25
# 6  6   50

# 4. 일부만 출력하기
exam %>%
  select(id, math) %>%    # id, math 추출
  head(10)                # 앞부분 10행까지 추출
#    id math
# 1   1   50
# 2   2   60
# 3   3   45
# 4   4   30
# 5   5   25
# 6   6   50
# 7   7   80
# 8   8   90
# 9   9   20
# 10 10   50

exam %>%
  select(id, math) %>%
  summary()
#        id             math
#  Min.   : 1.00   Min.   :20.00
#  1st Qu.: 5.75   1st Qu.:45.75
#  Median :10.50   Median :54.00
#  Mean   :10.50   Mean   :57.45
#  3rd Qu.:15.25   3rd Qu.:75.75
#  Max.   :20.00   Max.   :90.00

summary(
  exam %>%
    select(id, math))
#        id             math
#  Min.   : 1.00   Min.   :20.00
#  1st Qu.: 5.75   1st Qu.:45.75
#  Median :10.50   Median :54.00
#  Mean   :10.50   Mean   :57.45
#  3rd Qu.:15.25   3rd Qu.:75.75
#  Max.   :20.00   Max.   :90.00



## practice (p356)
## Q1. mpg 데이터는 11개 변수로 구성되어 있습니다. 이 중 일부만 추출해 분석에 활용하려고 한다. mpg 데이터에서 class(자동차 종류), cty(도시 연비) 변수를 추출해 새로운 데이터를 만ㄷ르어라. 새로 만든 데이터의 일부를 출력해 두 변수로만 구성되어 있는지 확인해라
dim(mpg)
# [1] 234  11
str(mpg)
# 'data.frame':	234 obs. of  11 variables:
#  $ manufacturer: chr  "audi" "audi" "audi" "audi" ...
#  $ model       : chr  "a4" "a4" "a4" "a4" ...
#  $ displ       : num  1.8 1.8 2 2 2.8 2.8 3.1 1.8 1.8 2 ...
#  $ year        : int  1999 1999 2008 2008 1999 1999 2008 1999 1999 2008 ...
#  $ cyl         : int  4 4 4 4 6 6 6 4 4 4 ...
#  $ trans       : chr  "auto(l5)" "manual(m5)" "manual(m6)" "auto(av)" ...
#  $ drv         : chr  "f" "f" "f" "f" ...
#  $ cty         : int  18 21 20 21 16 18 18 18 16 20 ...
#  $ hwy         : int  29 29 31 30 26 26 27 26 25 28 ...
#  $ fl          : chr  "p" "p" "p" "p" ...
#  $ class       : chr  "compact" "compact" "compact" "compact" ...

mpg_new <- mpg %>%
  select(class, cty)

head(mpg_new)
#     class cty
# 1 compact  18
# 2 compact  21
# 3 compact  20
# 4 compact  21
# 5 compact  16
# 6 compact  18


## Q2. 자동차 종류에 따라 도시 연비가 다른지 알아보려고 한다. 앞에서 추출한 데이터를 이용해 class(자동차 종류)가 "suv"인 자동차와 "compact"인 자동차 중 어떤 자동차의 cty (도시 연비) 평균이 더 높은지 알아봐라.
str(mpg_new)
# data.frame':	234 obs. of  2 variables:
#  $ class: chr  "compact" "compact" "compact" "compact" ...
#  $ cty  : int  18 21 20 21 16 18 18 18 16 20 ...

head(mpg_new)
#     class cty
# 1 compact  18
# 2 compact  21
# 3 compact  20
# 4 compact  21
# 5 compact  16
# 6 compact  18

table(mpg_new$class)
#    2seater    compact    midsize    minivan     pickup subcompact        suv
#          5         47         41         11         33         35         62

mpg_new_compact <- mpg_new %>% filter(class=='compact')
mpg_new_suv <- mpg_new %>% filter(class=='suv')

mean(mpg_new_compact$cty)
# [1] 20.12766

mean(mpg_new_suv$cty)
# [1] 13.5

# compact 의 도시 연비가 더 좋다,


####### 정답 p356
# q1
mpg <- as.data.frame(ggplot2::mpg) # mpg 데이터 불러오기

df <- mpg %>% select(class, cty) # class, cty 변수 추출
head(df) # df 일부 추출

# q2.
df_suv <- df %>% filter(class=='suv') # class가 suv인 행 추출
df_compact <- df %>% filter(class=='compact') # class가 compact인 행 추출

mean(df_suv$cty) # suv의 cty 평균
# [1] 13.5
mean(df_compact$cty) # compact의 cty 평균
# [1] 20.12766