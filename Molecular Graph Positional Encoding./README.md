#  Molecular graph positional encoding from SMILES: A MATLAB-Python Workflow 

Unlike texts in natural language processing (NLP), nodes in a graph do not have any canonical positional information. It has been shown that Laplacian eigenvectors can be used as node positional encoding [1]. This simple example demonstrates how [Python-MATLAB](https://www.mathworks.com/help/matlab/call-python-libraries.html) can work together to process a [SMILES](https://en.wikipedia.org/wiki/Simplified_molecular-input_line-entry_system) database and generates positional encodings (PE) as part of graph-based transformer neural networks [2].  

### Usage
Run this MATLAB Live Script: 
> MATLAB_Python_Molecular_Graph_Analysis.mlx 

### Setting up the conda environment
Set the conda environment in MATLAB using these two lines:
> Setup_Conda_Environment;

Make sure you give your python addess in the first line of 
> Setup_Conda_Environment.m    
  - pyExec = '...\anaconda3\';

### How it works
The code takes in the provided `SMILES` string, extracts the adjacency and node matrices are store the generated molecular graph in "graph_data.mat". The code then computes the [eigenvalues and eigenvectors](https://www.mathworks.com/help/matlab/ref/eig.html) of the `Laplacian` of the graph. The Laplacian PE for each node is the `k` smallest non-trivial eigenvectors [3]. 

### References
[1] Mikhail Belkin and Partha Niyogi. Laplacian eigenmaps for dimensionality reduction and data representation. [Neural computation, 15(6):1373–1396, 2003](https://direct.mit.edu/neco/article-abstract/15/6/1373/6730/Laplacian-Eigenmaps-for-Dimensionality-Reduction?redirectedFrom=fulltext).

[2] Chengxuan Ying, et. al., Do Transformers Really Perform Bad for Graph Representation?, [2106.05234.pdf (arxiv.org)](https://arxiv.org/pdf/2106.05234.pdf).

[3] Grégoire Mialon, et.al., GraphiT: Encoding Graph Structure in Transformers, [2106.05667.pdf (arxiv.org)](https://arxiv.org/pdf/2106.05667.pdf).












