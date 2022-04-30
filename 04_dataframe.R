english <- c(90, 80, 60, 70) # 영어 점수 variable 생성
english
## [1] 90 80 60 70

math <- c(50, 60, 100, 20) # 수학 점수 variable 생성
math
## [1]  50  60 100  20


# english, math로 data frame 생성해서 df_midterm에 할당
df_midterm <- data.frame(english, math)
df_midterm
##   english math
## 1      90   50
## 2      80   60
## 3      60  100
## 4      70   20


class <- c(1, 1, 2, 2)
df_midterm <- data.frame(english, math, class)
df_midterm
##   english math class
## 1      90   50     1
## 2      80   60     1
## 3      60  100     2
## 4      70   20     2

mean(df_midterm$english) # df_midterm의 english로 평균 산출
## [1] 75

mean(df_midterm$math) # df_midterm의 math로로 평균 산출
## [1] 57.5


df_midterm <- data.frame(english = c(90, 80, 60, 70),
                         math = c(50, 60, 100, 20),
                         class = c(1, 1, 2, 2))
df_midterm
##   english math class
## 1      90   50     1
## 2      80   60     1
## 3      60  100     2
## 4      70   20     2



####### practice
## data.frame()과 c()를 조합해 표의 내용을 데이터 프레임으로 만들어 출력해보세요.

product <- c("apple", "strawberry", "watermelon")
price <- c(1800, 1500, 3000)
sales_vol <- c(24, 38, 13) 
df_sales <- data.frame(product, price, sales_vol)
df_sales
##      product price sales_vol
## 1      apple  1800        20
## 2 strawberry  1500        38
## 3 watermelon  3000        13



## 앞에서 만든 데이터 프레임을 이용해 과일 가격 평균, 판매량 평균을 구해 보세요.

mean(df_sales$price)
## [1] 2100

mean(df_sales$sales_vol)
## [1] 25





