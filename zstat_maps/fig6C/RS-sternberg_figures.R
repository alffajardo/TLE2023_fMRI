#!/usr/bin/Rscript

# load packages
library(neurobase)
library(papayar)
library(fslr)
library(imager)
library(tidyverse)
library(viridis)
library(purrr)
library(stringr)
## functions for transforming coordinates 
MNI2vox <- function (matrix_x_y_z, voxel_size = 2 ){
  
  x <- matrix_x_y_z[,1]
  y <- matrix_x_y_z[,2]
  z <- matrix_x_y_z[,3]
  
  x1 <- (1/-voxel_size) * (x - 90)
  y1 <- (1  / voxel_size) * (y + 126)
  z1 <-  (1  / voxel_size) * (z + 72)
  
  m <- cbind(x1,y1,z1)
  colnames(m) <- c("x","y","z")
  return(m)
}
vox2MNI <- function(matrix_x_y_z, voxel_size = 2 ){
  
  x <- matrix_x_y_z[,1]
  y <- matrix_x_y_z[,2]
  z <- matrix_x_y_z[,3]
  
  x1 <- -voxel_size * (x - 90/voxel_size)
  y1 <- voxel_size* (y -126/voxel_size)
  z1 <- voxel_size* (z - 72/voxel_size)
  
  m <- cbind(x1,y1,z1)
  colnames(m) <- c("x","y","z")
  return(m)
}
# Import color maps
cmap_files <- dir(path = "/home/alfonso/Documents/github/proyecto_RS/colormaps",full.names = T)
cmap_names <- basename(cmap_files) %>% str_remove_all(".cmap")
cmaps <- map(cmap_files,.f = ~read.table(file = .x,header = F) %>% rgb) %>%
  set_names(cmap_names)
# lightbox view function 

lightbox_axial <- function(overlay,underlay = MNI, cmap = cmaps$`red-yellow`,nslices=9,...) {
  
  
  slice <- seq(24,72,length.out = nslices)
  overlay.nifti(x = underlay,NA.x = T,NA.y = T, y  = overlay,col.y = cmap,plane = "axial",
                z = slice,plot.type = "single",...,)
}

# Function to plot color bar
color.bar <- function(lut, min, max=-min, nticks=11, ticks=seq(min, max, len=nticks), title='') {
  scale = (length(lut)-1)/(max-min)
  
  # dev.new(width=1.75, height=5)
  plot(c(0,10), c(min,max), type='n', bty='n', xaxt='n', xlab='', yaxt='n', ylab='', main=title)
  axis(2, ticks, las=1)
  for (i in 1:(length(lut)-1)) {
    y = (i-1)/scale + min
    rect(0,y,10,y+1/scale, col=lut[i], border=NA)
  }	
}
par(bg = "black")
color.bar(lut = cmaps$`red-yellow`,min = 0, max = 1)
color.bar(lut = rev(cmaps$`blue-lightblue`),min = 0,max = 1)
color.bar(lut = cmaps$copper,min = 0, max = 1)
color.bar(lut = cmaps$`2winter_iso`,min = 0, max = 1)

# MNI atlas

MNI  <- readNIfTI2("/usr/local/fsl/data/standard/MNI152_T1_2mm_brain.nii.gz")


###################################################################
###################################################################
# read only those constast that showed betweeen groups diferences #
###################################################################
####################################################################


#""""""""""""""""""""""""""""""""""""
#"" Ipsilateral supramarginal gyrus""
#""""""""""""""""""""""""""""""""""""

ISMG_one_sample <- readNIfTI2("one_sample_stats/one_sample_roi03_tfce_both.nii.gz")
ISMG_tstat3 <- readNIfTI2("stats/stats_roi_03_tfce_corrp_tstat3.nii.gz")

lightbox_axial(ISMG_one_sample,underlay = MNI, cmap = c(rev(cmaps$`blue-lightblue`),cmaps$`red-yellow`),
                                         zlim.y = c(-1.15,1.15) )
MNI_coords <- cbind(0,0,seq(24,72,length.out = 9)) %>%
  vox2MNI() %>% t () %>% 
  subset(c(F, F, T)) %>%
  sort(decreasing = T) %>%
  matrix(3,3) %>%
  apply(2,rev)

