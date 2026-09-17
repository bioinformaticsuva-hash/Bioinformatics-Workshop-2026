# Processing Raw scRNA-seq Data with Cell Ranger on 10x Genomics Cloud

This page walks through processing raw scRNA-seq FASTQ files with Cell Ranger on 10x Genomics Cloud, producing output ready for downstream analysis in the Seurat pipeline.

## About the Dataset

This workshop uses two tissue biopsy samples — one pre-treatment (GSM8086070) and one post-treatment (GSM8086066) — from the scRNA-seq project **PRJNA1078290: "Immune Re-sensitization in Checkpoint Inhibitor Refractory and Relapsed Cancers with Plinabulin, Radiation and Immune Checkpoint Blockade (human)."** 

Raw reads will be processed with Cell Ranger, and the resulting count matrices will be used for downstream analysis with the Seurat pipeline.

**Reference:** Lin SH et al., "Plinabulin following radiation enhances dendritic cell maturation and checkpoint inhibitor retreatment of relapsed/refractory cancers." *Med*, 2025 Oct 10;6(10):100752.

| Sample | FASTQ Name  | Source     | Sample Info    |
|:------:|:-----------:|:----------:|:--------------:|
| 1      | SRR28016090 | GSM8086070 | Pre-treatment  |
| 2      | SRR28016098 | GSM8086066 | Post-treatment |

---

## Step 1: Copy the Cell Ranger Data from UVA Box

Copy `cellranger_data.tar.gz` from the UVA Box folder: [Bioinformatics Workshop](https://virginia.app.box.com/folder/395515355319).

## Step 2: Log in to [10x Genomics Cloud Analysis](https://cloud.10xgenomics.com/cloud-analysis)

1. Create New Project - name it "scRANseq"
2. Upload fastq files from `cellranger_data.tar.gz` 
3. Click "Start Upload" 
4. After Upload select Library option and other parameters and click Start Analysis


