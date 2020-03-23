#Primo codice R

# installazione pacchetti
install.packages("sp")

library(sp)

data(meuse)

meuse

head(meuse)


plot(meuse$cadmium,meuse$lead)


attach(meuse)
plot(cadmium,lead)

#grafico migliorato: colore, simbolo
plot(cadmium,lead,pch=17,cex=3,col="yellow")

pairs(meuse[,3:6])
pairs(meuse[,3:6],col="green")
