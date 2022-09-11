#조건에 맞게 데이터 전처리

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
exam %>% filter(english >= 80)

#1반이면서 수학점수가 50점 이상인 경우
exam %>%  filter(class == 1 & math >= 50)
#2반이면서 영어점수가 80점 이상인 사람
exam %>% filter(class == 2, english >= 80)

#여러 조건 중 하나만 일치하는 데이터 찾기
#수학점수가 90이상이면서 영어점수가 90이상인 사람

exam %>% filter(english >= 80 | math >= 90)

#목록에 해당하는 행 찾기
#1,3,5,반에 속하는 데이터 추출

exam %>% filter(class == 1 | class == 3 | class == 5)

#추출한 행으로 데이터 만들기

class1 = exam %>% filter(class == 1 )
mean(class1$math)

#실습해보기

#배기량이 4이하인 자동차와 5이상인 자동차 중 어떤 자동차의 고속도로 연비가 평균적으로 더 높은지 알아보자
mpg_org = as.data.frame(ggplot2::mpg)
mpg_org
mpg <- mpg_org

mpg_displ_4 <- mpg %>% filter(displ <= 4)
mpg_displ_5 <- mpg %>% filter(displ >= 5)

mean(mpg_displ_4$hwy)
mean(mpg_displ_5$hwy)

#제조회사에 따라 도시연비가 다른지 알아보자 도시연비가 평균적우로 높은 제조회사

mp <- as.data.frame(ggplot2::mpg)
mp1 <- mp
audi_man<- mp1 %>% filter(manufacturer == "audi")
toyota_man <- mp1 %>% filter(manufacturer == "toyota")
audi_man

mean(audi_man$cty)
mean(toyota_man$cty)

mpg_mean <- mpg %>% filter(manufacturer %in% c("chevrolet","ford","honda"))
mean(mpg_mean$hwy)

#6-3 필요한 변수만 추출하기

#select함수를 사용해 조건에 맞는 열 추출 
exam %>% select(math)

#여러 변수 추출하기
exam %>% select(class,math,english)

#변수 제외하기
exam %>% select(-math,-class)

exam %>%
  filter(class == 1) %>% 
  select(english)

#데이터 일부만 추출하기
exam %>% 
  select(id,math) %>%
  head

#실습
mpg_cl <- mpg %>% select(class,cty)
head(mpg_cl)

mpg_suv_mean <- mpg_cl %>% 
  filter(class == "suv") %>% 
  head()

mpg_compact_mean <- mpg_cl %>% 
  filter(class == "compact") %>% 
head()
mean(mpg_cl_mean$cty)
mean(mpg_compact_mean$cty)
  