labels <- paste("z = ",MNI_coords,sep = " ")
x <- c(0.08,0.48,.86) %>% rep(3)
y <- c(-.18, .24,.73) %>% rep(3) %>% sort()
text(x,y,labels,xpd = T, col = "white",cex=1.5)
                 
## tstat 1 healthy > TLE

ortho2(MNI,y = ISMG_tstat3, col.y = cmaps$copper,xyz = c(33,90,46),crosshairs = F,
       mfrow = c(1,3),zlim.y = c(0,1),bg = "white",NA.x = T, NA.y = T)
c1 <- vox2MNI(cbind(33,90,46))

text(c(0.1,0.47,.87),c(0.1,.1,.1),paste(c("x = ", "y = ", "z = "),c1,sep = ''),
     xpd = T,col = "black",cex= 2)
text(0.5,.9 , 'I.SMG\n Healthy > TLE (a)',col = "black", cex = 3)


ortho2(MNI,y = ISMG_tstat3, col.y = cmaps$copper,xyz = c(22,67,56),crosshairs = F,
       mfrow = c(1,3),zlim.y = c(0,1),add = T,bg = "white", NA.x = T, NA.y = T)

c1 <- vox2MNI(cbind(22,67,56))

text(c(0.1,0.47,.87),c(0.1,.1,.1),paste(c("x = ", "y = ", "z = "),c1,sep = ''),
     xpd = T,col = "black",cex= 2)
text(0.5,.9 , 'I.SMG\n Healthy > TLE (b)',col = "black", cex = 3)

#""""""""""""""""""""""""""""""""""""
#"" Ipsilateral supramarginal gyrus""
#""""""""""""""""""""""""""""""""""""

IFP_one_sample <- readNIfTI2("one_sample_stats/one_sample_roi09_tfce_both.nii.gz")

lightbox_axial(IFP_one_sample,underlay = MNI, cmap = c(rev(cmaps$`blue-lightblue`),cmaps$`red-yellow`),
               zlim.y = c(-1.15,1.15) )
MNI_coords <- cbind(0,0,seq(24,72,length.out = 9)) %>%
  vox2MNI() %>% t () %>% 
  subset(c(F, F, T)) %>%
  sort(decreasing = T) %>%
  matrix(3,3) %>%
  apply(2,rev)

labels <- paste("z = ",MNI_coords,sep = " ")
x <- c(0.08,0.48,.86) %>% rep(3)
y <- c(-.18, .24,.73) %>% rep(3) %>% sort()
text(x,y,labels,xpd = T, col = "white",cex=1.5)

# tstat3 Healthy vs TLE

IFP_tstat3 <- readNIfTI2("stats/stats_roi_09_tfce_corrp_tstat3.nii.gz")

ortho2(MNI,y = IFP_tstat3, col.y = cmaps$copper,xyz = c(40,54,56),crosshairs = F,
       mfrow = c(1,3),zlim.y = c(0,1),bg = "white",NA.y = T,NA.x = T)
c1 <- vox2MNI(cbind(40,54,56))

text(c(0.1,0.47,.87),c(0.1,.1,.1),paste(c("x = ", "y = ", "z = "),c1,sep = ''),
     xpd = T,col = "black",cex= 2)
text(0.5,.9 , 'I.FP\n Healthy > TLE (a)',col = "black", cex = 3)

ortho2(MNI,y = IFP_tstat3, col.y = cmaps$copper,crosshairs = F,
       mfrow = c(1,3),zlim.y = c(0,1),xyz = c(72,36,57),bg = "white",NA.x = T,NA.y = T)
c1 <- vox2MNI(cbind(72,36,57))

text(c(0.1,0.47,.87),c(0.1,.1,.1),paste(c("x = ", "y = ", "z = "),c1,sep = ''),
     xpd = T,col = "black",cex= 2)
text(0.5,.9 , 'I.FP\n Healthy > TLE (b)',col = "black", cex = 3)

