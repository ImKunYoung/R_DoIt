# 06-4 순서대로 정렬하기 :: arrange() 이용

exam %>%                # math 오름차순 정렬
  arrange(math) %>%
  head
#   id class math english science
# 1  9     3   20      98      15
# 2  5     2   25      80      65
# 3  4     1   30      98      58
# 4  3     1   45      86      78
# 5 12     3   45      85      32
# 6 13     4   46      98      65


exam %>%                  # math 내림차순 정렬
  arrange(desc(math)) %>%
  head()
#   id class math english science
# 1  8     2   90      78      25
# 2 19     5   89      68      87
# 3  7     2   80      90      45
# 4 18     5   80      78      90
# 5 20     5   78      83      58
# 6 15     4   75      56      78


exam %>%                  # class 및 math 오름차순 정렬
  arrange(class, math) %>%
  head(10)
#    id class math english science
# 1   4     1   30      98      58
# 2   3     1   45      86      78
# 3   1     1   50      98      50
# 4   2     1   60      97      60
# 5   5     2   25      80      65
# 6   6     2   50      89      98
# 7   7     2   80      90      45
# 8   8     2   90      78      25
# 9   9     3   20      98      15
# 10 12     3   45      85      32



## Practice
# Q1. "audi"에서 생산한 자동차 중에 어떤 자동차 모델의 hwy(고속도로 연비)가 높은지 알아보려고 한다. "audi"에서 생산한 자동차 중 hwy가 1~5위에 해당하는 자동차의 데이터를 출력해라
mpg <- as.data.frame(ggplot2::mpg)
library(dplyr)
df <- mpg %>% filter(manufacturer=="audi")

df %>%
  arrange(desc(hwy)) %>%
  head(5)
#   manufacturer      model displ year cyl      trans drv cty hwy fl   class
# 1         audi         a4   2.0 2008   4 manual(m6)   f  20  31  p compact
# 2         audi         a4   2.0 2008   4   auto(av)   f  21  30  p compact
# 3         audi         a4   1.8 1999   4   auto(l5)   f  18  29  p compact
# 4         audi         a4   1.8 1999   4 manual(m5)   f  21  29  p compact
# 5         audi a4 quattro   2.0 2008   4 manual(m6)   4  20  28  p compact

### 정답 p357
# Q1.
mpg <- as.data.frame(ggplot2::mpg)        # mpg 데이터 불러오기
mpg %>%
  filter(manufacturer=="audi") %>%        # audi 추출
  arrange(desc(hwy)) %>%                  # hwy 내림차순 정렬
  head(5)                                 # 5행까지 출력
#   manufacturer      model displ year cyl      trans drv cty hwy fl   class
# 1         audi         a4   2.0 2008   4 manual(m6)   f  20  31  p compact
# 2         audi         a4   2.0 2008   4   auto(av)   f  21  30  p compact
# 3         audi         a4   1.8 1999   4   auto(l5)   f  18  29  p compact
# 4         audi         a4   1.8 1999   4 manual(m5)   f  21  29  p compact
# 5         audi a4 quattro   2.0 2008   4 manual(m6)   4  20  28  p compact

