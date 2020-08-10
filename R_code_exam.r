## global fire disturbance 
# temporal analysis (february-august 2018)

install.packages("raster")
library(raster)
setwd("C:/lab/") # windows
global <- brick("global.tiff")
plot(global)

# labels 





# graphics colors
# B1: blue
# B2: grey
# B3: white
# B4: yellow
# B5: orange
# B6: red

cl <- colorRampPalette(c('blue','grey','white','yellow','orange','red'))(100) # 



# compairison between continents (june-august 2018)



