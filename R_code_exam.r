## global fire disturbance 
# multitemporal global analysis (from 2018 to 2020)
# multitemporal analysis between continents (from january 2018 to august 2018)

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

# multiframe
par(mfrow=c(2,1))
plotRGB(global012018,r=3,g=2,b=1)
plotRGB(global012020,r=3,g=2,b=1)

# spectral indices
# dvi2020 = nir2020-red2020











