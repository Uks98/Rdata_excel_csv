install.packages("dplyr")
library("dplyr")

exam <- read.csv("csv_exam.txt")
exam

#조건에 맞는 행 출력하기
# dplyr은 파이프 연산자 사용해서 함수를 나열한다 ctrl + shift + M이 단축키다.
exam %>% filter(class == 1)

#수학 점수가 50점 미만인 사람 
exam %>% filter(math < 50)

#영어점수가 80점인 사람
exa