# setup.R -- one-line workshop bootstrap for Colab R runtimes.
#
# Host this file at a raw URL (GitHub raw, gist, etc.) and make the first cell of
# every workshop notebook:
#
#   source("https://github.com/bioinformaticsuva-hash/Bioinformatics-Workshop-2026/main/setup.R")
#
# Safe to re-run. System libraries are installed every session (they live on the VM,
# not in the bundle); the download and extract are skipped if already done.

BUNDLE      <- ""          # direct download URL, or a local path like "/content/library.tar.gz"
GDRIVE_LINK <- ""          # optional: public Google Drive link instead of BUNDLE
LIB         <- "/content/library"
TARBALL     <- "/content/library.tar.gz"

SYSDEPS <- c("pigz", "libgsl-dev", "libhdf5-dev", "libglpk-dev",
             "libgeos-dev", "libproj-dev", "libgdal-dev", "libudunits2-dev",
             "libxml2-dev", "libcurl4-openssl-dev", "libssl-dev",
             "libfftw3-dev", "libmagick++-dev", "libcairo2-dev", "libxt-dev")

# --- 1. System libraries: ALWAYS, on every fresh runtime ----------------------
# The bundled .so files link against these. Skipping this step is what causes
# "libglpk.so.40: cannot open shared object file" when loading Seurat.
# A marker file keeps a second source() in the same session from re-running apt.
if (!file.exists("/content/.sysdeps_ok")) {
  message("Installing system libraries (~40s) ...")
  system("apt-get update -qq")
  system(paste("DEBIAN_FRONTEND=noninteractive apt-get install -y --no-install-recommends",
               paste(SYSDEPS, collapse = " ")), ignore.stdout = TRUE)
  file.create("/content/.sysdeps_ok")
}

# --- 2. Get the bundle, if it is not already unpacked ------------------------
if (!dir.exists(file.path(LIB, "Seurat"))) {

  if (!file.exists(TARBALL)) {
    if (nzchar(GDRIVE_LINK)) {
      message("Downloading from Google Drive (this is the slow part) ...")
      system("pip install -q gdown")
      system(sprintf('gdown --fuzzy "%s" -O %s', GDRIVE_LINK, TARBALL))
    } else if (grepl("^https?://", BUNDLE)) {
      message("Downloading the R library bundle (this is the slow part) ...")
      system(sprintf('wget -q --show-progress -O %s "%s"', TARBALL, BUNDLE))
    } else if (nzchar(BUNDLE) && file.exists(BUNDLE)) {
      file.copy(BUNDLE, TARBALL)
    } else {
      stop("No bundle found. Set BUNDLE to a download URL, or upload library.tar.gz to /content/")
    }
  }

  message("Extracting ...")
  system(sprintf("tar -C /content -I pigz -xf %s", TARBALL))
}

if (!dir.exists(file.path(LIB, "Seurat")))
  stop("Extract failed: ", LIB, " has no Seurat directory. Check the tarball.")

# --- 3. Point R at the library -----------------------------------------------
.libPaths(LIB)
Sys.setenv(RETICULATE_PYTHON = Sys.which("python3"))

# --- 4. Warn if the runtime does not match what the bundle was built on -------
info <- file.path(LIB, "BUILD_INFO.txt")
if (file.exists(info)) {
  built <- sub(".*: *", "", grep("^r_version", readLines(info), value = TRUE))
  if (length(built) && !identical(built, as.character(getRversion())))
    message("WARNING: bundle built on R ", built, ", this runtime is R ", getRversion(),
            " -- compiled packages may fail to load. Rebuild the bundle.")
}

# --- 5. Prove the shared libraries actually resolve ---------------------------
probe <- c("igraph", "Matrix", "Seurat")
bad <- probe[!vapply(probe, function(p) requireNamespace(p, quietly = TRUE), logical(1))]
if (length(bad)) {
  message("FAILED to load: ", paste(bad, collapse = ", "),
          "\nRun library(", bad[1], ") to see the missing lib*.so name, ",
          "then apt-get install the matching -dev package.")
} else {
  message("Library ready: ", length(rownames(installed.packages(lib.loc = LIB))),
          " packages, .libPaths()[1] = ", .libPaths()[1])
}
