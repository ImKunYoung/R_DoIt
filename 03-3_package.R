# ggplot2 패키지 설치
install.packages("ggplot2")

# ggplot2 패키지 로드
library(ggplot2)


# 여러 문자로 구성된 변수 생성
x <- c("a", "a", "b", "c")
x

# 빈도 막대 그래프 출력
qplot(x)


# data에 mpg, x축에 hwy 변수 지정해 그래프 생성
qplot(data=mpg, x=hwy)

# x축 drv, y축 hwy
qplot(data=mpg, x=drv, y=hwy)

# x축 drv, y축 hwy, 선 그래프 형태
qplot(data=mpg, x=drv, y=hwy, geom="line")

# x축 drv, y축 hwy, 상자 그림 형태
qplot(data=mpg, x=drv, y=hwy, geom="boxplot")

# x축 drv, y축 hwy, 상자 그림 형태, drv별 색 표현
qplot(data=mpg, x=drv, y=hwy, geom = "boxplot", colour = drv)


# qplot 함수 메뉴얼 출력
?qplot
