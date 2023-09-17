#!/usr/bin/Rscript

library(viridis)
library(magrittr)
library(RColorBrewer)

# create the mako and the fire color bars

# create red-yellow bar

red_yellow <- colorRampPalette(colors = c("red","yellow"))

barplot(rep(1,1000), col = red_yellow(1000),border = red_yellow(1000),
        axes = F, main ="Zstat 1 (Sternberg Task Activation)",
         cex.main = 3)


## plot the figure
png("figS6_colorbar.png",width = 666,height = 410,units = "px")

par(mfrow = c(3,1),bg ="black",
    col.main = "white",mar = c(1.5,1.5,1.5,1.5))

barplot(rep(1,1000), col = red_yellow(1000),border = red_yellow(1000),
        axes = F, main ="Zstat 1 (Sternberg Task Activation)",
        cex.main = 2)
barplot(rep(1,1000), col = plasma(1000),border = plasma(1000),
       axes = F, main ="GLM", cex.main = 2)

barplot(rep(1,1000), col = mako(1000),border = mako(1000),
        axes = F, main = "ANCOVA", cex.main = 2)
dev.off()


