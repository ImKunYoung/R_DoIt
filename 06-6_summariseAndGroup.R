## [p145] 06-6 집단별로 요약하기 :: group_by(), summarise()

# 집단별로 요약하기
exam %>% summarise(mean_math = mean(math)) # math 평균 산출
#   mean_math
# 1     57.45

mean(exam$math)
# [1] 57.45

# 집단별로 요약하기
exam %>%
  group_by(class) %>%                 # class 별로 분리
  summarise(mean_math = mean(math))   # math 평균 산출

#   class mean_math
#   <int>     <dbl>
# 1     1      46.2
# 2     2      61.2
# 3     3      45
# 4     4      56.8
# 5     5      78


# 3. 여러 요약 통꼐량 한 번에 산출하기
exam %>%
  group_by(class) %>%                           # class 별로 분리
  summarise(mean_math = mean(math),             # math 평균
            sum_math = sum(math),               # math 함계
            median_math = median(math),         # math 중앙 값
            n = n())                            # 힉생 수

#   class mean_math sum_math median_math     n
#   <int>     <dbl>    <int>       <dbl> <int>
# 1     1      46.2      185        47.5     4
# 2     2      61.2      245        65       4
# 3     3      45        180        47.5     4
# 4     4      56.8      227        53       4
# 5     5      78        312        79       4


# 4. 각 집단별로 다시 집단 나누기
mpg %>%
  group_by(manufacturer, drv) %>%         # 회사별, 구동 방식별 분리
  summarise(mean_cty = mean(cty)) %>%     # cty 평균 산출
  head(10)                                # 일부 출력
#    manufacturer drv   mean_cty
#    <chr>        <chr>    <dbl>
#  1 audi         4         16.8
#  2 audi         f         18.9
#  3 chevrolet    4         12.5
#  4 chevrolet    f         18.8
#  5 chevrolet    r         14.1
#  6 dodge        4         12
#  7 dodge        f         15.8
#  8 ford         4         13.3
#  9 ford         r         14.8
# 10 honda        f         24.4


# dplyr 조합하기
# 회사별로 "suv" 자동차의 도시 및 고속도로 통합 연비 평균을 구해 내림차순으로 정렬하고, 1~5위까지 출력하기
head(mpg, 20)
table(mpg %>% select(class))
#    2seater    compact    midsize    minivan     pickup subcompact        suv
#          5         47         41         11         33         35         62

mpg %>%
  filter(class=="suv") %>%
  group_by(manufacturer) %>%
  mutate(total = (hwy + cty)/2) %>%
  summarise(mean = mean(total)) %>%
  arrange(desc(mean)) %>%
  head(5)
# 1 subaru        21.9
# 2 toyota        16.3
# 3 nissan        15.9
# 4 mercury       15.6
# 5 jeep          15.6
