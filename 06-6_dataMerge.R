# 06-7 데이터 합치기

# 가로로 합치기 (열, 변수 합치기)

# 중간고사 데이터 생성
test1 <- data.frame(id=c(1, 2, 3, 4, 5),
                    midterm = c(60, 80, 70, 90, 85))

# 기말고사 데이터 생성
test2 <- data.frame(id = c(1, 2, 3, 4, 5),
                    final = c(70, 85, 65, 95, 80))

test1 # test1 출력
#   id midterm
# 1  1      60
# 2  2      80
# 3  3      70
# 4  4      90
# 5  5      85

test2 # test2 출력
#   id final
# 1  1    70
# 2  2    85
# 3  3    65
# 4  4    95
# 5  5    80


# left_join()  :: dplyr (열 합치기, 기준점 by)
total <- left_join(test1, test2, by = "id") # id를 기준으로 합쳐 total에 할당
total # total 출력
#   id midterm final
# 1  1      60    70
# 2  2      80    85
# 3  3      70    65
# 4  4      90    95
# 5  5      85    80


#
name <- data.frame(class = c(1, 2, 3, 4, 5),
                   teacher = c("kim", "lee", "park", "choi", "jung"))
name
#   class teacher
# 1     1     kim
# 2     2     lee
# 3     3    park
# 4     4    choi
# 5     5    jung


exam_new <- left_join(exam, name, by ="class")
exam_new
#    id class math english science teacher
# 1   1     1   50      98      50     kim
# 2   2     1   60      97      60     kim
# 3   3     1   45      86      78     kim
# 4   4     1   30      98      58     kim
# 5   5     2   25      80      65     lee
# 6   6     2   50      89      98     lee
# 7   7     2   80      90      45     lee
# 8   8     2   90      78      25     lee
# ..


# 세로로 합치기 (행 합치기, union) bind_rows()
# 학생 1~5번 시험 데이터 생성
group_a <- data.frame(id = c(1, 2, 3, 4, 5),
                      test = c(60, 80, 70, 90, 85))

# 학생 6~10번 시험 데이터 생성
group_b <- data.frame(id = c(6, 7, 8, 9, 10),
                      test = c(70, 83, 65, 95, 80))

group_a # group_a 출력
#   id test
# 1  1   60
# 2  2   80
# 3  3   70
# 4  4   90
# 5  5   85

group_b # group_b 출력
#   id test
# 1  6   70
# 2  7   83
# 3  8   65
# 4  9   95
# 5 10   80


# bind_rows() -> 세로로 합치기 (행 합침)
group_all <- bind_rows(group_a, group_b)            # 데이터 합쳐서 group_all에 할당
group_all                                           # group_all 출력
#    id test
# 1   1   60
# 2   2   80
# 3   3   70
# 4   4   90
# 5   5   85
# 6   6   70
# 7   7   83
# 8   8   65
# 9   9   95
# 10 10   80


# ** 주의사항: bind_rows() 할때는 두 데이터의 변수명이 같아야 함.





# 혼자서 해보기 :: 정답 p157
fuel <- data.frame(fl = c("c", "d", "e", "p", "r"),
                   price_f1 = c(2.35, 2.38, 2.11, 2.76, 2.22))
fuel # 출력
#   fl price_f1
# 1  c     2.35
# 2  d     2.38
# 3  e     2.11
# 4  p     2.76
# 5  r     2.22

# q1
mpg <- left_join(mpg, fuel, by = "fl")

# q2
mpg %>%
  select(model, fl, price_f1) %>%
  head()
#   model fl price_f1
# 1    a4  p     2.76
# 2    a4  p     2.76
# 3    a4  p     2.76
# 4    a4  p     2.76
# 5    a4  p     2.76
# 6    a4  p     2.76
