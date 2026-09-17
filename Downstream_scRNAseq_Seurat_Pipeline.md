# Downstream Single-Cell RNA-seq Analysis Using the Seurat Pipeline in Google Colab

This page walks through setting up Google Colab to run the Seurat downstream analysis pipeline on the Cell Ranger output generated in [Day 1](./Processing_scRNAseq_Raw_Data.md). By the end of this setup, you'll have a Colab environment with R, Seurat, and your data ready for analysis.

## Prerequisites

- A personal Google account (for Google Colab and Google Drive)
- Completed [Day 1: Processing Raw scRNA-seq Data with Cell Ranger](./Processing_scRNAseq_Raw_Data.md), or access to the pre-generated `cellranger_output.tar` file
- A modern web browser

---

## Step 1: Log In to Google Colab

Go to [colab.research.google.com](https://colab.research.google.com) and sign in with your personal Google account.

## Step 2: Download and Open the Analysis Notebook

Download the workshop notebook — **[`01_scRNAseq_analysis.ipynb`](01_scRNAseq_analysis.ipynb)** — and open it in Google Colab (**File → Upload notebook**, or drag and drop the file into the Colab interface).

## Step 3: Copy the R Library and script.R and Cell Ranger Output from UVA Box

From the [Bioinformatics Workshop Box folder](https://virginia.app.box.com/folder/395515355319), download the following two files:

- `R_Libraries > library.tar.gz` — pre-built R package library (Seurat and dependencies), so you don't need to install packages from scratch in Colab
- `R_Libraries > script.R` — sript to set-up libraries in Colab
- `scRNA-seq > cellranger_output.tar` — the Cell Ranger output generated in Day 1

## Step 4: Upload the Files to Colab

In the Colab interface, open the **Files** panel (folder icon on the left sidebar) and upload both `library.tar.gz`, `script.R` and `cellranger_output.tar` directly into the root session storage.

<p align="center">
  <img src="Google_colab_screenshot.jpg" width="330" alt="Screenshot of the Google Colab Files panel showing R_library.tar.gz and cellranger_output.tar uploaded">
</p>

> **Note:** Colab session storage is temporary — files are cleared when the runtime disconnects or resets. If your session restarts, re-upload both files before continuing.

---

Once both files are uploaded, continue to the analysis cells in `01_scRNAseq_analysis.ipynb` to extract the library and data, load the Cell Ranger output into Seurat, and begin the QC and preprocessing steps covered on Day 1 of the workshop.
