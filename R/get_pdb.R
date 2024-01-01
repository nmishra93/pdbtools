#' Download a file from a given URL to a specified destination.
#'
#' This function downloads a file from a provided URL and saves it to the specified destination.
#'
#' @param url The URL of the file to be downloaded.
#' @param destination The local path where the file will be saved.
#' @param quiet If TRUE, suppress download progress messages (default is FALSE).
#' @return Returns 0 if the download is successful, and 1 if an error occurs.
#' @export
download_file <- function(url, destination, quiet = FALSE) {
  dl_method <- if (quiet) "quiet" else "auto"
  dl_status <- try(download.file(url, destination, method = dl_method), silent = TRUE)
  if (inherits(dl_status, "try-error")) {
    return(1)
  }
  return(0)
}

#' Download Protein Data Bank (PDB) files for given PDB IDs.
#'
#' This function downloads PDB files from the RCSB PDB website for the specified PDB IDs.
#'
#' @param pdb_id A character vector containing PDB IDs.
#' @param path The local directory where PDB files will be saved (default is current working directory).
#' @param verbose If TRUE, display download progress messages (default is TRUE).
#' @param overwrite If TRUE, overwrite existing files with the same name (default is FALSE).
#' @return Returns a character vector with the paths to the downloaded PDB files.
#' @export
get_pdb <- function(pdb_id, path = ".", verbose = TRUE, overwrite = FALSE) {
  if (!is.character(pdb_id) || length(pdb_id) == 0) {
    stop("Input 'ids' must be a non-empty character vector.")
  }

  if (!file.exists(path)) {
    dir.create(path)
  }

  # Extract 4-character PDB IDs
  pdb_id_4char <- substr(pdb_id, 1, 4)

  # Construct file names and URLs
  pdb_files <- paste(pdb_id_4char, ".pdb", sep = "")
  get_files <- file.path("http://www.rcsb.org/pdb/files", pdb_files)
  put_files <- file.path(path, pdb_files)

  for (k in seq_along(pdb_files)) {
    if (!file.exists(put_files[k]) || overwrite) {
      dl_status <- download_file(get_files[k], put_files[k], quiet = !verbose)
      if (dl_status != 0) {
        warning(paste("Download failed for", get_files[k], ". Skipping."))
        file.remove(put_files[k])
      }
    } else {
      warning(paste("PDB file", put_files[k], "already exists in the folder.",
                    "Use `overwrite = TRUE` to force download."))
    }
  }

  return(put_files)
}
