## 06-2 조건에 맞는 데이터만 추출하기
library(dplyr)

## 1. dplyr 패키지 로드, csv 파일 데이터 프레임으로 만들어 출력
exam <- read.csv("csv_exam.csv")
exam
#    id class math english science
# 1   1     1   50      98      50
# 2   2     1   60      97      60
# 3   3     1   45      86      78
# 4   4     1   30      98      58
# 5   5     2   25      80      65


## 2. filter() -> 특정 행 추출
exam %>% filter(class == 1) # exam에서 class가 1인 경우만 추출해 출력
#   id class math english science
# 1  1     1   50      98      50
# 2  2     1   60      97      60
# 3  3     1   45      86      78
# 4  4     1   30      98      58


## 3. 2반 학생 추출
exam %>% filter(class == 2) # 2반인 경우만 추출
#   id class math english science
# 1  5     2   25      80      65
# 2  6     2   50      89      98
# 3  7     2   80      90      45
# 4  8     2   90      78      25


## 4. !1반인 학생 추출
exam %>% filter(class != 1) # 1반이 아닌 경우
#    id class math english science
# 1   5     2   25      80      65
# 2   6     2   50      89      98
# 3   7     2   80      90      45
# 4   8     2   90      78      25
# 5   9     3   20      98      15
# 6  10     3   50      98      45
# 7  11     3   65      65      65
# 8  12     3   45      85      32
# 9  13     4   46      98      65
# 10 14     4   48      87      12
# 11 15     4   75      56      78
# 12 16     4   58      98      65
# 13 17     5   65      68      98
# 14 18     5   80      78      90
# 15 19     5   89      68      87
# 16 20     5   78      83      58


exam %>% filter(class != 3) # 3반이 아닌 경우
#    id class math english science
# 1   1     1   50      98      50
# 2   2     1   60      97      60
# 3   3     1   45      86      78
# 4   4     1   30      98      58
# 5   5     2   25      80      65
# 6   6     2   50      89      98
# 7   7     2   80      90      45
# 8   8     2   90      78      25
# 9  13     4   46      98      65
# 10 14     4   48      87      12
# 11 15     4   75      56      78
# 12 16     4   58      98      65
# 13 17     5   65      68      98
# 14 18     5   80      78      90
# 15 19     5   89      68      87
# 16 20     5   78      83      58


## 6. 특정 조건 (초과, 미만, 이상, 이하) 걸기

exam %>% filter(math > 50) # 수학 점수가 50점을 초과한 경우
#    id class math english science
# 1   2     1   60      97      60
# 2   7     2   80      90      45
# 3   8     2   90      78      25
# 4  11     3   65      65      65
# 5  15     4   75      56      78
# 6  16     4   58      98      65
# 7  17     5   65      68      98
# 8  18     5   80      78      90
# 9  19     5   89      68      87
# 10 20     5   78      83      58


exam %>% filter(math < 50) # 수학 점수가 50점 미만인 경우
#   id class math english science
# 1  3     1   45      86      78
# 2  4     1   30      98      58
# 3  5     2   25      80      65
# 4  9     3   20      98      15
# 5 12     3   45      85      32
# 6 13     4   46      98      65
# 7 14     4   48      87      12


exam %>% filter(english >= 80) # 영어 점수가 80점 이상인 경우
#    id class math english science
# 1   1     1   50      98      50
# 2   2     1   60      97      60
# 3   3     1   45      86      78
# 4   4     1   30      98      58
# 5   5     2   25      80      65
# 6   6     2   50      89      98
# 7   7     2   80      90      45
# 8   9     3   20      98      15
# 9  10     3   50      98      45
# 10 12     3   45      85      32
# 11 13     4   46      98      65
# 12 14     4   48      87      12
# 13 16     4   58      98      65
# 14 20     5   78      83      58


exam %>% filter(english <= 80) # 영어 점수가 80점 이하인 경우
#   id class math english science
# 1  5     2   25      80      65
# 2  8     2   90      78      25
# 3 11     3   65      65      65
# 4 15     4   75      56      78
# 5 17     5   65      68      98
# 6 18     5   80      78      90
# 7 19     5   89      68      87


## 7. 여러 조건을 충족하는 행 추출 (and)
exam %>% filter(class == 1 & math >= 50) # 1반이면서 수학 점수가 50점 이상인 경우
#   id class math english science
# 1  1     1   50      98      50
# 2  2     1   60      97      60


exam %>% filter(class == 2 & english >= 80) # 2반이면서 영어 점수가 80점 이상인 경우
#   id class math english science
# 1  5     2   25      80      65
# 2  6     2   50      89      98
# 3  7     2   80      90      45


