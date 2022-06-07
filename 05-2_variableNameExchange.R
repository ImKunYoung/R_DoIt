setwd("C:/Users/ur2ku/OneDrive/바탕 화면/WORKSPACE/[R]workspace/R_practice_/R_practice_/")
# 05-2 변수명 바꾸기

## 1. 2개의 변수로 구성된 데이터 프레임 생성하기
df_raw <- data.frame(var1 = c(1, 2, 1),
                     var2 = c(2, 3, 2))
df_raw
# var1 var2
# 1    1    2
# 2    2    3
# 3    1    2


## 2. rename() 함수 이용을 위한 dplyr 패키지 설치
install.packages("dplyr") # dplyr 설치  => 데이터를 원하는 형태로 가공할 때 사용하는 패키지
library(dplyr) # dplyr 로드

## 3. 데이터 프레임 복사본 만들기
df_new <- df_raw
df_new
#   var1 var2
# 1    1    2
# 2    2    3
# 3    1    2


## 4. 변수명 바꾸기
df_new <- rename(df_new, v2 = var2) # var2를 v2로 수정
df_new
#   var1 v2
# 1    1  2
# 2    2  3
# 3    1  2


## 5. 원본 df_raw와 복사본 df_new 비교해보기
df_raw
#   var1 var2
# 1    1    2
# 2    2    3
# 3    1    2

df_new
#   var1 v2
# 1    1  2
# 2    2  3
# 3    1  2



########## mpg 데이터의 변수명을 긴 단어로 바꾸기
library(ggplot2)
mpg <- as.data.frame(ggplot2::mpg)
head(mpg)
#   manufacturer model displ year cyl      trans drv cty hwy fl   class
# 1         audi    a4   1.8 1999   4   auto(l5)   f  18  29  p compact
# 2         audi    a4   1.8 1999   4 manual(m5)   f  21  29  p compact
# 3         audi    a4   2.0 2008   4 manual(m6)   f  20  31  p compact
# 4         audi    a4   2.0 2008   4   auto(av)   f  21  30  p compact
# 5         audi    a4   2.8 1999   6   auto(l5)   f  16  26  p compact
# 6         audi    a4   2.8 1999   6 manual(m5)   f  18  26  p compact

library(dplyr)
mpg_rename <- mpg
head(mpg_rename)
#   manufacturer model displ year cyl      trans drv cty hwy fl   class
# 1         audi    a4   1.8 1999   4   auto(l5)   f  18  29  p compact
# 2         audi    a4   1.8 1999   4 manual(m5)   f  21  29  p compact
# 3         audi    a4   2.0 2008   4 manual(m6)   f  20  31  p compact
# 4         audi    a4   2.0 2008   4   auto(av)   f  21  30  p compact
# 5         audi    a4   2.8 1999   6   auto(l5)   f  16  26  p compact
# 6         audi    a4   2.8 1999   6 manual(m5)   f  18  26  p compact

rename(mpg_rename, city = cty)
rename(mpg_rename, highway = hwy)
#     manufacturer                  model displ year cyl      trans drv cty highway fl      class
# 1           audi                     a4   1.8 1999   4   auto(l5)   f  18      29  p    compact
# 2           audi                     a4   1.8 1999   4 manual(m5)   f  21      29  p    compact
# 3           audi                     a4   2.0 2008   4 manual(m6)   f  20      31  p    compact
# 4           audi                     a4   2.0 2008   4   auto(av)   f  21      30  p    compact

head(mpg_rename)
#   manufacturer model displ year cyl      trans drv cty hwy fl   class
# 1         audi    a4   1.8 1999   4   auto(l5)   f  18  29  p compact
# 2         audi    a4   1.8 1999   4 manual(m5)   f  21  29  p compact
# 3         audi    a4   2.0 2008   4 manual(m6)   f  20  31  p compact
# 4         audi    a4   2.0 2008   4   auto(av)   f  21  30  p compact
# 5         audi    a4   2.8 1999   6   auto(l5)   f  16  26  p compact
# 6         audi    a4   2.8 1999   6 manual(m5)   f  18  26  p compact

mpg_rename <- rename(mpg_rename, city = cty)
mpg_rename <- rename(mpg_rename, highway = hwy)
head(mpg_rename)
#   manufacturer model displ year cyl      trans drv city highway fl   class
# 1         audi    a4   1.8 1999   4   auto(l5)   f   18      29  p compact
# 2         audi    a4   1.8 1999   4 manual(m5)   f   21      29  p compact
# 3         audi    a4   2.0 2008   4 manual(m6)   f   20      31  p compact
# 4         audi    a4   2.0 2008   4   auto(av)   f   21      30  p compact
# 5         audi    a4   2.8 1999   6   auto(l5)   f   16      26  p compact
# 6         audi    a4   2.8 1999   6 manual(m5)   f   18      26  p compact

############################ 답지
mpg <- as.data.frame(ggplot2::mpg) # mpg 데이터 불러오기
mpg_new <- mpg # 복사본 만들기

mpg_new <- rename(mpg_new, city = cty) # cty를 city로 수정
mpg_new <- rename(mpg_new, highway = hwy) # hwy를 highway로 수정

head(mpg_new) # 데이터 일부 출력