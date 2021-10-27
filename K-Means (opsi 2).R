library("fpc")
library("factoextra")

dataIkan <- read.csv("Ikan.csv", stringsAsFactors=TRUE, fileEncoding="UTF-8-BOM")
head(dataIkan)
summary(dataIkan)
ciriIkan <- dataIkan[, 6:7]

plot(ciriIkan, pch=16)
set.seed(62)
km.res <- kmeans(ciriIkan, 7)
fviz_cluster(km.res, ciriIkan, geom = "point", ellipse.type = "euclid", ellipse.level = 0.5)
