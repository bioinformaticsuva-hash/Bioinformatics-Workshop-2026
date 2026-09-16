# Processing Raw scRNA-seq Data with Cell Ranger on UVA Rivanna

This page walks through processing raw scRNA-seq FASTQ files with Cell Ranger on UVA's Rivanna HPC system, producing output ready for downstream analysis in the Seurat pipeline.

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

**Create New Project



— OpenOnDemand:** Log in to the [UVA OpenOnDemand Rivanna site](https://ood.hpc.virginia.edu/pun/sys/dashboard) and copy `cellranger_data.tar.gz` into a directory under `/home/<username>/`.

**Option B — Terminal:** Log in directly via SSH:
```bash
ssh computing_id@login.hpc.virginia.edu
```

## Step 3: Create a Working Directory

```bash
mkdir Bioinformatics_Workshop
cd Bioinformatics_Workshop
```

## Step 4: Extract the Cell Ranger Data

Place `cellranger_data.tar.gz` in the `Bioinformatics_Workshop` folder, then extract it:

```bash
tar -xvf cellranger_data.tar.gz
```

## Step 5: Download the Cell Ranger Reference Dataset

Download the [reference dataset](https://www.10xgenomics.com/support/software/cell-ranger/downloads#reference-downloads) into the `Bioinformatics_Workshop` folder:

```bash
wget "https://cf.10xgenomics.com/supp/cell-exp/refdata-gex-GRCh38-2024-A.tar.gz"
tar -zxvf refdata-gex-GRCh38-2024-A.tar.gz
```

## Step 6: Process the Pre-Treatment FASTQ Files

```bash
cd cellranger_data/pretreatment
sbatch cellranger.slurm
```

## Step 7: Process the Post-Treatment FASTQ Files

```bash
cd cellranger_data/posttreatment
sbatch cellranger.slurm
```

---

Once both jobs complete, the Cell Ranger output (filtered feature-barcode matrices) for each sample will be ready for import into the Seurat pipeline for downstream analysis.
