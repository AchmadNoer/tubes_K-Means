dataIkan <- read.csv("Ikan.csv", stringsAsFactors=TRUE, fileEncoding="UTF-8-BOM")
head(dataIkan)
summary(dataIkan)

dataIkan.ciri <- dataIkan[, 6:7]
dataIkan.jenis <- dataIkan[, "Species"]
set.seed(62)
hasilKMeans <- kmeans(dataIkan.ciri, 7)

par(mfrow=c(1,2))
plot(dataIkan.ciri, col = hasilKMeans$cluster, pch=16, main="K-Means")
plot(dataIkan.ciri, col = dataIkan.jenis, pch=16, main="Original")

hasilKMeans$tot.withinss

dataIkan.ciri$cluster <- factor(hasilKMeans$cluster)
centers <- as.data.frame(hasilKMeans$centers)

library("ggplot2")
ggplot() + 
  geom_point(data = dataIkan.ciri, aes(x = Height, y = Width, color = cluster)) + 
  geom_point(data = centers, aes(x = Height, y = Width, color = "Center"), 
             size = 50, alpha = 0.2, show.legend = FALSE)
  