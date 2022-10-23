#  Convert SMILES to Molecular Graph
![alt text](https://github.com/hjooya/Chemical-Data-Processing/blob/main/SMILES_to_Molecular%20Graph/SMILES_to_Graph.jpg)

This simple example demonstrates how to use [MATLAB](https://matlab.mathworks.com/)-[RDKit](https://www.rdkit.org/) together for molecular structure processing. Using a single molecule input, we are illustrating the construction of a high throughput workflow that process [SMILES](https://en.wikipedia.org/wiki/Simplified_molecular-input_line-entry_system) database and generates mathematical graph objects that can be then fed into graph neural networks to perform other predictive tasks. 

### Usage
Run this MATLAB Live Script: 
> MATLAB_Python_Convert_SMILES_to_Graph.mlx  

### Setting up the conda environment
Set the conda environment in MATLAB using these this code:
> Setup_Conda_Environment;

Make sure you give your python addess in the first line of 
> Setup_Conda_Environment.m    
  - pyExec = '...\anaconda3\';

### How it works
The code constructs the `adjacency matrix` of the molecular graph by converting the generated molecule object to pdb block and reading the `CONECT` records. 

The code extracts seven atomic properties from the given SMILES structure to construct the `feature matrix` including: atomic number, atomic mass, total atomic valance, atomic degree, number of hydrogens connected to the atom, atomic hybridization (“sp”, “sp2”, “sp3”), and whether or not the atom belongs to an aromatic ring. 

This example uses `molviewer` to visualize the molecular structure, which is shipped as part of MathWorks Bioinformatics toolbox. 

The output is saves as a MATLAB `.mat` file for further processing. One can then use Matlab's multiple built-in [Graph and Network Algorithms](https://www.mathworks.com/help/matlab/graph-and-network-algorithms.html) for graph strucure analysis.











