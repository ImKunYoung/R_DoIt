setwd("C:/Users/ur2ku/OneDrive/바탕 화면/WORKSPACE/[R]workspace/R_practice_/R_practice_/")
exam <- read.csv('csv_exam.csv')


# 1. head() - 데이터 앞부분 확인하기
head(exam) # 앞에서부터 6행까지 출력
##   id class math english science
## 1  1     1   50      98      50
## 2  2     1   60      97      60
## 3  3     1   45      86      78
## 4  4     1   30      98      58
## 5  5     2   25      80      65
## 6  6     2   50      89      98


head(exam, n = 10) # 앞에서부터 10행까지 출력
##    id class math english science
## 1   1     1   50      98      50
## 2   2     1   60      97      60
## 3   3     1   45      86      78
## 4   4     1   30      98      58
## 5   5     2   25      80      65
## 6   6     2   50      89      98
## 7   7     2   80      90      45
## 8   8     2   90      78      25
## 9   9     3   20      98      15
## 10 10     3   50      98      45


# 2. tail() - 데이터 뒷부분 확인하기
tail(exam) # 뒤에서부터 6행까지 출력
##    id class math english science
## 15 15     4   75      56      78
## 16 16     4   58      98      65
## 17 17     5   65      68      98
## 18 18     5   80      78      90
## 19 19     5   89      68      87
## 20 20     5   78      83      58


tail(exam, n = 10) # 뒤에서부터 10행까지 출력
##    id class math english science
## 11 11     3   65      65      65
## 12 12     3   45      85      32
## 13 13     4   46      98      65
## 14 14     4   48      87      12
## 15 15     4   75      56      78
## 16 16     4   58      98      65
## 17 17     5   65      68      98
## 18 18     5   80      78      90
## 19 19     5   89      68      87
## 20 20     5   78      83      58


# 3. View() - 뷰어 창에서 데이터 확인하기
View(exam)


# 4. dim() - 데이터가 몇 행, 몇 열로 구성되어 있는지 알아보기
dim(exam) # 행, 열 출력
## [1] 20 5


# 5. str() - 속성 파악하기
str(exam) # 데이터 속성 확인
## 'data.frame':   20 obs. of  5 variables:
## $ id     : int  1 2 3 4 5 6 7 8 9 10 ...
## $ class  : int  1 1 1 1 2 2 2 2 3 3 ...
## $ math   : int  50 60 45 30 25 50 80 90 20 50 ...
## $ english: int  98 97 86 98 80 89 90 78 98 98 ...
## $ science: int  50 60 78 58 65 98 45 25 15 45 ...

# obs(관측치) == row(행)


# 6. summary() - 요약 통계량 산출하기
summary(exam)
##        id            class        math          english        science
## Min.   : 1.00   Min.   :1   Min.   :20.00   Min.   :56.0   Min.   :12.00
## 1st Qu.: 5.75   1st Qu.:2   1st Qu.:45.75   1st Qu.:78.0   1st Qu.:45.00
## Median :10.50   Median :3   Median :54.00   Median :86.5   Median :62.50
## Mean   :10.50   Mean   :3   Mean   :57.45   Mean   :84.9   Mean   :59.45
## 3rd Qu.:15.25   3rd Qu.:4   3rd Qu.:75.75   3rd Qu.:98.0   3rd Qu.:78.00
## Max.   :20.00   Max.   :5   Max.   :90.00   Max.   :98.0   Max.   :98.00


## mpg 데이터 파악하기
# 1. ggplot2 패키지 설치
install.packages("ggplot2")


# 2. ggplot2 패키지의 mpg 데이터를 불러와 데이터 프레임 생성
mpg <- as.data.frame(ggplot2::mpg)


# 3. head(), tail(), View() -> 데이터 파악하기
head(mpg) # Raw 데이터 앞부분 확인
##   manufacturer model displ year cyl      trans drv cty hwy fl   class
## 1         audi    a4   1.8 1999   4   auto(l5)   f  18  29  p compact
## 2         audi    a4   1.8 1999   4 manual(m5)   f  21  29  p compact
## 3         audi    a4   2.0 2008   4 manual(m6)   f  20  31  p compact
## 4         audi    a4   2.0 2008   4   auto(av)   f  21  30  p compact
## 5         audi    a4   2.8 1999   6   auto(l5)   f  16  26  p compact
## 6         audi    a4   2.8 1999   6 manual(m5)   f  18  26  p compact

