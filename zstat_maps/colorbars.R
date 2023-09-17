#!/usr/bin/Rscript

library(viridis)
library(magrittr)
library(RColorBrewer)

# create the mako and the fire color bars

# create red-yellow bar

red_yellow <- colorRampPalette(colors = c("red","yellow","white"))

barplot(rep(1,1000), col = red_yellow(1000),border = red_yellow(1000),
        axes = F, main ="Zstat 1 (Sternberg Task Activation)",
         cex.main = 3)

red_blue <- colorRampPalette(colors = c("red","white","blue"))

barplot(rep(1,1000), col = red_blue(1000),border = red_blue(1000),
        axes = F, main ="Zstat 1 (Sternberg Task Activation)",
        cex.main = 3)
## plot the figure
png("figS6_colorbar.png",width = 333,height = 205,units = "px")

par(mfrow = c(3,1),bg ="black",
    col.main = "white",mar = c(2,2,2,2))

barplot(rep(1,1000), col = red_yellow(1000),border = red_yellow(1000),
        axes = F, main ="Zstat 1 (Sternberg Task Activation)",
        cex.main = 1)
barplot(rep(1,1000), col = plasma(1000),border = plasma(1000),
       axes = F, main ="GLM", cex.main = 1)

barplot(rep(1,1000), col = mako(1000),border = mako(1000),
        axes = F, main = "ANCOVA", cex.main = 1)
dev.off()


