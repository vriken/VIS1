library("ggplot2") # Detta inkluderar biblioteket "ggplot2" så att funktioner från biblioteket kan användas.
setwd("//ad.liu.se/home/akero580/Desktop") #Detta ändrar den pekade directoryn på datorn som koden jobbar i. Kom ihåg att ändra detta innan koden testas!
datan <- read.csv2("VIS1 Lon.csv")#Detta läser filen från det pekade directoryt som vi definerar i raden ovan denna. Vi tilldelar denna fil namnet datan. Kom ihåg att ändra detta innan koden testas!
 
ggplot(datan, aes(Lon)) + # detta skapar och ropar på en funktion ggplot med variablerna datan, och en aesthetic för Lon kolumnen i datan
  xlab("Lön") + ylab("Frekvens") +  # här sätter vi labels för x och y, Lön, och Frekvens respektive.
  labs(caption = "Källa: Utdrag för lönedatabasen på NotReal AB", title = "Fördelning av lön på NotReal AB") + # här sätter vi en footnote och en titel för grafen
  geom_histogram(fill = "Purple") # här tilldelar vi funktionen ggplot ett histogram som använder sig av "datan" och aes(Lon), och gör alla staplar Lila