## 8. 여러 조건 중 하나 이상 충족하는 행 추출하기 (또는)
exam %>% filter(math >= 90 | english >= 90) # 수학 점수가 90점 이상이거나 영어 점수가 90점 이상인 경우
#   id class math english science
# 1  1     1   50      98      50
# 2  2     1   60      97      60
# 3  4     1   30      98      58
# 4  7     2   80      90      45
# 5  8     2   90      78      25
# 6  9     3   20      98      15
# 7 10     3   50      98      45
# 8 13     4   46      98      65
# 9 16     4   58      98      65


exam %>% filter(english < 90 | science < 50) # 영어 점수가 90점 미만이거나 과학 점수가 50점 미만인 경우
#    id class math english science
# 1   1     1   50      98      50
# 2   3     1   45      86      78
# 3   4     1   30      98      58
# 4   5     2   25      80      65
# 5   6     2   50      89      98
# 6   7     2   80      90      45
# 7   8     2   90      78      25
# 8   9     3   20      98      15
# 9  10     3   50      98      45
# 10 11     3   65      65      65
# 11 12     3   45      85      32
# 12 14     4   48      87      12
# 13 15     4   75      56      78
# 14 17     5   65      68      98
# 15 18     5   80      78      90
# 16 19     5   89      68      87
# 17 20     5   78      83      58


## 8. 목록에 해당하는 행 추출하기
exam %>% filter(class==1 | class==3 | class==5) # 1, 3, 5반에 햐당하면 추출
#    id class math english science
# 1   1     1   50      98      50
# 2   2     1   60      97      60
# 3   3     1   45      86      78
# 4   4     1   30      98      58
# 5   9     3   20      98      15
# 6  10     3   50      98      45
# 7  11     3   65      65      65
# 8  12     3   45      85      32
# 9  17     5   65      68      98
# 10 18     5   80      78      90
# 11 19     5   89      68      87
# 12 20     5   78      83      58


## 8-2. %in% 기호와 c() 사용하여 추출   ..(매치 연산자: matching operator)
exam %>% filter(class %in% c(1, 3, 5)) # 1, 3, 5반에 햐당하면 추출
#    id class math english science
# 1   1     1   50      98      50
# 2   2     1   60      97      60
# 3   3     1   45      86      78
# 4   4     1   30      98      58
# 5   9     3   20      98      15
# 6  10     3   50      98      45
# 7  11     3   65      65      65
# 8  12     3   45      85      32
# 9  17     5   65      68      98
# 10 18     5   80      78      90
# 11 19     5   89      68      87
# 12 20     5   78      83      58


## 9. 추월한 행으로 데이터 만들기
class1 <- exam %>% filter(class==1) # class가 1인 행 추출, class1에 할당
class2 <- exam %>% filter(class==2) # class가 2인 행 추출, class2에 할당

mean(class1$math) # 1반 수학 점수 평균 구하기
# [1] 46.25

mean(class2$math) # 2반 수학 점수 평균 구하기
# [1] 61.25



## 혼자서 해보기
## mpg 데이터를 이용해 분석 문제를 해결하시오


## Q1. 자동차 배기량에 따라 고속도로 연비가 다른지 알아보려고 한다. displ (배기량)이 4이하인 자동차와 5이상인 자동차 중 어떤 자동차의 hwy (고속도로 연비)가 평균적으로 더 높은지 알아보시오
mpg <- as.data.frame(ggplot2::mpg)
str(mpg)
mpg4 <- mpg %>% filter(displ<=4)
mpg5 <- mpg %>% filter(displ>=5)

mean(mpg4$hwy)
# [1] 25.96319
mean(mpg5$hwy)
# [1] 18.07895
# -> 배기량이 4이하인 자동차의 연비가 5이상인 자동차의 연비보다 평균적으로 8마일 더 높다.


## Q2. 자동차 제조 회사에 따라 도시 연비가 다른지 알아보려고 한다. "audi"와 "toyota"중 어느 manufacturer (자동차 제조 회사)의 cty(도시 연비)가 평균적으로 더 높은지 알아보시오.
str(mpg)
mean( (mpg %>% filter(mpg$manufacturer=='audi'))$cty )
# [1] 17.61111

mean( (mpg %>% filter(mpg$manufacturer=='toyota'))$cty )
# [1] 18.52941

## -> 토요타의 도시 연비가 더 높음


## Q3. "chevrolet", "ford", "honda" 자동차의 고속도로 연비 평균을 알아보려고 한다. 이 회사들의 데이터를 추출한 후 hwy 전체 평균을 구해라.
table(mpg$manufacturer)
#       audi  chevrolet      dodge       ford      honda    hyundai       jeep land rover    lincoln    mercury     nissan    pontiac     subaru     toyota volkswagen
#         18         19         37         25          9         14          8          4          3          4         13          5         14         34         27

mpg %>% filter(mpg$manufacturer %in% c('chevrolet', 'ford', 'honda'))

mean((mpg %>% filter(mpg$manufacturer %in% c('chevrolet', 'ford', 'honda')))$hwy)
# [1] 22.50943



############ 답지
# p355