#""""""""""""""""""""""""""""""""""""
#"" Ipsilateral Insula"
#""""""""""""""""""""""""""""""""""""
IINS_one_sample <- readNIfTI2("one_sample_stats/one_sample_roi11_tfce_both.nii.gz")

lightbox_axial(IINS_one_sample,underlay = MNI, cmap = c(rev(cmaps$`blue-lightblue`),cmaps$`red-yellow`),
               zlim.y = c(-1.15,1.15) )
MNI_coords <- cbind(0,0,seq(24,72,length.out = 9)) %>%
  vox2MNI() %>% t () %>% 
  subset(c(F, F, T)) %>%
  sort(decreasing = T) %>%
  matrix(3,3) %>%
  apply(2,rev)


labels <- paste("z = ",MNI_coords,sep = " ")
x <- c(0.08,0.48,.86) %>% rep(3)
y <- c(-.18, .24,.73) %>% rep(3) %>% sort()
text(x,y,labels,xpd = T, col = "white",cex=1.5)

# tstat3 Healthy vs TLE

IINS_tstat3 <- readNIfTI2("stats/stats_roi_11_tfce_corrp_tstat3.nii.gz")
CINS_tstat3 <- readNIfTI2("stats/stats_roi_10_tfce_corrp_tstat3.nii.gz")
INS <- CINS_tstat3 + IINS_tstat3
ortho2(MNI,y = CINS_tstat3, col.y = cmaps$copper,xyz = c(23,34,63),crosshairs = F,
       mfrow = c(1,3),bg="white",NA.x = T, NA.y = T,zlim.y = c(0,1))

c1 <- vox2MNI(cbind(22,36,63))

text(c(0.1,0.47,.87),c(0.1,.1,.1),paste(c("x = ", "y = ", "z = "),c1,sep = ''),
     xpd = T,col = "black",cex= 2)
text(0.5,.9 , 'I.INS\n Healthy > TLE (a)',col = "black", cex = 3)

ortho2(MNI,y = ICNS, col.y = c("aquamarine","darkred"),xyz = c(23,38,63),crosshairs = F,
       mfrow = c(1,3),bg = "white",NA.x = T)
#fsleyes (list(MNI,INS))
 c1 <- vox2MNI(cbind(23,38,63))
text(c(0.1,0.47,.87),c(0.1,.1,.1),paste(c("x = ", "y = ", "z = "),c1,sep = ''),
     xpd = T,col = "black",cex= 2)
text(0.5,.9 , 'I.INS\n Healthy > TLE (b)',col = "white", cex = 3)

# tstat  3 Healthy > TLE
CINS_tstat3 <- readNIfTI2("stats/stats_roi_10_tfce_corrp_tstat3.nii.gz")
ortho2(MNI,y = CINS_tstat3, col.y = cmaps$copper,xyz = c(24,36,62),crosshairs = F,
       mfrow = c(1,3),zlim.y = c(0,1),bg = "white")
c1 <- vox2MNI(cbind(24,36,62))

text(c(0.1,0.47,.87),c(0.1,.1,.1),paste(c("x = ", "y = ", "z = "),c1,sep = ''),
     xpd = T,col = "white",cex= 2)
text(0.5,.9 , 'C.INS\n Healthy > TLE (a)',col = "white", cex = 3)


ortho2(MNI,y = CINS_tstat3, col.y = cmaps$copper,xyz = c(21,86,41),crosshairs = F,
       mfrow = c(1,3),zlim.y = c(0,1))
c1 <- vox2MNI(cbind(21,86,41))

text(c(0.1,0.47,.87),c(0.1,.1,.1),paste(c("x = ", "y = ", "z = "),c1,sep = ''),
     xpd = T,col = "white",cex= 2)
text(0.5,.9 , 'C.INS\n Healthy > TLE (b)',col = "white", cex = 3)

#""""""""""""""""""""""""""""""""""""
#"" Contralateral Hippocampus """""""
#""""""""""""""""""""""""""""""""""""

CHIPP_one_sample <- readNIfTI2("one_sample_stats/one_sample_roi14_tfce_both.nii.gz")

