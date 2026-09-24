# Processing Raw Spatial Data with Space Ranger on UVA Rivanna

This page walks through processing raw Visium spatial FASTQ files and a tissue image with Space Ranger on UVA's Rivanna HPC system, producing output ready for downstream analysis in the Seurat pipeline.

## About the Dataset

This workshop uses one FFPE tissue section — **Human Prostate Cancer, Adenocarcinoma with Invasive Carcinoma** — from 10x Genomics' public Visium datasets.

Raw reads will be processed with Space Ranger, and the resulting spot-by-gene matrix (with spatial coordinates and the aligned tissue image) will be used for downstream analysis with the Seurat pipeline.

**Reference:** 10x Genomics. *Human Prostate Cancer, Adenocarcinoma with Invasive Carcinoma (FFPE)*. Space Ranger 1.3.0. Tissue obtained from Indivumed Human Tissue Specimens. [10xgenomics.com/datasets](https://www.10xgenomics.com/datasets/human-prostate-cancer-adenocarcinoma-with-invasive-carcinoma-ffpe-1-standard-1-3-0). Licensed under [CC BY 4.0](https://creativecommons.org/licenses/by/4.0/).

| Sample | Dataset Name                        | Source                | Sample Info                                                                 |
| ------ | ------------------------------------ | ---------------------- | ---------------------------------------------------------------------------- |
| 1      | Visium_FFPE_Human_Prostate_Cancer    | 10x Genomics Datasets  | Adenocarcinoma with invasive carcinoma, Stage III, Gleason 7, Slide V11J26-003, Area B1 |

This dataset is a good fit for a workshop because it's probe-based (FFPE), which needs far less sequencing depth than a whole-transcriptome fresh-frozen run — the whole dataset is a single 6.5mm capture area, 4,371 spots under tissue, at a mean of 23,087 reads/spot.

---

# Option-1: Run on Bioinformatics Core Server app06 

## Step 1: Login to the bioinformatics server
<code>
ssh <>@app06.bioinformatics.virginia.edu
pwd: bioinfo123

# change directory to Visum folder
cd ./Visium/Visium_FFPE_Human_Prostate_Cancer

# Run command as below
sh spaceranger_command.sh

</code>

Following is the command in spaceranger_command.sh
<code>
spaceranger count --id=prostate_cancer \
 --transcriptome=/opt/refdata-gex-GRCh38-2024-A \
 --fastqs=~/Visium/Visium_FFPE_Human_Prostate_Cancer/Visium_FFPE_Human_Prostate_Cancer_fastqs \
 --probe-set=~/Visium/Visium_FFPE_Human_Prostate_Cancer/Visium_FFPE_Human_Prostate_Cancer_probe_set.csv \
 --slide=V11J26-003 \
 --area=B1 \
 --sample=FFPE_V1_Human_Prostate_Cancer \
 --image=~/Visium/Visium_FFPE_Human_Prostate_Cancer/Visium_FFPE_Human_Prostate_Cancer_image.tif \
 --create-bam=false \
 --localcores=10 \
 --localmem=128
</code>



# Option-2: Run on your own server

## Step 1: Download the Raw Spatial Data

This dataset is hosted directly by 10x Genomics and is CC BY 4.0 licensed — no login or Box relay needed:

```
# Input Files
wget https://cf.10xgenomics.com/samples/spatial-exp/1.3.0/Visium_FFPE_Human_Prostate_Cancer/Visium_FFPE_Human_Prostate_Cancer_fastqs.tar
wget https://cf.10xgenomics.com/samples/spatial-exp/1.3.0/Visium_FFPE_Human_Prostate_Cancer/Visium_FFPE_Human_Prostate_Cancer_image.tif
wget https://cf.10xgenomics.com/samples/spatial-exp/1.3.0/Visium_FFPE_Human_Prostate_Cancer/Visium_FFPE_Human_Prostate_Cancer_Pathologist_Annotations.png

#This dataset is FFPE (probe-based), so Space Ranger also needs the matching human probe set:
wget "https://cf.10xgenomics.com/samples/spatial-exp/1.3.0/Visium_FFPE_Human_Prostate_Cancer/Visium_FFPE_Human_Prostate_Cancer_probe_set.csv"
```

Extract the FASTQs:

```
tar -xvf Visium_FFPE_Human_Prostate_Cancer_fastqs.tar
```

> Note: confirm the tissue image's exact file extension on the [dataset's Input files tab](https://www.10xgenomics.com/datasets/human-prostate-cancer-adenocarcinoma-with-invasive-carcinoma-ffpe-1-standard-1-3-0) before running — it's expected to be `.jpg`, but Space Ranger accepts `.jpg`, `.tif`, or `.png` equally, so only the filename below would need to change.

## Step 2: Download the Space Ranger Reference and Probe Set

Skip this if you already have the Human reference data from cell ranger run.
Move back up to the working directory first:


Download the [reference transcriptome](https://www.10xgenomics.com/support/software/space-ranger/downloads#reference-downloads):

```
wget "https://cf.10xgenomics.com/supp/spatial-exp/refdata-gex-GRCh38-2020-A.tar.gz"
tar -zxvf refdata-gex-GRCh38-2020-A.tar.gz
```


## Step-3: Following the process of running spaceranger on the intructors system: Alternatively, if you have access to a server then you can run following command to run spaceranger with this dataset

```
spaceranger count --id=prostate_cancer \
 --transcriptome=/opt/refdata-gex-GRCh38-2024-A \
 --fastqs=~/Visium/Visium_FFPE_Human_Prostate_Cancer/Visium_FFPE_Human_Prostate_Cancer_fastqs \
 --probe-set=~/Visium/Visium_FFPE_Human_Prostate_Cancer/Visium_FFPE_Human_Prostate_Cancer_probe_set.csv \
 --slide=V11J26-003 \
 --area=B1 \
 --sample=FFPE_V1_Human_Prostate_Cancer \
 --image=~/Visium/Visium_FFPE_Human_Prostate_Cancer/Visium_FFPE_Human_Prostate_Cancer_image.tif \
 --create-bam=false \
 --localcores=10 \
 --localmem=128
```

---

Once the job completes, check `outs/web_summary.html` first to confirm spots were called under tissue and QC metrics look reasonable. The Space Ranger output (filtered feature-barcode matrix, spatial coordinates, and aligned tissue image) will then be ready for import into the Seurat pipeline (`Load10X_Spatial()`) for downstream analysis.
