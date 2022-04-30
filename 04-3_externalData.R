installed.packages("readxl")
library(readxl)

df_exam <- read_excel("excel_exam.xlsx")  # 엑셀 파일을 불러와 df_exam에 할당
df_exam                                   # 출력
##       id class  math english science
##    <dbl> <dbl> <dbl>   <dbl>   <dbl>
## 1     1     1    50      98      50
## 2     2     1    60      97      60
## 3     3     1    45      86      78
## 4     4     1    30      98      58
## 5     5     2    25      80      65
## 6     6     2    50      89      98
## 7     7     2    80      90      45
## 8     8     2    90      78      25
## 9     9     3    20      98      15
## 10    10     3    50      98      45
## 11    11     3    65      65      65
## 12    12     3    45      85      32
## 13    13     4    46      98      65
## 14    14     4    48      87      12
## 15    15     4    75      56      78
## 16    16     4    58      98      65
## 17    17     5    65      68      98
## 18    18     5    80      78      90
## 19    19     5    89      68      87
## 20    20     5    78      83      58


mean(df_exam$english)
## [1] 84.9

mean(df_exam$science)
## [1] 59.45


df_exam_novar <- read_excel("excel_exam_novar.xlsx")
df_exam_novar
##   `1...1` `1...2` `50...3`  `98` `50...5`
##      <dbl>   <dbl>    <dbl> <dbl>    <dbl>
## 1       2       1       60    97       60
## 2       3       2       25    80       65
## 3       4       2       50    89       98
## 4       5       3       20    98       15
## 5       6       3       50    98       45
## 6       7       4       46    98       65
## 7       8       4       48    87       12

df_exam_novar <- read_excel("excel_exam_novar.xlsx", col_names = F)
df_exam_novar
##    ...1  ...2  ...3  ...4  ...5
## <dbl> <dbl> <dbl> <dbl> <dbl>
## 1     1     1    50    98    50
## 2     2     1    60    97    60
## 3     3     2    25    80    65
## 4     4     2    50    89    98
## 5     5     3    20    98    15
## 6     6     3    50    98    45
## 7     7     4    46    98    65
## 8     8     4    48    87    12


# 엑셀 파일의 세 번째 시트에 있는 데이터 불러오기
df_exam_sheet <- read_excel("excel_exam_sheet.xlsx", sheet = 3)
df_exam_sheet
##      id class  math english science
##    <dbl> <dbl> <dbl>   <dbl>   <dbl>
## 1     1     1    50      98      50
## 2     2     1    60      97      60
## 3     3     2    25      80      65
## 4     4     2    50      89      98
## 5     5     3    20      98      15
## 6     6     3    50      98      45
## 7     7     4    46      98      65
## 8     8     4    48      87      12


df_csv_exam <- read.csv("csv_exam.csv")
df_csv_exam
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


# data frame to .csv 
df_midterm <- data.frame(english = c(90, 80, 60, 70),
                         math = c(50, 60, 100, 20),
                         class = c(1, 1, 2, 2))
df_midterm
##   english math class
## 1      90   50     1
## 2      80   60     1
## 3      60  100     2
## 4      70   20     2

write.csv(df_midterm, file = "df_midterm.csv")


# .rds :: R 전용 데이터 파일
saveRDS(df_midterm, file = "df_midterm.rds")


rm(df_midterm) # remove data
df_midterm
## Error: object 'df_midterm' not found


df_midterm <- readRDS("df_midterm.rds") # read .rds
df_midterm
##   english math class
## 1      90   50     1
## 2      80   60     1
## 3      60  100     2
## 4      70   20     2



## summary 

# 1. 변수 만들기, 데이터 프레임 만들기
english <- c(90, 80, 60, 70)                # 영어 점수 변수 생성 
math <- c(50, 60, 100, 20)                  # 수학 점수 변수 생성 
df_midterm <- data.frame(english, math)     # 데이터 프레임 생성

# 2. 외부 데이터 이용하기

# 엑셀 파일
library(readxl)                               # readxl 패키지 로드
df_exam <- read_excel("excel_exam.xlsx")      # 엑셀 파일 불러오기

# CSV 파일
df_csv_exam <- read.csv("csv_exam.csv")         # CSV 파일 불러오기
write.csv(df_midterm, file = "df_midterm.csv")  # CSV 파일로 저장하기

# RDS 파일
load("df_midterm.rds")                          # RDS 파일 불러오기
save(df_midterm, file = "df_midterm.rds")       # RDS 파일로 저장하기