
# x축 cty
qplot(data = mpg , x = hwy)

#x축 drv, y축 hwy
qplot(data = mpg,x = drv,y = hwy)

#x축 drv, y축 hwy, 선그래프형태
qplot(data = mpg, x = drv,y=hwy,geom = "line")

#x축 drv, y축 hwy, 상자 그림 형태
qplot(data = mpg, x = drv,y=hwy,geom = "boxplot")

#x축 drv, y축 hwy, drv색상 표시

qplot(data = mpg, x = drv, y = hwy, geom = "boxplot", colour = drv)
