library("ggplot2") # Detta inkluderar biblioteket "ggplot2" sÃ¥ att funktioner frÃ¥n biblioteket kan anvÃ¤ndas.
setwd("C:\\Users\\vrike\\Downloads") #Detta Ã¤ndrar den pekade directoryn pÃ¥ datorn som koden jobbar i. Kom ihÃ¥g att Ã¤ndra detta innan koden testas!
PARTIER <- read.csv("VIS1Partisympatier.csv") #Detta lÃ¤ser filen frÃ¥n det pekade directoryt som vi definerar i raden ovan denna. Vi tilldelar denna fil namnet PARTIER. Kom ihÃ¥g att Ã¤ndra detta innan koden testas!
graf1 <- ggplot(data = PARTIER, aes(x = reorder(Parti, Procent), # HÃ¤r definerar vi vÃ¥ran funktion ggplot som graf1 och ger den ett par variabler, data, x, och y. DÃ¤r Data pekar till raden ovan dÃ¤r vi definerar filen som vi jobbar i. x = reorder, tilldelar en variabel x och anvÃ¤nder den inbyggda funktionen reorder pÃ¥ kolumnerna Parti och Procent i filen vi jobbar i som sorterar Partierna efter storleken pÃ¥ Procentsatserna
                                    y = Procent, fill = Parti)) + # variabeln y defineras som kolumen Procent som redan finns i PARTIER, vi ger ocksÃ¥ mÃ¶jligheten att fÃ¤rga staplarna genom att skriva fill = Parti, detta kommer att anvÃ¤ndas senare.
    coord_flip() + # hÃ¤r lÃ¤gger vi grafen ner.
    geom_bar(stat = "identity", show.legend = FALSE) + #Detta anvÃ¤nds sÃ¥ att det inte Ã¤r frekvensen av Partier som rÃ¤knas, utan istÃ¤llet Procenten. Eftersom geom_bar() som standard anvÃ¤nder stat_count() fÃ¶r att plotta. Detta Ã¶verskrivs genom stat_identity(), eller stat = "identity"
    xlab("Parti") + ylab("Procent(%)") + #detta sÃ¤tter texten pÃ¥ xlabeln, och ylabeln till Procent(%), och Parti respektive.
    ggtitle("Svenska folkets partisympati i procent(%)") + #Detta sÃ¤tter main-titeln pÃ¥ grafen 
    labs(caption = "K�lla: SCB Unders�kning",  # detta sÃ¤tter en footnote pÃ¥ grafen
            fill = "Partier") + #hÃ¤r sÃ¤tter vi ocksÃ¥ fÃ¤rgerna fÃ¶r staplarna
    theme_bw() + # detta tar g�r bakgrunden vit
    theme(axis.title.y = element_text(angle = 0, size = 14), # h�r s�tter vi y labeln horizontellt och �ndrar storleken
          axis.title.x = element_text(size = 14), # h�r �ndrar vi storlek f�r x label
          plot.title = element_text(size = 14), # h�r �ndrar vi storlek f�r titel
          plot.caption = element_text(size =10), # h�r �ndrar vi storlek f�r caption
          axis.text.x = element_text(size = 14), # h�r �ndrar vi storlek f�r x axel texten
          axis.text.y = element_text(size = 14), # h�r �ndrar vi storlek f�r y axel texten
          panel.grid.major.y = element_blank()) +  # h�r tar vi bort st�dlinjerna f�r y axeln
    scale_fill_manual(values= c("#009933", "#231977", "#6BB7EC", # dessa Ã¤r fÃ¤rgerna fÃ¶r partierna
                                "#83CF39", "#1B49DD", "#EE2020", # vi hade dock ett problem med dessa, nÃ¤mligen att staplarna sorterades efter 
                                "#DDDD00", "#AF0000", "grey"))    # bokstavsordning istÃ¤llet fÃ¶r storleksordning, sÃ¥ fÃ¤rgerna Ã¤r inte rÃ¤tt.

graf1  # detta callar funktionen graf1, och ritar ut grafen.
