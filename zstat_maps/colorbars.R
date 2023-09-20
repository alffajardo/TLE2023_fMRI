#!/usr/bin/Rscript

library(viridis)
library(magrittr)
library(RColorBrewer)
rgb2col = function(rgbmat){
  # function to apply to each column of input rgbmat
  ProcessColumn = function(col){
    rgb(rgbmat[1, col], 
        rgbmat[2, col], 
        rgbmat[3, col], 
        maxColorValue = 255)
  }
  # Apply the function
  sapply(1:ncol(rgbmat), ProcessColumn)
}


# create the mako and the fire color bars

# create red-yellow bar

red_yellow <- colorRampPalette(colors = c("red","yellow","white"))

barplot(rep(1,1000), col = red_yellow(1000),border = red_yellow(1000),
        axes = F, main ="Zstat 1 (Sternberg Task Activation)",
         cex.main = 3)

red_blue <- colorRampPalette(colors = c("blue","white","red"))

par(bg = "black",col.main = "white")
barplot(rep(1,1000), col = red_blue(1000),border = red_blue(1000),
        axes = F, main ="Pearson Coefficient",
        cex.main = 2,xpd = T,args.legend = )
text(x = 0,-0.2,"-1.0",col = "white" ,xpd = NA, cex =1.5)
text(x = 600,-0.2,"0.0",col = "white" ,xpd = NA, cex =1.5)
text(x = 1200,-0.2,"1.0",col = "white" ,xpd = NA, cex =1.5)
## plot the figure
png("figS6_colorbar.png",width = 333,height = 205,units = "px")

par(mfrow = c(3,1),bg ="black",
    col.main = "white",mar = c(2,2,3,2))

barplot(rep(1,1000), col = red_yellow(1000),border = red_yellow(1000),
        axes = F, main ="Zstat 1",
        cex.main = 2)
barplot(rep(1,1000), col = plasma(1000),border = plasma(1000),
       axes = F, main ="GLM", cex.main = 2)

barplot(rep(1,1000), col = mako(1000),border = mako(1000),
        axes = F, main = "ANCOVA", cex.main = 2)
dev.off()


# wintercolours bar

winter_colors <- read.delim("colormaps/2winter.cmap",sep = " ",
                            header = F)
# sample 10 colors from the color bar

winter_indexes <- seq(1,256,length.out = 10) %>%
                  round(digits = 0)
winter_10 <- winter_colors[winter_indexes,] %>%
             as.matrix()

write.table(cbind(seq(0,1,length.out = 10),winter_10),"winter.csv",col.names = F,
            quote = F,row.names = F,sep = ",")
winter_10_hex <- rgb2col(rgbmat = t(winter_10 * 255))
# same for copper 

copper <- read.table("colormaps/copper.cmap")

copper_10 <- copper[c(winter_indexes[1:9],255),] %>%
             as.matrix()
copper_10_hex <- rgb2col(t(copper_10) * 255)

barplot(1:10:1:10, col =  copper_10_hex)

# write the colormap, 

write.table(cbind(seq(0,1,length.out = 10),copper_10),
            "copper.csv",
            quote = F,sep = ",",
            col.names = F,
            row.names = F)
