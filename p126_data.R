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

#오름차순 정렬 수학점수가 낮은사람부터 높은사람까지
exam %>% arrange(math)

#내림차순 정렬
exam %>% arrange(desc(math))

#여러 항목 정렬
exam %>% arrange(class,math)

audi_hwy <- mpg %>% filter(manufacturer == "audi")
audi_hwy %>% arrange(desc(audi_hwy$hwy)) %>% head(5)

#파생변수 만들어보기
exam %>% mutate(total = math + english + science)

#파생변수 한번에 추가하기
exam %>% mutate(total = math + english + science,
                mean = (math + english + science)/3) %>% 
  head

#파생변수에 조건문 추가
exam %>% mutate(isPass = ifelse(science >= 60, "pass","fail"))

exam %>% mutate(total = science + math + english) %>% 
  arrange(desc(total)) %>% 
  head()

#문제풀어보기 
#mpg 데이터 복사본을 만들고 합산연비변수 추가

mpg_mutate <- as.data.frame(ggplot2::mpg)
mpg1 <- mpg_mutate
mpg1

mpg1 <- mpg1 %>% mutate(hwy2 = cty + hwy) %>% 
  head

#합산 연비 변수를 2로 나눠 평균 연비 변수추가
mpg1 <- mpg1 %>% mutate(mean = hwy2/2) %>% 
  head

#평균 연비 변수가 가장 높은 자동차 3종 데이터 출력
mpg1 %>% arrange(desc(mean)) %>% 
  head(3)

#위에 사항을 하나의 dplyr구문으로 작성해보기
mpg_mutate <- mpg_mutate %>% mutate(total = cty + hwy,mean = total/2) %>% 
  arrange(desc(mean)) %>% 
  head(3)
mpg_mutate

#집단별로 요약하기
# group_by로 변수 항목별로 분리한 후 summarise사용
exam %>% summarise(mean_math = mean(math))

exam %>% group_by(class) %>% 
  summarise(math_mean = mean(math))

#요약 통계량 한번에 산출하기
#n을 사용해서 각 반에 몇명이 있는지 알 수있음.
exam %>% group_by(class) %>% 
  summarise(mean_math = mean(math),sum_math = sum(math),median_math = median(math),n = n()) %>% 
  arrange(desc(mean_math))

#회사별로 집단을 나눈 후 다시 구동 방식별로 나눠 도시 연비 평균을 구하자
mpg %>% group_by(manufacturer,drv) %>% #회사별 구동 방식 별 분리
  summarise(mean_cty = mean(cty)) %>% #cty 평균 산출
  head(10)

#회사별로 suv 자동차의 도시 및 고속도로 통합연비 평균을 구해 내림차순으로 정렬한 후 1~5위까지 정렬하기
mpg %>% 
  group_by(manufacturer) %>% 
  filter(class == "suv") %>% mutate(total_hw = (hwy + cty)/2) %>% 
  summarise(total_mean = mean(total_hw)) %>% 
  arrange(desc(total_mean)) %>% 
  head(5)

#실습해보기

#어떤 차종의 도시 연비가 높은지 비교해보려한다. calss별 cty평균을 구해보세요,

mpg %>%
  group_by(class) %>% 
  summarise(cty_mean = mean(cty))

