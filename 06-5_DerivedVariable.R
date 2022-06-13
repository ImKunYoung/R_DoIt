# 06-5 파생변수 추가하기 :: mutate()

## 1. 파생변수 추가하기
str(exam)
# 'data.frame':	20 obs. of  5 variables:
#  $ id     : int  1 2 3 4 5 6 7 8 9 10 ...
#  $ class  : int  1 1 1 1 2 2 2 2 3 3 ...
#  $ math   : int  50 60 45 30 25 50 80 90 20 50 ...
#  $ english: int  98 97 86 98 80 89 90 78 98 98 ...
#  $ science: int  50 60 78 58 65 98 45 25 15 45 ...

exam %>%
  mutate(total = math+english+science) %>%      # 총합 변수 추가
  head()                                        # 일부 추출
#   id class math english science total
# 1  1     1   50      98      50   198
# 2  2     1   60      97      60   217
# 3  3     1   45      86      78   209
# 4  4     1   30      98      58   186
# 5  5     2   25      80      65   170
# 6  6     2   50      89      98   237

## 2. 여러 파생변수 한 번에 추가하기
exam  %>%
  mutate(total = math + english + science,          # 총합 변수 추가
         mean = (math + english + science)/3) %>%   # 총평균 변수 추가
  head()                                            # 일부 추출
#   id class math english science total     mean
# 1  1     1   50      98      50   198 66.00000
# 2  2     1   60      97      60   217 72.33333
# 3  3     1   45      86      78   209 69.66667
# 4  4     1   30      98      58   186 62.00000
# 5  5     2   25      80      65   170 56.66667
# 6  6     2   50      89      98   237 79.00000


## 3. mutate()에 ifelse() 적용하기
exam %>%
  mutate(test = ifelse(science >= 60, "paas", "fail")) %>%
  head()
#   id class math english science test
# 1  1     1   50      98      50 fail
# 2  2     1   60      97      60 paas
# 3  3     1   45      86      78 paas
# 4  4     1   30      98      58 fail
# 5  5     2   25      80      65 paas
# 6  6     2   50      89      98 paas

# 4. 추가한 변수를 dplyr 코드에 바로 활용하기
exam %>%
  mutate(total = math + english + science) %>%  # 총합 변수 추가
  arrange(total) %>%                            # 총합 변수 기준 정렬
  head()                                        # 일부 추출
#   id class math english science total
# 1  9     3   20      98      15   133
# 2 14     4   48      87      12   147
# 3 12     3   45      85      32   162
# 4  5     2   25      80      65   170
# 5  4     1   30      98      58   186
# 6  8     2   90      78      25   193

## 예제
# q1.
mpg <- library(ggplot2::mpg)
mpg_copy <- mpg
mpg_copy <- mpg_copy %>% mutate(total = hwy + cty)
head(mpg_copy)

mpg_copy$total2 <- mpg_copy$cty + mpg_copy$hwy

# q2
mpg_copy <- mpg_copy %>% mutate(average_total = total/2)
head(mpg_copy)

# q3
mpg_copy %>%
  arrange(desc(average_total)) %>%
  head(3)

# q4
library(dplyr)
mpg <- library(ggplot2::mpg)

mpg %>%
  mutate(total = cty + hwy,
         mean = total/2) %>%
  arrange(desc(total)) %>%
  head(3)


