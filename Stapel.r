library("ggplot2") # Detta inkluderar biblioteket "ggplot2" så att funktioner från biblioteket kan användas.
setwd("C:\\Users\\vrike\\Downloads") #Detta ändrar den pekade directoryn på datorn som koden jobbar i. Kom ihåg att ändra detta innan koden testas!
PARTIER <- read.csv("VIS1Partisympatier.csv") #Detta läser filen från det pekade directoryt som vi definerar i raden ovan denna. Vi tilldelar denna fil namnet PARTIER. Kom ihåg att ändra detta innan koden testas!
graf1 <- ggplot(data = PARTIER, aes(x = reorder(Parti, Procent), # Här definerar vi våran funktion ggplot som graf1 och ger den ett par variabler, data, x, och y. Där Data pekar till raden ovan där vi definerar filen som vi jobbar i. x = reorder, tilldelar en variabel x och använder den inbyggda funktionen reorder på kolumnerna Parti och Procent i filen vi jobbar i som sorterar Partierna efter storleken på Procentsatserna
                                    y = Procent, fill = Parti)) + # variabeln y defineras som kolumen Procent som redan finns i PARTIER, vi ger också möjligheten att färga staplarna genom att skriva fill = Parti, detta kommer att användas senare.
    coord_flip() + # här lägger vi grafen ner.
    geom_bar(stat = "identity", show.legend = FALSE) + #Detta används så att det inte är frekvensen av Partier som räknas, utan istället Procenten. Eftersom geom_bar() som standard använder stat_count() för att plotta. Detta överskrivs genom stat_identity(), eller stat = "identity"
    xlab("Parti") + ylab("Procent(%)") + #detta sätter texten på xlabeln, och ylabeln till Procent(%), och Parti respektive.
    ggtitle("Svenska folkets partisympati i procent(%)") + #Detta sätter main-titeln på grafen 
    labs(caption = "K�lla: SCB Unders�kning",  # detta sätter en footnote på grafen
            fill = "Partier") + #här sätter vi också färgerna för staplarna
    theme_bw() +
    theme(axis.title.y = element_text(angle = 0, size = 14),
          axis.title.x = element_text(size = 14),
          plot.title = element_text(size = 14),
          plot.caption = element_text(size =10),
          axis.text.x = element_text(size = 14),
          axis.text.y = element_text(size = 14),
          panel.grid.major.y = element_blank()) + # här sätter vi xlabeln horizontellt
    scale_fill_manual(values= c("#009933", "#231977", "#6BB7EC", # dessa är färgerna för partierna
                                "#83CF39", "#1B49DD", "#EE2020", # vi hade dock ett problem med dessa, nämligen att staplarna sorterades efter 
                                "#DDDD00", "#AF0000", "grey"))    # bokstavsordning istället för storleksordning, så färgerna är inte rätt.

graf1  # detta callar funktionen graf1, och ritar ut grafen.