This project provides R functions for downloading  Protein Data Bank (PDB) files from the [RCSB PDB](https://www.rcsb.org/) website. The primary function at the moment is `get_pdb`.

## Functions

- `get_pdb`
- `pdb_atoms`
- `trim`

## Usage

To download PDB files, use the `get_pdb` function with a vector of PDB IDs. A single pdb ID will work as well.

```R
get_pdb(c("2v18", "1mog"), path = "pdb_files", verbose = TRUE, overwrite = FALSE)
```

To read the PDB files into R, use the `pdb_atoms` function. This function reads a single PDB file and returns a data frame with the 3d coordinates.
- might add the ability to read multiple PDB files at once and store each one as a list element.

```R
pdb_atoms("path/to/you/pdb.pdb")
```

### for future internal use.
The trim function in R is designed to clean up text lines by removing leading and trailing white spaces, as well as dropping empty lines.

```R
cleaned_lines <- trim(lines)
```

## Installation

```R
# Install the devtools package if not already installed
if (!requireNamespace("devtools", quietly = TRUE)) {
  install.packages("devtools")
}

# Install the project from GitHub
devtools::install_github("nmishra93/pdbtools")
```

## Contributions

Contributions are welcome! If you encounter any issues or have suggestions for improvements, please open an [issue](https://github.com/nmishra93/pdbtools/issues) or create a pull request.

## License

This project is licensed under the MIT License - see the [License](LICENSE.md) file for details.