tail(mpg) # Raw 데이터 뒷부분 확인
##     manufacturer  model displ year cyl      trans drv cty hwy fl   class
## 229   volkswagen passat   1.8 1999   4   auto(l5)   f  18  29  p midsize
## 230   volkswagen passat   2.0 2008   4   auto(s6)   f  19  28  p midsize
## 231   volkswagen passat   2.0 2008   4 manual(m6)   f  21  29  p midsize
## 232   volkswagen passat   2.8 1999   6   auto(l5)   f  16  26  p midsize
## 233   volkswagen passat   2.8 1999   6 manual(m5)   f  18  26  p midsize
## 234   volkswagen passat   3.6 2008   6   auto(s6)   f  17  26  p midsize
View(mpg) #Raw 데이터 뷰어 창에서 확인


# 4. dim()을 이용해 데이터가 행열 알아보기
dim(mpg)
## [1] 234  11


# 5. str()을 이용해 각 변수의 속성 알아보기
str(mpg)
## 'data.frame':	234 obs. of  11 variables:
## $ manufacturer: chr  "audi" "audi" "audi" "audi" ...
## $ model       : chr  "a4" "a4" "a4" "a4" ...
## $ displ       : num  1.8 1.8 2 2 2.8 2.8 3.1 1.8 1.8 2 ...
## $ year        : int  1999 1999 2008 2008 1999 1999 2008 1999 1999 2008 ...
## $ cyl         : int  4 4 4 4 6 6 6 4 4 4 ...
## $ trans       : chr  "auto(l5)" "manual(m5)" "manual(m6)" "auto(av)" ...
## $ drv         : chr  "f" "f" "f" "f" ...
## $ cty         : int  18 21 20 21 16 18 18 18 16 20 ...
## $ hwy         : int  29 29 31 30 26 26 27 26 25 28 ...
## $ fl          : chr  "p" "p" "p" "p" ...
## $ class       : chr  "compact" "compact" "compact" "compact" ...


## 열(attribute) 설명 보려면 ? 이용
help(mpg)
## mpg {ggplot2}
## R Documentation
## Fuel economy data from 1999 to 2008 for 38 popular models of cars
## Description
## This dataset contains a subset of the fuel economy data that the EPA makes available on https://fueleconomy.gov/ . It contains only models which had a new release every year between 1999 and 2008 - this was used as a proxy for the popularity of the car.
## Usage
## mpg
## Format
## A data frame with 234 rows and 11 variables:
## manufacturer
## manufacturer name
## model
## model name
## displ
## engine displacement, in litres
## year
## year of manufacture
## cyl
## number of cylinders
## trans
## type of transmission
## drv
## the type of drive train, where f = front-wheel drive, r = rear wheel drive, 4 = 4wd
## cty
## city miles per gallon
## hwy
## highway miles per gallon
## fl
## fuel type
## class
## "type" of car


# 6. summary()를 이용해 요약 통계량 살펴봄
summary(mpg) # 요약 통계량 출력
## argument encoding="UTF-8" is ignored in MBCS locales
## manufacturer          model               displ            year           cyl           trans
## Length:234         Length:234         Min.   :1.600   Min.   :1999   Min.   :4.000   Length:234
## Class :character   Class :character   1st Qu.:2.400   1st Qu.:1999   1st Qu.:4.000   Class :character
## Mode  :character   Mode  :character   Median :3.300   Median :2004   Median :6.000   Mode  :character
## Mean   :3.472   Mean   :2004   Mean   :5.889
## 3rd Qu.:4.600   3rd Qu.:2008   3rd Qu.:8.000
## Max.   :7.000   Max.   :2008   Max.   :8.000
## drv                 cty             hwy             fl               class
## Length:234         Min.   : 9.00   Min.   :12.00   Length:234         Length:234
## Class :character   1st Qu.:14.00   1st Qu.:18.00   Class :character   Class :character
## Mode  :character   Median :17.00   Median :24.00   Mode  :character   Mode  :character
## Mean   :16.86   Mean   :23.44
## 3rd Qu.:19.00   3rd Qu.:27.00
## Max.   :35.00   Max.   :44.00
