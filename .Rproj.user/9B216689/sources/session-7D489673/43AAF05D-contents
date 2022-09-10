
#프로젝트 폴더에 엑셀파일
install.packages("readxl")
library(readxl)

#엑셀 파일을 데이터 프레임으로 읽어온다.
df_excel = read_excel("excel_exam.xlsx")
df_excel

# 다른 경로 엑셀 파일 불러오기
#df_exam = read_excel("C:\R3\rso22\")

mean(df_excel$english)
mean(df_excel$math)

#첫번째 행이 변수명이 아닐경우
#col_name 인자값 사용 시 변수명이 숫자로 자동지정
df_novar = read_excel("C:/Rdata_excel/excel_exam_novar.xlsx",col_names = FALSE)
df_novar

#시트가 여러개 있을경우
df_pr_sheet <- read_excel("excel_exam.xlsx",sheet = 1)
df_pr_sheet

#csv파일 불러오기, 첫번째 행에 변수명이 없을 시 header파라미터 지정
#문자 CSV는 stringAsFactors = F 지정해줘야 변수를 문자타입으로 불러온다.
df_csv_exam <- read.csv("csv_exam.txt",header = F)
df_csv_exam

#데이터 프레임을 csv로 저장하기

df_modterm <- data.frame(english = c(90,80,60,70),math=c(50,60,100,20), class=c(1,1,2,2))
df_modterm

# file 파라미터에 파일명
write.csv(df_modterm, file = "df_midterm.csv")
