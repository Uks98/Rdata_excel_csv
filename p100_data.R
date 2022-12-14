

exam <- read.csv("csv_exam.txt")
exam
#head() 함수 사용시 데이터의 앞부분을 출력한다,
#파라미터에 숫자입력시 입력한 행까지 데이터 출력
head(exam,10)

#데이터의 뒷부분 확인
tail(exam,3)

#데이터가 들어있는 변수들의 속성을 보여준다
str(exam)

#데이터가 몇 행, 몇 열로 구성되어있는지 알아보기
#앞에 숫자가 행 뒤는 열
dim(exam)

#요약 통계량 산출하기
summary(exam)

#데이터프레임으로 변경
# :: 사용 시 특정 패키지에 함수나 데이터 지정가능
mpg <- as.data.frame(ggplot2::mpg)
mpg

head(mpg)
tail(mpg)
dim(mpg)

str(mpg)

?mpg


#5-2 변수명 바꾸기

df_raw <- data.frame(var1 = c(1,2,1),var2 = c(2,3,2))
df_raw

# 변수명을 변경하기 위한 패키지 설치
install.packages("dplyr")
library(dplyr)

#원본 유지하고 복사본으로 작업
df_new <- df_raw
df_new

#기존 변수명에 새 변수명
df_new <- rename(df_new, V2 = var2)
df_new <- rename(df_new, V1 = var1)

df_new

#혼자 해보기
df_mpg = as.data.frame(ggplot2::mpg)
df_mpg

df_new_mpg <- rename(df_mpg,city = cty, highway = hwy)
df_new_mpg
head(df_new_mpg)

#파생변수 만들어보기

df <- data.frame(var1 = c(2,3,4), var2 = c(2,6,1))
df
df$var_sum <- df$var1 + df$var2
df

df$var_mean <- (df$var1+df$var2)/2
df

#mpg 통합 연비 변수 만들기
df_car <- as.data.frame(ggplot2::mpg)
df_car

#도로 유형을 통합한 연비변수 생성
df_car$total = (df_car$cty + df_car$hwy) / 2
head(df_car)

#고연비 합격 판정을 받은 자동차
summary(df_car$total)

#히스토그램을 그려 연비분포 확인
hist(df_car$total)

#조건문 작성
df_car$test <- ifelse(df_car$total >= 20, "pass", "fail")
head(df_car,20)

#빈도표를 작성해 합격 판정 자동차 수 알아보기
table(df_car$test)

#막대그래프로 빈도 표현하기
qplot(df_car$test)

#중첩 조건문 만들기
df_car$grade <- ifelse(df_car$total >= 30,  "A",ifelse(df_car$total >= 20 ,"B","C"))
df_car

df_table_grade <-table(df_car$grade)
df_table_grade


#막대그래프 생성 (grade)
qplot(df_car$grade)


#분석 실습
df_midwest2 <- as.data.frame(ggplot2::midwest)
df_midwest2

#변수명 변경하기
df_midwest <- df_midwest2
df_midwest <- rename(df_midwest,total =poptotal, asian = popasian)
head(df_midwest,3)

df_midwest$asia_mean = df_midwest$asian / df_midwest$total * 100
head(df_midwest$asia_mean)
#히스토그램
hist(df_midwest$asia_mean)

mean(df_midwest$asia_mean)

#아시아 인구 백분율 전체 평균중 초과면 large 그 이외에는 small
df_midwest$df_asia <- ifelse(df_midwest$asia_mean >= 0.48, "large","small")
head(df_midwest)

#막대 그래프로 빈도 확인
qplot(df_midwest$df_asia)
