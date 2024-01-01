This project provides R functions for downloading  Protein Data Bank (PDB) files from the {RCSB PDB}(https://www.rcsb.org/) website. The primary function at the moment is `get_pdb`.

## Functions

- `get_pdb`

## Usage

To download PDB files, use the `get_pdb` function with a vector of PDB IDs. A single pdb ID will work as well.

```R
get_pdb(c("2v18", "1mog"), path = "pdb_files", verbose = TRUE, overwrite = FALSE)
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
