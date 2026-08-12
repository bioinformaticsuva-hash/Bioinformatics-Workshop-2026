# Single-Cell and Spatial Transcriptomics Data Analysis Workshop

**UVA Bioinformatics Core — 4-Day Hands-On Training Program**

![UVA Bioinformatics Core](https://img.shields.io/badge/UVA-Bioinformatics%20Core-232D4B?style=flat-square)
![License](https://img.shields.io/badge/license-MIT-E57200?style=flat-square)
![R](https://img.shields.io/badge/R-Seurat-blue?style=flat-square)

Materials, notebooks, code, and datasets for the UVA Bioinformatics Core's **Single-Cell and Spatial Transcriptomics** workshop — a 4-day, hands-on-intensive training program in scRNA-seq and spatial transcriptomics data analysis.

---

## Table of Contents

- [Overview](#overview)
- [Learning Objectives](#learning-objectives)
- [Target Audience & Prerequisites](#target-audience--prerequisites)
- [Repository Structure](#repository-structure)
- [Setup Instructions](#setup-instructions)
- [Schedule](#schedule)
  - [Day 1: Introduction to Single-Cell RNA-seq and training on data processing](#day-1-introduction-to-single-cell-rna-seq)
  - [Day 2: In Practice Single-Cell RNA-seq downstream Analysis, Annotation & Dynamics](#day-2-downstream-analysis-annotation--dynamics)
  - [Day 3: Introduction to Spatial Transcriptomics and training on data processing](#day-3-spatial-transcriptomics)
  - [Day 4: In Practice Spatial Data Downstream Analysis, Visualization, Annotation and Dynamics](#day-4-spatial-transcriptomics)
- [Key Topics](#key-topics)
- [Datasets](#datasets)
- [Getting Started — Where to Begin](#getting-started--where-to-begin)
- [Abbreviations](#abbreviations)
- [Contact](#contact)

---

## Overview

This workshop provides intensive, hands-on training in the analysis of single-cell RNA sequencing (scRNA-seq) and spatial transcriptomics data for researchers, students, and laboratory personnel at UVA. Participants learn the foundations of single-cell and spatial transcriptomics technologies, then move quickly into computational practice: quality control, integration, normalization, clustering, cell type annotation, trajectory inference, cell-cell communication analysis on both single-cell and spatial data.

The majority of each day is spent working directly in **R (Seurat)** on real datasets, using cloud-based compute (UVA Research Computing / Rivanna and Google Colab), so participants leave with working, reusable analysis code rather than slides alone.

| | |
|---|---|
| **Format** | Lecture + Hands-on Practice (hands-on emphasis) |
| **Duration** | 4 Days |
| **Morning** | 9:00 – 11:00 AM Lecture |
| **Afternoon** | 11:15 AM – 4:00 PM Hands-on Practice |

---

## Learning Objectives

By the end of this workshop, participants will be able to:

- Introduction to single-cell RNA-seq technology and spatial transcriptomics platforms
- Perform quality control and preprocessing of single-cell count data, including filtering by UMI counts, gene counts, and mitochondrial content, ambient RNA correction, and doublet detection
- Execute standard downstream analysis workflows: integration, normalization, dimensionality reduction (PCA, UMAP/t-SNE), clustering, and marker gene identification using Seurat
- Annotate cell types using marker-based and reference-based (label transfer) approaches, and perform differential expression analysis between conditions and clusters
- Apply trajectory inference and cell-cell communication analysis to interpret dynamic and interactive cellular processes
- Apply reproducibility and reporting best practices for single-cell and spatial studies, including data/code sharing and standardized metadata

---

## Target Audience & Prerequisites

**Who this is for:**
- Graduate students, postdocs, and research staff planning to generate or analyze single-cell or spatial transcriptomics data
- Current wet-lab researchers who want to develop a working computational foundation in scRNA-seq/spatial analysis
- Investigators designing future single-cell or spatial transcriptomics experiments
- Bioinformatics staff and core facility personnel seeking a refresher on current single-cell/spatial tools and best practices

**Prerequisites:** Basic familiarity with R and the command line is good to have but not mandatory. No prior single-cell analysis experience required. Participants should bring a laptop.




## Schedule

### Day 1: Introduction to Single-Cell RNA-seq
*Technology Overview · QC & Preprocessing · First Clustering*

| Time | Activity |
|---|---|
| 9:00 – 11:00 AM | Lecture - Introduction to Single-Cell RNA-seq and Transition to Practice|
| 11:00 – 11:15 AM | Break |
| 11:15 AM – 12:00 PM | Practice Part 1 —  Environment set up, Data Download and Raw data processing using cell ranger and exploring output |
| 12:00 – 12:30 PM | Lunch |
| 12:30 – 4:00 PM | Practice Part 2 — Google Colab Environment setup, data loading, QC filtering, ambient correction, doublet detection, Integration, normalization, clustering, UMAP and visualization |

### Day 2: Downstream Analysis, Annotation & Dynamics
*Marker Analysis · Cell Type Annotation · Differential Expression · Trajectory Inference · Cell–Cell Communication*

| Time | Activity |
|---|---|
| 9:00 – 11:00 AM | Lecture - Single-cell RNA-seq Downstream and Advance Analysis Overview and Transition to Practice|
| 11:00 – 11:15 AM | Break |
| 11:15 AM – 12:00 PM | Practice Part 1 — Marker Analysis and Differential Expression|
| 12:00 – 12:30 PM | Lunch |
| 12:30 – 4:00 PM | Practice Part 2 — Celltype Annotation, Trajectory Inference and Cell–Cell Communication|

### Day 3: Spatial Transcriptomics
*Platform Overview · Introduction to Spatial QC · Processing Raw data · Seurat Processing *

| Time | Activity |
|---|---|
| 9:00 – 11:00 AM | Lecture - Introduction to Spatial Transcriptomics data and Transition to Practice|
| 11:00 – 11:15 AM | Break |
| 11:15 AM – 12:00 PM | Practice Part 1 - Environment set up, Data Download and Raw data processing using space ranger and exploring output|
| 12:00 – 12:30 PM | Lunch |
| 12:30 – 4:00 PM | Practice Part 2 — Google Colab Environment setup, data loading, Seurat Pre-processing, Normalization, Marker Analysis and pseudobulk Analyis|


### Day 4: Spatial Transcriptomics
*Spatial cell type annotation · Trajectory Analysis · cell-cell communication · Wrap-up*

| Time | Activity |
|---|---|
| 9:00 – 11:00 AM | Lecture - Spatial Transcriptomics Downstream Advance Analysis and Transition to Practice|
| 11:00 – 11:15 AM | Break |
| 11:15 AM – 12:00 PM | Practice Part 1 — Spatial data Celltype annotation|
| 12:00 – 12:30 PM | Lunch |
| 12:30 – 3:00 PM | Practice Part 2 —  Trajectory Analyis, Cell type annotation |


---

## Key Topics

- Introduction to single-cell RNA-seq (Day 1)
- Single-Cell data processing using cell ranger and Downstream analysis, QC, filtering, and preprocessing in Seurat (Day 1)
- Ambient RNA correction, Doublet detection, filtering, Integration, Normalization, dimensionality reduction, clustering and Visuzlization (Day 1)
- Single-Cell RNA-seq marker gene identification, Cell type annotation, differential expression (Day 2)
- Single-Cell RNA-seq Trajectory analysis and cell-cell communication analysis and Introduction to Spatial transcriptomics platforms, QC, and processing — 10x Visium until Marker identification (Day 3)
- Spatial transcriptomics pseudo-bulk analysis, cell type annotation, Trajectory analysis and cell-cell communication (Day 4)


## Datasets

| Analysis | Dataset | Platform | Data Source | Used In | Link |
|---|---|---|---|---|---|
|scRNA-seq| Lin SH et al., Med, 2025 Oct 10;6(10):100752 | 10x Genomics | GEO/SRA Datasets | Day 1–2 | *[PRJNA1078290](https://www.ncbi.nlm.nih.gov/search/all/?term=PRJNA1078290)* |
|Spatial Data| Visium tissue dataset | 10x Genomics - Visium | 10x Genomics Datasets | Day 3 | *[link](https://www.10xgenomics.com/datasets/human-prostate-cancer-adenocarcinoma-with-invasive-carcinoma-ffpe-1-standard-1-3-0)* |

---

## Abbreviations

| Term | Definition | Term | Definition |
|---|---|---|---|
| scRNA-seq | Single-Cell RNA Sequencing | UMAP | Uniform Manifold Approximation and Projection |
| PCA | Principal Component Analysis | t-SNE | t-Distributed Stochastic Neighbor Embedding |
| UMI | Unique Molecular Identifier | QC | Quality Control |
| DE | Differential Expression | SCT | SCTransform (normalization method) |
| HVG | Highly Variable Genes | FFPE | Formalin-Fixed Paraffin-Embedded (tissue) |


---

## Getting Started — Where to Begin

This workshop builds sequentially — Day 1's Cell Ranger output feeds directly into Day 2's Seurat analysis.

### 🧬 Day 1 — Start Here: Processing the Raw Dataset

- 📄 **[Processing Raw scRNA-seq Data with Cell Ranger on UVA Rivanna](Processing_scRNAseq_Raw_Data.md)**

Begin the workshop by processing the pre- and post-treatment FASTQ files (GSM8086070, GSM8086066) through Cell Ranger on Rivanna. This produces the count matrices used throughout the rest of the workshop.

- 📄 **[Analysis of Processed Cell Ranger Output on Google Colab Cloud (Seurat Pipeline)](Downstream_scRNAseq_Seurat_Pipeline.md)**



### 🔬 Day 2 — Downstream Analysis, Annotation & Dynamics

Cell type annotation, differential expression between pre- and post-treatment samples, trajectory inference, and cell-cell communication analysis, built on the Day 1 Cell Ranger output.

- 📄 **[Continuing on scRNA-seq Seurat Analyis Day-2 on Google Colab Cloud (Seurat Pipeline)](Day-2_Downstream_scRNAseq_Seurat_Pipeline.md)**


### 🧫 Day 3 — Spatial Transcriptomics: Processing the Raw Dataset

- 📄 **[Processing Raw spatial Data with Space Ranger on UVA Rivanna](Processing_spatial_Raw_Data.md)**

Start processing the Visium FFPE Human Prostate Cancer data through Space Ranger on Rivanna. This produces the count matrices used throughout the rest of the workshop.

- 📄 **[Analysis of Processed Space Ranger Output on Google Colab Cloud (Spatial Seurat Pipeline)](Day-3_Downstream_Spatial_Seurat_Pipeline.md)**


Spatial data QC, space ranger processing, seurat pipiline with normalization, clustering, visualization, marker analysis, cell type annotation, cell-cell communication.

### 🧫 Day 4 — Spatial Transcriptomics: Downstream Analysis
Start processing on day-4 with cell type annotation, trajectory analyiss and cell-cell communication.

- 📄 **[Continuing on spatial transciptomcis Google Colab Cloud (Spatial Seurat Pipeline)](Day-3_Downstream_Spatial_Seurat_Pipeline.md)**

---




## Contact

**UVA Bioinformatics Core**
📍 *1312 Pinn Hall*
✉️ *add contact email*
🌐 *[uva bioinformatics core](https://med.virginia.edu/bioinformatics-core/)*

---

*Materials developed and maintained by the UVA Bioinformatics Core. For educational use.*