lightbox_axial(CHIPP_one_sample,underlay = MNI, cmap = c(rev(cmaps$`blue-lightblue`),cmaps$`red-yellow`),
               zlim.y = c(-1.15,1.15) )
MNI_coords <- cbind(0,0,seq(24,72,length.out = 9)) %>%
  vox2MNI() %>% t () %>% 
  subset(c(F, F, T)) %>%
  sort(decreasing = T) %>%
  matrix(3,3) %>%
  apply(2,rev)


labels <- paste("z = ",MNI_coords,sep = " ")
x <- c(0.08,0.48,.86) %>% rep(3)
y <- c(-.18, .24,.73) %>% rep(3) %>% sort()
text(x,y,labels,xpd = T, col = "white",cex=1.5)

# tstat 3
CHIPP_tstat3 <- readNIfTI2("stats/stats_roi_14_tfce_corrp_tstat3.nii.gz") 
IHIPP_tstat3 <- readNIfTI2("stats/stats_roi_15_tfce_corrp_tstat3.nii.gz") 
#HIPP <- CHIPP_tstat3 + IHIPP_tstat3
ortho2(MNI,y = IHIPP_tstat3, col.y = cmaps$copper,xyz = c(33,55,30),crosshairs = F,
       mfrow = c(1,3),bg = NA,NA.x = T,NA.y = T,)
c1 <- vox2MNI(cbind(58,55,28))
#fsleyes(list(MNI,IHIPP_tstat3))

#fsleyes(list(MNI,IHIPP_tstat3))

text(c(0.1,0.47,.87),c(0.1,.1,.1),paste(c("x = ", "y = ", "z = "),c1,sep = ''),
     xpd = T,col = "black",cex= 2)
text(0.5,.9 , 'I.HIPP\n Healthy > TLE (a)',col = "black", cex = 3)
#""""""""""""""""""""""""""""""""""""
#"" Contralateral Hippocampus """""""""
#""""""""""""""""""""""""""""""""""""
IHIPP_one_sample <- readNIfTI2("one_sample_stats/one_sample_roi15_tfce_both.nii.gz")

lightbox_axial(IHIPP_one_sample,underlay = MNI, cmap = c(rev(cmaps$`blue-lightblue`),cmaps$`red-yellow`),
               zlim.y = c(-1,1) )
MNI_coords <- cbind(0,0,seq(24,72,length.out = 9)) %>%
  vox2MNI() %>% t () %>% 
  subset(c(F, F, T)) %>%
  sort(decreasing = T) %>%
  matrix(3,3) %>%
  apply(2,rev)

labels <- paste("z = ",MNI_coords,sep = " ")
x <- c(0.08,0.48,.86) %>% rep(3)
y <- c(-.18, .24,.73) %>% rep(3) %>% sort()
text(x,y,labels,xpd = T, col = "white",cex=1.5)

## tstat 4 TLE > Healthy
IHIPP_tstat4 <- readNIfTI2("stats/stats_roi_15_tfce_corrp_tstat4.nii.gz")

ortho2(MNI,y = IHIPP_tstat4, col.y = cmaps$`2winter_iso`,xyz = c(27,43,58),crosshairs = F,
      mfrow = c(1,3),zlim.y = c(0,1),bg = "white",NA.x = T)
c1 <- vox2MNI(cbind(27,43,58))

text(c(0.1,0.47,.87),c(0.1,.1,.1),paste(c("x = ", "y = ", "z = "),c1,sep = ''),
     xpd = T,col = "black",cex= 2)
text(0.5,.9 , 'I.HIPP\n Healthy < TLE (a)',col = "black", cex = 3)

ortho2(MNI,y = IHIPP_tstat4, col.y = cmaps$`2winter_iso`,xyz = c(27,43,58),crosshairs = F,
       mfrow = c(1,3),zlim.y = c(0,1))
c1 <- vox2MNI(cbind(27,43,58))

text(c(0.1,0.47,.87),c(0.1,.1,.1),paste(c("x = ", "y = ", "z = "),c1,sep = ''),
     xpd = T,col = "white",cex= 2)
text(0.5,.9 , 'I.HIPP\n Healthy < TLE (a)',col = "white", cex = 3)

