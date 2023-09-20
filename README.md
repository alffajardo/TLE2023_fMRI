
<div align="center">

  <img src="https://www.roadtrafficsigns.com/img/lg/K/Under-Construction-Sign-K-7181.gif" width="100" height="100" />
</div>

 <br> 
 <br> 

**Description:** 

Repository to share code used in  [Fajardo-Valdez & Camacho-Tellez et al. (2022)](https://www.medrxiv.org/content/10.1101/2022.08.02.22278343v1)

# Zstats maps and volumes

In this Section, we provide interactive visualizations of our results in MNI152 Space.

## Main Figures

### <u>RS-fMRI functional connectivity analysis</u>

#### 1. Table 1: [DMN-TPN template](https://htmlpreview.github.io/?https://raw.githubusercontent.com/alffajardo/TLE2023_fMRI/main/zstat_maps/rs-analysis_templates/fc_template_thr.html)

<img src="https://github.com/alffajardo/TLE2023_fMRI/blob/main/zstat_maps/blue_red_colormap.png" width="200" height="90"/>

 
| Index | Cluster                                         | Abbr     | X   | Y   | Z   |
| ----- | ----------------------------------------------- | -------- | --- | --- | --- |
| 1     | Ipsilateral Middle Temporal Gyrus (Temporal-Occipital) | I.MTG-TO | -56 | -62 | 0   |
| 2     | Contralateral Middle Tempora Gyrus (Temporal-Occipital) | C.MTG-TO | 60  | -54 | -4  |
| 3     | Contralateral Hippocampus                               | C.HIPP   | 26  | -16 | -16 |
| 4     | Ipsilateral Precentral Gyrus                           | I.PrG    | -28 | -6  | 52  |
| 5     | Ipsilateral Hippocampus                                | I.HIPP   | -24 | -18 | -16 |
| 6     | Ipsilateral Superior Parieto-Occipital sulcus          | I.SLOC   | -18 | -70 | 50  |
| 7     | Contralateral Precuneous                                | C.PRC    | 14  | -34 | 44  |
| 8     | Contralateral Parieto Occipital sulcus                  | C.SLOC   | 18  | -70 | 54  |
| 9     | Contralateral Middle Temporal Gyrus                     | C.MTG    | 62  | -4  | -16 |
| 10    | Ipsilateral Frontal Pole                               | I.FP     | -38 | 42  | 34  |
| 11    | Paracingulate Gyrus                             | PCG      | 4   | 12  | 52  |
| 12    | Contralateral Frontal Pole                              | C.FP     | 38  | 46  | 30  |
| 13    | Ipsilateral Middle Temporal Gyrus                      | I.MTG    | -62 | -8  | 14  |
| 14    | Ipsilateral Insula                                     | I.INS    | -32 | 16  | 8   |
| 15    | Contralateral posterior parietal lobe                   | C.PPL    | 52  | -60 | 32  |
| 16    | Ipsilateral Supramarginal Gyrus                        | I.SMG    | -62 | -36 | 38  |
| 17    | Contralateral Supramarginal Gyrus                       | C.SMG    | 62  | -32 | 42  |
| 18    | Ipsilateral posterior parietal lobe                    | I.PPL    | -55 | -66 | 34  |
| 19    | Contralateral Insula                                    | C.INS    | 34  | 18  | 6   |
| 20    | Posterior Cingulate Cortex                      | PCC      | -8  | -56 | 26  |
| 21    | VentroMedial Prefrontal Cortex                  | VmPFC    | 0   | 54  | -6  |



#### 3. [Functional Connectivity Matrices](https://htmlpreview.github.io/?https://raw.githubusercontent.com/alffajardo/TLE2023_fMRI/main/zstat_maps/rs-analysis_templates/fc_matrices.html)

   <img src="https://github.com/alffajardo/TLE2023_fMRI/blob/main/zstat_maps/rs-analysis_templates/example_fc_mat.png" width="400" height="400" />

---

### Sternberg's Task-fMRI analysis

#### 1. Fig 5c - Positive Neural Correlates of Sternberg's Task: [Retention Phase Zstat map](https://htmlpreview.github.io/?https://raw.githubusercontent.com/alffajardo/TLE2023_fMRI/main/zstat_maps/fig5C/zstat1.html)

#### 2. Fig 6a: [Retention Phase - GLM Cognition Associated regions](https://htmlpreview.github.io/?https://raw.githubusercontent.com/alffajardo/TLE2023_fMRI/main/zstat_maps/fig6A/sum_cors.html)

#### 3. Fig 6b: [Retention Phase - ANCOVA Cognition Associated regions ](https://htmlpreview.github.io/?https://raw.githubusercontent.com/alffajardo/TLE2023_fMRI/main/zstat_maps/fig6B/sum_ancovas.html)

   <img src="https://github.com/alffajardo/TLE2023_fMRI/blob/main/zstat_maps/figS6_colorbar.png" width="300" height="200" />


---

### RS-SCA of Working memory (Sternberg's Task) associated ROIs

#### 1. Fig 6c.1 - Significant SCA voxels : 
[Ipsilateral Hippocampus](https://htmlpreview.github.io/?https://raw.githubusercontent.com/alffajardo/TLE2023_fMRI/main/zstat_maps/fig6C/one_sample_stats/I_hipp.html) | 
[Ipsilateral Supramarginal Gyrus](https://htmlpreview.github.io/?https://raw.githubusercontent.com/alffajardo/TLE2023_fMRI/main/zstat_maps/fig6C/one_sample_stats/I_Supp.html) |
[Ipsilateral Frontal Pole](https://htmlpreview.github.io/?https://github.com/alffajardo/TLE2023_fMRI/blob/main/zstat_maps/fig6C/one_sample_stats/I_FP.html) | 
[Ipsilateral Insula](https://htmlpreview.github.io/?https://raw.githubusercontent.com/alffajardo/TLE2023_fMRI/main/zstat_maps/fig6C/one_sample_stats/I_INS.html) | 
[Contralateral Insula](https://htmlpreview.github.io/?https://github.com/alffajardo/TLE2023_fMRI/blob/main/zstat_maps/fig6C/one_sample_stats/C_INS.html)

#### 2. Fig 6c.2 - SCA Between-Group Voxelwise Differences:
[Ipsilateral Hippocampus](https://htmlpreview.github.io/?https://github.com/alffajardo/TLE2023_fMRI/blob/main/zstat_maps/fig6C/group_stats/I.hipp_group.html) |
[Ipsilateral Supramarginal Gyrus](https://htmlpreview.github.io/?https://github.com/alffajardo/TLE2023_fMRI/blob/main/zstat_maps/fig6C/group_stats/I.Supp_group.html) |
[Ipsilateral Frontal Pole](https://htmlpreview.github.io/?https://github.com/alffajardo/TLE2023_fMRI/blob/main/zstat_maps/fig6C/group_stats/I.FP_group.html) |
[Ipsilateral Insula](https://htmlpreview.github.io/?https://github.com/alffajardo/TLE2023_fMRI/blob/main/zstat_maps/fig6C/group_stats/I.INS.html) | 
[Contralateral Insula](https://htmlpreview.github.io/?https://github.com/alffajardo/TLE2023_fMRI/blob/main/zstat_maps/fig6C/group_stats/C.INS_group.html)



<div align="center">
  <img src="https://github.com/alffajardo/TLE2023_fMRI/blob/main/zstat_maps/fig6C/art_brain.png" width="400" height="380" />
                                        
</div>

---
## Supplementary Figures

#### Fig 6S.a - GLM & ANCOVA Cognition Associated maps: 
[AMI](https://htmlpreview.github.io/?https://raw.githubusercontent.com/alffajardo/TLE2023_fMRI/main/zstat_maps/figS6_glm/AMI.html) |
[DMI](https://htmlpreview.github.io/?https://raw.githubusercontent.com/alffajardo/TLE2023_fMRI/main/zstat_maps/figS6_glm/DMI.html) |
[IMI](https://htmlpreview.github.io/?https://raw.githubusercontent.com/alffajardo/TLE2023_fMRI/main/zstat_maps/figS6_glm/IMI.html) |
[PR](https://htmlpreview.github.io/?https://raw.githubusercontent.com/alffajardo/TLE2023_fMRI/main/zstat_maps/figS6_glm/PR.html) |
[PS](https://htmlpreview.github.io/?https://raw.githubusercontent.com/alffajardo/TLE2023_fMRI/main/zstat_maps/figS6_glm/PS.html) |
[VCI](https://htmlpreview.github.io/?https://raw.githubusercontent.com/alffajardo/TLE2023_fMRI/main/zstat_maps/figS6_glm/VCI.html) |
[VMI](https://htmlpreview.github.io/?https://raw.githubusercontent.com/alffajardo/TLE2023_fMRI/main/zstat_maps/figS6_glm/VMI.html) |
[VWMI](https://htmlpreview.github.io/?https://raw.githubusercontent.com/alffajardo/TLE2023_fMRI/main/zstat_maps/figS6_glm/VWMI.html) |
[VMI](https://htmlpreview.github.io/?https://raw.githubusercontent.com/alffajardo/TLE2023_fMRI/main/zstat_maps/figS6_glm/WMI.html) 
