# Processing Raw Spatial Data with Space Ranger on UVA Rivanna

This page walks through processing raw Visium spatial FASTQ files and a tissue image with Space Ranger on UVA's Rivanna HPC system, producing output ready for downstream analysis in the Seurat pipeline.

There are two datasets 

1) Visium - Human Prostate Cancer Data (https://www.10xgenomics.com/datasets/human-prostate-cancer-adenocarcinoma-with-invasive-carcinoma-ffpe-1-standard-1-3-0)
2) Visium HD - Human Kidney Data (https://www.10xgenomics.com/datasets/visium-hd-cytassist-gene-expression-libraries-human-kidney-ffpe-v4)


# Visium Prostate Cancer Data

This workshop uses one FFPE tissue section — **Human Prostate Cancer, Adenocarcinoma with Invasive Carcinoma** — from 10x Genomics' public Visium datasets.

Raw reads will be processed with spaceranger, and the resulting spot-by-gene matrix (with spatial coordinates and the aligned tissue image) will be used for downstream analysis with the Seurat pipeline.

**Reference:** 10x Genomics. *Human Prostate Cancer, Adenocarcinoma with Invasive Carcinoma (FFPE)*. Space Ranger 1.3.0. Tissue obtained from Indivumed Human Tissue Specimens. [10xgenomics.com/datasets](https://www.10xgenomics.com/datasets/human-prostate-cancer-adenocarcinoma-with-invasive-carcinoma-ffpe-1-standard-1-3-0). Licensed under [CC BY 4.0](https://creativecommons.org/licenses/by/4.0/).

| Sample | Dataset Name                        | Source                | Sample Info                                                                 |
| ------ | ------------------------------------ | ---------------------- | ---------------------------------------------------------------------------- |
| 1      | Visium_FFPE_Human_Prostate_Cancer    | 10x Genomics Datasets  | Adenocarcinoma with invasive carcinoma, Stage III, Gleason 7, Slide V11J26-003, Area B1 |

This dataset is a good fit for a workshop because it's probe-based (FFPE), which needs far less sequencing depth than a whole-transcriptome fresh-frozen run — the whole dataset is a single 6.5mm capture area, 4,371 spots under tissue, at a mean of 23,087 reads/spot.

---

## Anlysis Option-1: Run on Bioinformatics Core Server app06 (Data is already placed on this server)

### Step 1: Login to the bioinformatics server (use your computing id as login id)
```
ssh computing_id@app06.bioinformatics.virginia.edu
pwd: bioinfo123

# change directory to Visum folder
cd ./Visium/Visium_FFPE_Human_Prostate_Cancer

# Run command as below
sh spaceranger_command.sh

```

Following is the command in spaceranger_command.sh
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



## Option-2: Manually Download Data and Run on your own server

### Step 1: Download the Raw Spatial Data

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


# Visium HD Human Kidney Data

This is **Visium HD Spatial Gene Expression Library, Human Kidney (FFPE)** — from 10x Genomics' public Visium HD datasets.

Raw reads will be processed with spaceranger, and the resulting spot-by-gene matrix (with spatial coordinates and the aligned tissue image) will be used for downstream analysis with the Seurat pipeline.

**Reference:** 10x Genomics. *Visium HD Spatial Gene Expression Library, Human Kidney (FFPE)*. [10xgenomics.com/datasets](https://www.10xgenomics.com/datasets/visium-hd-cytassist-gene-expression-libraries-human-kidney-ffpe-v4). Licensed under [CC BY 4.0](https://creativecommons.org/licenses/by/4.0/).

| Sample | Dataset Name                        | Source                | Sample Info                                                                 |
| ------ | ------------------------------------ | ---------------------- | ---------------------------------------------------------------------------- |
| 1      | Visium_HD_Human_Kidney_FFPE    | 10x Genomics Datasets  | Visium HD Spatial Gene Expression Library, Human Kidney (FFPE), Slide V11J26-003, Area B1 |

---

## Anlysis Option-1: Run on 10x Genomics Cloud

### Step-1: Download Data 
Download the dataset from the 10x dataset site https://www.10xgenomics.com/datasets/visium-hd-cytassist-gene-expression-libraries-human-kidney-ffpe-v4

### Step-2: Log in to [10x Genomics Cloud Analysis](https://cloud.10xgenomics.com/cloud-analysis)

1. Create New Project - name it "Visium_HD_Kidney"
2. Upload fastq files and image files
3. Click "Start Upload" 
4. After Upload select Library option and other parameters and click Start Analysis

#### Watch the 10x walkthrough
https://github.com/user-attachments/assets/cdb9d2bf-4a86-456f-b91e-9cb59378fbb2

#### Following files should be shown on the 10x project

<img width="3792" height="1198" alt="Visium_HD_Kidney_upload" src="https://github.com/user-attachments/assets/0c17f53d-27a4-469f-84a7-080be2f09289" />

The probeset csv file has to be uploaded in the analysis step. Select all files and click **Create New Analysis** buttom on the right.

<img width="1890" height="1958" alt="Visium_HD_Kidney_Analysis_Settings" src="https://github.com/user-attachments/assets/740db59a-854d-4068-92cc-2df5a26a6aa3" />

Select the appropriate options and click **Run Analysis** button to start the **spaceranger** processing.




