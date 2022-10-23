from rdkit import Chem
from rdkit.Chem import AllChem

mol = Chem.MolFromSmiles(x)
mh = Chem.AddHs(mol)
AllChem.EmbedMolecule(mh)
pdbblock = Chem.MolToPDBBlock(mh)
open("C:/Users/hjooya/AI_in_Sciences_Project/MATLAB-Python/MATLAB_Python_GitHub/MATLAB_Python_Molecular_Graph_Analysis/pdbformat.pdb",'w').write(Chem.MolToPDBBlock(mh, flavor=4));
molpdb = "pdbformat.pdb"


















