#' Extract atom information from PDB file
#'
#' This function reads a PDB file and extracts information about atoms.
#' It returns a data frame containing details such as atom serial number,
#' atom name, residue name, chain ID, residue number, coordinates, occupancy,
#' temperature factor, element symbol, and charge.
#'
#' @param file_path Path to the PDB file.
#' @return A data frame with atom information.
#' @export
#'
#' @examples
#' \dontrun{
#' pdb_data <- extract_pdb_atom_info("path/to/your/pdb.pdb")
#' }
#'
#' @rdname pdb_atoms
#' @aliases pdb_atoms extract_pdb_atom_info
#' @seealso \code{\link{readLines}}, \code{\link{grep}}, \code{\link{as.data.frame}}
#'
#' @export
pdb_atoms <- function(file_path) {
  # Read PDB file
  pdb_lines <- base::readLines(file_path)

  # Extract lines containing atom information
  atom_lines <- base::grep("^ATOM|^HETATM", pdb_lines, value = TRUE)

  # Function to extract atom information from a line
  extract_atom_info <- function(line) {
    c(
      type = base::trimws(base::substr(line, 1, 6)),
      element_number = as.numeric(base::substr(line, 7, 11)),
      element_type = base::trimws(base::substr(line, 13, 16)),
      residue = base::trimws(base::substr(line, 18, 20)),
      chain = base::substr(line, 22, 22),
      residue_number = as.numeric(base::substr(line, 23, 26)),
      x_coord = as.numeric(base::substr(line, 31, 38)),
      y_coord = as.numeric(base::substr(line, 39, 46)),
      z_coord = as.numeric(base::substr(line, 47, 54)),
      Occupancy = as.numeric(base::substr(line, 55, 60)),
      bfactor = as.numeric(base::substr(line, 61, 66)),
      element_symbol = base::trimws(base::substr(line, 77, 78)),
      charge = base::trimws(base::substr(line, 79, 80))
    )
  }

  # Apply the function to each line in the "ATOM" section
  atom_info_list <- base::lapply(atom_lines, extract_atom_info)

  # Convert the list to a data frame
  pdb_data <- base::as.data.frame(base::do.call(rbind, atom_info_list))

  return(pdb_data)
}
