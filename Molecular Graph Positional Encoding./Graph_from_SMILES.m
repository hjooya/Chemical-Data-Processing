function [compound,padAdj,atomsymbols] = Graph_from_SMILES(SMILES)

% Construct adjacency matrix for molecular graph
% We now convert the generated molecule object to pdb block. 
% This allows us to easily use the CONECT records to construct the adjacency matric of the molecular graph object in MATLAB. 
% Make sure that set the path correctly (in the python file) that the generated pdb file is stored. 

pdbout = pyrunfile("MolToPDBBlock.py","molpdb",x=SMILES);
pdbfile = string(pdbout);

% This MATLAB function reads the pdb file and constructs the corresponding adjacency matrix.

Adj = pdbToADJ(pdbfile);
Adjmat = Adj;

% When molecule consists of less than certain number of atoms, 
% there will be padded zeros. Remove any padded zeros. 
% Remove padded zeros from the data, i.e. make it a square matrix the size:

NumAtoms = pyrunfile("GetNumAtoms.py","numatom",x=SMILES);
NumAtm=int64(NumAtoms);
padAdj = Adjmat(1:NumAtm, 1:NumAtm);

% Construct node feature matrix for molecular graph
% The following function extract seven atomic features from the above given SMILES structure. 
% The node/feature matrix include: 
% atomic number, atomic mass, total atomic valance, atomic degree, number of hydrogens connected to the atom,
% atomic hybridization ("sp", “sp2”, “sp3”), and whether the atom belongs to an aromatic ring. 

NodeData = pyrunfile("GetNodeFeaturesMatrix.py","nodedat",x=SMILES);
Nodefile = string(NodeData);
nodefeat = dlmread('NodeFeaturesMatrix.dat');
nodesym = nodefeat(1:size(NumAtm,1));
nodesym = nodefeat(:);

% Construct and visualize molecular graph
% Now that we have both the adjacency and feature matrices, 
% we can use MATLAB graph function to build the moecular graph and plot it.

save('graph_data.mat',"padAdj","nodefeat");
atomsymbols = Symbols(nodesym,NumAtm);
compound = graph(padAdj);

end