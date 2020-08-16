## global fire disturbance 
# multitemporal global analysis (from 2018 to 2020)

install.packages("raster")
library(raster)
setwd("C:/lab/") # windows
raster("c_gls_BA300_QL_201801100000_GLOBE_PROBAV_V1.0.1.tiff")
global012018 <- brick("c_gls_BA300_QL_201801100000_GLOBE_PROBAV_V1.0.1.tiff")
plot(global012018)

# graphics colors

cl <- colorRampPalette(c('blue','grey','white','yellow','orange','red'))(100)
plot(global012018,col=cl)

# 3 bande: R = rosso, G = verde, B = blu
# plotRGB("filename",r=3,g=2,b=1)

plotRGB(global012018,r=3,g=2,b=1)

# nir
clnir <- colorRampPalette(c('red','orange','yellow'))(100)
plot(global012018,col=clnir)

# $ per legare una delle 4 bande al dataset
plot(global012018$c_gls_BA300_QL_201801100000_GLOBE_PROBAV_V1.0.1.2,col=clnir)



global012020 <- brick("c_gls_BA300_QL_202001100000_GLOBE_PROBAV_V1.1.1.tiff")
plot(global012020)
plotRGB(global012020,r=3,g=2,b=1)
clnir <- colorRampPalette(c('red','orange','yellow'))(100)
plot(global012020,col=clnir)
plot(global012020$c_gls_BA300_QL_202001100000_GLOBE_PROBAV_V1.1.1.2,col=clnir)

# multiframe
par(mfrow=c(2,1))
plotRGB(global012018,r=3,g=2,b=1)
plotRGB(global012020,r=3,g=2,b=1)

# spectral indices
# dvi2020 = nir2020-red2020

dvi2018 <- global012018$c_gls_BA300_QL_201801100000_GLOBE_PROBAV_V1.0.1.2 - global012018$c_gls_BA300_QL_201801100000_GLOBE_PROBAV_V1.0.1.1
plot(dvi2018)

dvi2020 <- global012020$c_gls_BA300_QL_202001100000_GLOBE_PROBAV_V1.1.1.2 - global012020$c_gls_BA300_QL_202001100000_GLOBE_PROBAV_V1.1.1.1
plot(dvi2020)

# difdvi 2020 -2018
# multitemporal analysis

difdvi <- dvi2020 - dvi2018
plot(difdvi)
cldifdvi <- colorRampPalette(c('red','white','blue'))(100) 
plot(difdvi, col=cldifdvi)


# visualize the output
# multiframe 2018rgb, 2020rgb, difdiv
par(mfrow=c(3,1))
plotRGB(global012018, r=4, g=3, b=2, stretch="Lin")
plotRGB(global012020, r=4, g=3, b=2, stretch="Lin")
plot(difdvi, col=cldifdvi)

# Changing the grain (resolution)
global012020r <- aggregate(global012020, fact=10)
global012020
global012020r

plot(global012020r)
plotRGB(global012020r)

par(mfrow=c(2,1))
plotRGB(global012020, r=4, g=3, b=2, stretch="Lin")
plotRGB(global012020r, r=4, g=3, b=2, stretch="Lin")



## multitemporal analysis of land cover

install.packages("RStoolbox")
library(RStoolbox)
setwd("C:/lab/")
global012020 <- brick("c_gls_BA300_QL_202001100000_GLOBE_PROBAV_V1.1.1.tiff")

# landsat bands: 1b, 2g, 3r, 4nir
plotRGB(global012020,r=4,g=3,b=2,stretch="Lin")
global012020c <- unsuperClass(global012020, nClasses=3)
plot(global012020c$map)
clclass <- colorRampPalette(c('yellow', 'pink','black'))(100)
plot(global012020c$map, col=clclass)

plotRGB(global012018,r=4,g=3,b=2,stretch="Lin")
global012018c <- unsuperClass(global012020, nClasses=3)
plot(global012018c$map)
clclass <- colorRampPalette(c('yellow', 'pink','black'))(100)
plot(global012018c$map, col=clclass)

# plot delle due mappe ottenute
cl <- colorRampPalette(c('yellow','pink','black'))(100)
par(mfrow=c(2,1))
plot(global012020c$map, col=cl)
plot(global012018c$map, col=cl)


freq(global012020c$map)
# value 3= aree non coinvolte da incendi = 3905796
# value 2= aree coinvolte da incendi = 79435
totglobal012020 <- 3905796 + 79435
totglobal012020
# result: 3985231

percent1 <- freq(global012020c$map) * 100 / totglobal012020
percent1
# result:             value      count
[1,] 2.509265e-05 256.940313
[2,] 5.018530e-05   1.993235
[3,] 7.527794e-05  98.006765


freq(global012018c$map)
# value 3= aree non coinvolte da incendi = 3905796
# value 2= aree coinvolte da incendi = 10239665
totglobal012018 <- 10239665 + 3905796
totglobal012018
# result: 14145461

percent2 <- freq(global012018c$map) * 100 / totglobal012018
percent2
# result: value      count
[1,] 7.069406e-06  0.5615582
[2,] 1.413881e-05 72.3883442
[3,] 2.120822e-05 27.6116558

cover <- c("Nofiredisturbance","Firedisturbance")
before <- c(27.6,72.3)
after <- c(98,2)
output <- data.frame(cover,before,after)
output

library(ggplot2)
p1<-ggplot(output, aes(x=cover, y=before, color=cover)) + geom_bar(stat="identity", fill="white")
p2<-ggplot(output, aes(x=cover, y=after, color=cover)) + geom_bar(stat="identity", fill="white")
install.packages("gridExtra")
library(gridExtra)
grid.arrange(p1, p2, nrow = 1)















