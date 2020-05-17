# Primo codice R

# installazione pacchetti, uso le virgolette per prendere qualcosa che è al di fuori di R, le citazioni successive senza virgolette
install.packages("sp")

library(sp)

# inserisco i dati di un data set, in questo caso meuse
data(meuse)

meuse

# head è funzione per inserire solo la parte iniziale di un data set, la testata
head(meuse)

# nomi delle variabili del data set
names(meuse)

# riassunto
summary(meuse)



# plot è funzione per mettere in relazione delle variabili (all'interno di meuse in questo caso) e si esprime con il dollaro $
plot(meuse$cadmium,meuse$lead)

# allegare dataframe permette di non usare piu meuse$
attach(meuse)
plot(cadmium,lead)

# grafico migliorato (pch : da cercare su google per prendere i caratteri, cex sta per character exageration, 
# quindi aumento dimensioni del carattere, mentre col sta per colore)
plot(cadmium,lead,pch=17,cex=3,col="yellow")

# pairs è funzione che comprende tanti plot ovvero fra tutte le variabili possibili del data set, 
# si apre un subset con la quadra seguita dalla virgola, i due punti indicano fino a che punto si arriva. La tilde si esegue con Alt+126
pairs(~cadmium+copper+lead,data=meuse)
pairs(meuse[,3:6])
pairs(meuse[,3:6],col="green")

# main = "nomegrafico"
main=primo pairs
