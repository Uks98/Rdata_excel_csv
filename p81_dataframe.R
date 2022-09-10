english <- c(90,80,79,60)
english


math <- c(50,60,100,20)
math

class <- c(1,1,2,2)
class

data.frame(english, math, class)
df_midterm <- data.frame(english, math, class)
df_midterm

mean(df_midterm$english)
mean(df_midterm$math)

df_fruit = data.frame(제품 = c("사과",1800,24),가격 = c("딸기",1500,38),판매량 = c("수박",3000,13))
df_fruit
View(df_fruit)