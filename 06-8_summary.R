# dplyr 패키지 함수 요약
setwd("C:/Users/ur2ku/OneDrive/바탕 화면/WORKSPACE/[R]workspace/R_practice_/R_practice_/")
library(dplyr)
library(ggplot2)
mpg <- as.data.frame(ggplot2::mpg)
exam <- read.csv("csv_exam.csv")
exam
## 1. 조건에 맞는 데이터만 추출하기
exam %>% filter(english >= 80)

# 여러 조건 동시 충족
exam %>% filter(class == 1 & math >= 50)

# 여러 조건 중 하나 이상 충족
exam %>% filter(math >= 90 | english >= 90)
exam %>% filter(class %in% c(1, 3, 5))

## 2. 필요한 변수만 추출하기
exam %>% select(math)
exam %>% select(class, math, english)

## 3. 함수 조합하기, 일부만 출력하기
exam %>%
  select(id, math) %>%
  head(10)

## 4. 순서대로 정렬하기
exam %>% arrange(math) # 오름차순 정렬
exam %>% arrange(desc(math)) # 내림차순 정렬
exam %>% arrange(class, math) # 여러 변수 기준 오름차순 정렬

## 5. 파생변수 추가하기
exam %>% mutate(total = math + english + science)

# 여러 파생변수 한 번에 추가하기
exam %>%
  mutate(total = math + english + science,
         mean = (math + english + science) / 3)

# mutate()에 iflese() 적용하기
exam %>%
  mutate(test = ifelse(science >= 60, "paas", "fail"))

# 추가한 변수를 dplyr 코드에 바로 활용하기
exam %>%
  mutate(total = math + english + science) %>%
  arrange(total)

## 6. 집단별로 요약하기
exam %>%
  group_by(class) %>%
  summarise(mean_math = mean(math))

# 각 집단별로 다시 집단 나누기
mpg %>%
  group_by(manufacturer, drv) %>%
  summarise(mean_cty = mean(cty))

## 7. 데이터 합치기
# 가로로 합치기
total <- left_join(test1, test2, by ="id")

# 세로 합치기
group_all <- bind_rows(group_a, group_b)


## 연습 문제  정답 361
midwest <- as.data.frame(ggplot2::midwest)

# 문제 1
midwest <- midwest %>%
  mutate(df= 100-(popadults/poptotal*100))

# 문제 2
midwest %>%
  select(county, df) %>%
  arrange(desc(df)) %>%
  head(5)

# 문제 3
midwest <- midwest %>% mutate(standard = ifelse(df >= 40, "large",
                                                ifelse(df>=30, "middle", "small")))
table(midwest$standard)

# 문제 4
midwest <- midwest %>% mutate(perAsian = popasian/poptotal*100)

midwest %>%
  select(state, county, perAsian) %>%
  arrange(perAsian) %>%
  head(10)

# or
midwest %>%
  mutate(perAsian = popasian/poptotal*100) %>%
  select(state, county, perAsian) %>%
  arrange(perAsian) %>%
  head(10)